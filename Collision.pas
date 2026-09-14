unit Collision;

interface

uses
  Vcl.ExtCtrls, Vcl.Dialogs, Math;

type

  //Array = contains all collision coordinates/lines
  TStaticInt2DArray = Array[1..6, 1..2] of Integer;
  TStaticInt2DArray2 = Array[1..4, 1..2] of Integer;

  TCollision = class
    private
    fRayOriginX, fRayOriginY, fTurnDirX, fTurnDirY, fSegS, fSegE, fCurrentDirection : Integer;
    fSegmentPos1 : TStaticInt2DArray;
    fSegmentPos2 : TStaticInt2DArray2;
    fUp, fDown, fRight, fLeft : Boolean;
    fvehicle : TPanel;
    public

    StopTimer : Real;
    //Allows other classes or forms to access the variable and read its value
    property IntDir : Integer read fCurrentDirection;

    constructor create(const arrSegmentPos1 : TStaticInt2DArray; const arrSegmentPos2 : TStaticInt2DArray2; Obj : TPanel);
    procedure RayCast(iRayOriginX, iRayOriginY, iTurnDirX, iTurnDirY, iDirection: Integer);
    procedure Up(_vehicle : TPanel);
    procedure Down(_vehicle : TPanel);
    procedure Right(_vehicle : TPanel);
    procedure Left(_vehicle : TPanel);
  end;


implementation

{ TCollision }

constructor TCollision.create(const arrSegmentPos1 : TStaticInt2DArray; const arrSegmentPos2 : TStaticInt2DArray2; Obj : TPanel);
begin

  //Assigns the variables that will stay constant
  fvehicle := Obj;

  fSegmentPos1 := arrSegmentPos1;
  fSegmentPos2 := arrSegmentPos2;

end;

procedure TCollision.Down(_vehicle: TPanel);
begin

    //Changes the vehicle size and direction boolean to move down
    _vehicle.Width := 11;
    _vehicle.Height := 40;
    fCurrentDirection := 3;

end;

procedure TCollision.Left(_vehicle: TPanel);
begin

    //Changes the vehicle size and direction boolean to move left
    _vehicle.Width := 40;
    _vehicle.Height := 11;
    fCurrentDirection := 4;

end;

procedure TCollision.RayCast(iRayOriginX, iRayOriginY, iTurnDirX, iTurnDirY, iDirection: Integer);
  var
    i : Integer;
begin

  //Assign all values to respected variables
  fRayOriginX := iRayOriginX;
  fRayOriginY := iRayOriginY;
  fTurnDirX := iTurnDirX;
  fTurnDirY := iTurnDirY;
  fSegS := 0;
  fSegE := 0;
  fCurrentDirection := iDirection;

  //ShowMessage('Test');

  //Sets boolean values for later use
  fUp := false;
  fLeft := false;
  fRight := false;
  fDown := false;

  if (fTurnDirX = 1) AND (fTurnDirY = 1) then
  begin

    fCurrentDirection := 5;
    StopTimer := RandomRange(8, 13);
    Exit;

  end;

  //Changes the boolean value of the current direction based on the value given
  //e.g. 1: Up. 2: Right, 3: Down, 4: Left
  case fCurrentDirection of
  1: begin
      fUp := true;
      fDown := false;
      fRight := false;
      fLeft := false;
    end;
  2: begin
      fUp := false;
      fDown := false;
      fRight := true;
      fLeft := false;
    end;
  3: begin
      fUp := false;
      fDown := true;
      fRight := false;
      fLeft := false;
    end;
  4: begin
      fUp := false;
      fDown := false;
      fRight := false;
      fLeft := true;
    end;
  5: Exit;
  end;

  //Checks if the the vehicle wants to trun up or down
  if (fTurnDirY = 1) OR (fTurnDirY = -1) then
  begin

    //Checks if the vehicle is moving right or left to adjust the raycast check accordingly
    if fRight then
    begin

      //Moves te raycast starting point back to ensure that the vehicle turns into
      //the middle of the road and not into an offset position
      fRayOriginX := fRayOriginX - 10;

    end else if fLeft then
      begin

        //Same idea as when the vehicle is moving right
        fRayOriginX := fRayOriginX + 20;

      end;


    //Checks if the vehicles X coordinates is between any of the line segments that
    //cannot be turned into, if the vehicle is then the values is changed accrdingly to
    //indicate between which coordinates the vehicle is
    for i := 1 to 6 do
      begin

        if (fSegmentPos1[i, 1] < fRayOriginX) AND ((fSegmentPos1[i, 2]) > fRayOriginX) then
        begin

          fSegS := fSegmentPos1[i, 1];
          fSegE := fSegmentPos1[i, 2];

        end;

      end;

      //if the segments stay unchanged the vehicle is allowed to turn and turned into the
      //desired direction based on the direction
      if (fSegS = 0) AND (fSegE = 0) AND (fTurnDirY = 1) then
      begin

        Up(fvehicle);
        Exit;

      end else if (fSegS = 0) AND (fSegE = 0) AND (fTurnDirY = -1) then
        begin

          Down(fvehicle);
          Exit;

        end;

  end;

  //Checks if the vehicle wants to turn right or left
  if (fTurnDirX = 1) OR (fTurnDirX = -1) then
  begin

    //Checks in which direction the vehicle is currently moving in and adjusts the arrays
    //starting point based on the direction, same as the code above for when the vehicle
    //is moving right or left
    if (fUp) then
    begin

      fRayOriginY := fRayOriginY + 20;

    end else if (fDown) then
      begin

        fRayOriginY := fRayOriginY - 10;

      end;



    //Checks if the vehicles Y coordinate is whitin any of the segements that prevent
    //the vehicle from turning and changes the variables accordingly
    for i := 1 to 4 do
      begin

        if (fSegmentPos2[i, 1] < fRayOriginY) AND (fSegmentPos2[i, 2] > fRayOriginY) then
        begin

          fSegS := fSegmentPos2[i, 1];
          fSegE := fSegmentPos2[i, 2];

        end;

      end;


      //if the segments start and end positions stay unchanged then the vehicle
      //is turned based on its direction
      if (fSegS = 0) AND (fSegE = 0) AND (fTurnDirX = 1)then
      begin

        Right(fvehicle);
        Exit;

      end else if (fSegS = 0) AND (fSegE = 0) AND (fTurnDirX = -1)then
        begin

          Left(fvehicle);
          Exit;

        end;

  end;

end;

procedure TCollision.Right(_vehicle: TPanel);
begin

    //Changes the vehicle size and direction boolean to move right
    _vehicle.Width := 40;
    _vehicle.Height := 11;
    fCurrentDirection := 2;

end;

procedure TCollision.Up(_vehicle : TPanel);
begin

    //Changes the vehicle size and direction boolean to move up
    _vehicle.Width := 11;
    _vehicle.Height := 40;
    fCurrentDirection := 1;

end;

end.
