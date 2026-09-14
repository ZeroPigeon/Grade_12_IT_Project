unit VehicleMove;

interface

uses
  Vcl.ExtCtrls, A_Star_PathFinding, Grid_Node, Collision, DataBaseModule, Math;

  type
  TVehicle = class
    private
    fSpeed, fBackupSpeed : Integer;
    fUp, fDown, fLeft, fRight : Boolean;

    fLastX, fLastY, fPreviousDir, fPreviousRec : Integer;
    Path : A_Star;
    ArrayGrid : TGridArray;
    fStopped : Boolean;
    fStopTimer : Real;

    public

    fVehicle : TPanel;
    fDir, fDirection, fCurrentDirX, fCurrentDirY : Integer;
    DirectionsArray : arrDirections;
    fVehicleID : String;

    constructor create(iCurrentDirX, iCurrentDirY, iSpeed, iDirection : Integer; Vehicle : TPanel; sVehicleID : String);
    destructor Destroy; override;
    procedure Vertical(Vehicle : TPanel);
    procedure Horizontal(Vehicle : TPanel);
    procedure MoveVehicle(iNewDirection : Integer; DeltaTime : Double);
    procedure MoveUp(DeltaTime : Double);
    procedure MoveDown(DeltaTime : Double);
    procedure MoveRight(DeltaTime : Double);
    procedure MoveLeft(DeltaTime : Double);
    procedure InitializeVehicle(arrGrid : TGridArray);
    procedure UpdateVehicle(iDirection : Integer; Collider : TCollision; DeltaTime : Double);

  end;

implementation

{ TVehicle }

constructor TVehicle.create(iCurrentDirX, iCurrentDirY, iSpeed, iDirection : Integer; Vehicle : TPanel; sVehicleID : String);
begin

  //Assigns the starting direction to ensure that the vehicle is facing the correct direction
  fCurrentDirX := iCurrentDirX;
  fCurrentDirY := iCurrentDirY;
  fVehicle := Vehicle;
  fSpeed := iSpeed;
  fBackupSpeed := iSpeed;
  fDirection := iDirection;
  fVehicleID := sVehicleID;

  //Resets all the boolean values to ensure that no double values are selected
  fUp := false;
  fDown := false;
  fRight := false;
  fLeft := false;

  //Sets the boolean direction and the facing direction of the vehicle based
  //on its initial direction
  if fCurrentDirX = 1 then
  begin

    Horizontal(Vehicle);

  end else if fCurrentDirX = -1 then
  begin

    Horizontal(Vehicle);

  end else if fCurrentDirY = -1 then
  begin

    Vertical(Vehicle);

  end else if fCurrentDirY = 1 then
  begin

    Vertical(Vehicle);

  end;


end;

destructor TVehicle.Destroy;
begin

  //Free up memory to ensure no memory leaks
  Path.Free;
  inherited;
end;

procedure TVehicle.Horizontal(Vehicle: TPanel);
begin

  //Adjusted the vehicles size to make it look like its facing right or left
  Vehicle.Width := 40;
  Vehicle.Height := 11;

end;

procedure TVehicle.InitializeVehicle(arrGrid: TGridArray);
var
  iAddress, iX, iY : Integer;
begin

    //Assigns variables
    fPreviousRec := 0;
    fLastX := Floor(fVehicle.Left / 30);
    fLastY := FLoor(fVehicle.Top / 30);
    fDir := 0;
    ArrayGrid := arrGrid;

    //Assign a random destination point to a vehicle to simnulate
    //multiple vehciles moving around the map
    With DBModule do
    begin

      Repeat

        iAddress := RandomRange(1, tblAccount.RecordCount + 1);

        tblAccount.RecNo := iAddress;

        if tblAccount['Address'] = '---' then
        begin

          fPreviousRec := iAddress;

        end;

      Until NOT(iAddress = fPreviousRec);

      iX := tblAccount['AddressX'];
      iY := tblAccount['AddressY'];

      tblVehicle.Locate('VehicleID', fVehicleID, []);
      tblVehicle.Edit;
      tblVehicle['DailyDelivery'] := tblVehicle['DailyDelivery'] + 1;
      tblVehicle.Post;

      fPreviousRec := iAddress;

      Path := A_Star.create(ArrayGrid[fLastX, fLastY], ArrayGrid[iX, iY], ArrayGrid);

    end;

    DirectionsArray := Copy(Path.Directions, 0, Length(Path.Directions));

    fStopped := false;
    fStopTimer := 0;

end;

procedure TVehicle.MoveDown(DeltaTime : Double);
begin

  //Move the vehicle Down by adding a small amount of pixels to its current
  //current poistion every frame
  fVehicle.Top := fVehicle.Top + Round(fSpeed * DeltaTime);

end;

procedure TVehicle.MoveLeft(DeltaTime : Double);
begin

  //Move the vehicle Left by adding a small amount of pixels to its current
  //current poistion every frame
  fVehicle.Left := fVehicle.Left - Round(fSpeed * DeltaTime);

end;

procedure TVehicle.MoveRight(DeltaTime : Double);
begin

  //Move the vehicle Right by adding a small amount of pixels to its current
  //current poistion every frame
  fVehicle.Left := fVehicle.Left + Round(fSpeed * DeltaTime);

end;

procedure TVehicle.MoveUp(DeltaTime : Double);
begin

  //Move the vehicle Up by adding a small amount of pixels to its current
  //current poistion every frame
  fVehicle.Top := fVehicle.Top - Round(fSpeed * DeltaTime);

end;

procedure TVehicle.MoveVehicle(iNewDirection : Integer; DeltaTime : Double);
begin

  //Assigns the direction that the vehicle should turn into and move
  case iNewDirection of
  1: begin
      fUp := true;
      fDown := false;
      fRight := false;
      fLeft := false;
      if fSpeed = 0 then
        fSpeed := fBackupSpeed;
    end;
  2: begin
      fUp := false;
      fDown := false;
      fRight := true;
      fLeft := false;
      if fSpeed = 0 then
        fSpeed := fBackupSpeed;
    end;
  3: begin
      fUp := false;
      fDown := true;
      fRight := false;
      fLeft := false;
      if fSpeed = 0 then
        fSpeed := fBackupSpeed;
    end;
  4: begin
      fUp := false;
      fDown := false;
      fRight := false;
      fLeft := true;
      if fSpeed = 0 then
        fSpeed := fBackupSpeed;
    end;
  5: fSpeed := 0;
  end;


  //Moves the vehicle in the new direction until another direction is given
  if fUp then
  begin

    MoveUp(DeltaTime);
    fCurrentDirX := 0;
    fCurrentDirY := 1;

  end else if fDown then
  begin

    MoveDown(DeltaTime);
    fCurrentDirX := 0;
    fCurrentDirY := -1;

  end else if fRight then
  begin

    MoveRight(DeltaTime);
    fCurrentDirX := 1;
    fCurrentDirY := 0;

  end else if fLeft then
  begin

    MoveLeft(DeltaTime);
    fCurrentDirX := -1;
    fCurrentDirY := 0;

  end;

end;

procedure TVehicle.UpdateVehicle(iDirection: Integer; Collider: TCollision;
  DeltaTime: Double);
var
    fCurrentX, fCurrentY, iAddress, iX, iY : Integer;
begin

    //Update vehicle each time it gets called, stops vehicle if needed
    //and updates the vehicles position if the vehicle moves
    fCurrentX := Floor(fVehicle.Left / 30);
    fCurrentY := Floor(fVehicle.Top / 30);
    fDirection := iDirection;

    if (fDirection <> 5) then
    begin

      fPreviousDir := fDirection;

    end else if Not(fStopped) then
    begin

      fStopTimer := Collider.StopTimer;
      fStopped := true;

    end;

    if fStopTimer > 0 then
    begin

      fStopTimer := fStopTimer - DeltaTime;

    end;

    if (fStopTimer <= 0) AND (fDir + 1 = Length(DirectionsArray)) then
    begin

       With DBModule do
      begin

        Repeat

          iAddress := RandomRange(1, tblAccount.RecordCount + 1);

          tblAccount.RecNo := iAddress;

          if tblAccount['Address'] = '---' then
          begin

            fPreviousRec := iAddress;

          end;


        Until NOT(iAddress = fPreviousRec);

        fPreviousRec := iAddress;
        iX := tblAccount['AddressX'];
        iY := tblAccount['AddressY'];

        tblVehicle.Locate('VehicleID', fVehicleID, []);
        tblVehicle.Edit;
        tblVehicle['DailyDelivery'] := tblVehicle['DailyDelivery'] + 1;
        tblVehicle.Post;

      end;

      fDir := 0;
      Path.Free;
      Path := A_Star.create(ArrayGrid[fCurrentX, fCurrentY], ArrayGrid[iX, iY], ArrayGrid);
      DirectionsArray := Path.Directions;
      fDirection := fPreviousDir;
      fStopped := false;

    end;

    if (NOT(fCurrentX = fLastX) OR NOT(fCurrentY = fLastY)) AND NOT((fDir + 1) = Length(DirectionsArray)) then
    begin

      Inc(fDir, 1);

    end;

    fLastX := fCurrentX;
    fLastY := fCurrentY;

end;


procedure TVehicle.Vertical(Vehicle: TPanel);
begin

  //Changes the vehicles size to make it look as if the vehicle is moving up or down
  Vehicle.Width := 11;
  Vehicle.Height := 40;

end;

end.
