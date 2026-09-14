unit GPS_Screen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Math, DatabaseModule, VehicleMove, Collision, Grid_Node, A_Star_PathFinding;

type
  TfrmGPS_Screen = class(TForm)
    Base: TPanel;
    Block_1: TPanel;
    Block_2: TPanel;
    Block_3: TPanel;
    Block_4: TPanel;
    Block_5: TPanel;
    Block_6: TPanel;
    Block_7: TPanel;
    Block_8: TPanel;
    Block_9: TPanel;
    Block_10: TPanel;
    Block_11: TPanel;
    Block_12: TPanel;
    btnQuitApplication: TButton;
    btnReturn: TButton;
    Block_20: TPanel;
    Block_19: TPanel;
    Block_13: TPanel;
    Block_14: TPanel;
    Block_15: TPanel;
    Block_16: TPanel;
    Block_23: TPanel;
    Block_17: TPanel;
    Block_24: TPanel;
    Block_18: TPanel;
    Block_22: TPanel;
    Block_21: TPanel;
    Vehicle_1: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  objVehicle : TVehicle;
  SegmentPos1 : TStaticInt2DArray;
  SegmentPos2 : TStaticInt2DArray2;
  Collider : TCollision;
  arrGrid : TGridArray;
  Path : A_Star;
  DirectionArray : arrDirections;
  iDir, iDirection, iPreviousDir, iLastX, iLastY : Integer;
  bStopped : Boolean;
  StopTimer : Real;

  DeltaTime, LastFrame, CurrentFrame : Double;

  procedure VehiclePos;
  procedure VehicleStop;
  procedure updateApplication;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGPS_Screen: TfrmGPS_Screen;

implementation

{$R *.dfm}

procedure TfrmGPS_Screen.btnReturnClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmGPS_Screen.FormActivate(Sender: TObject);
var
  iCount, i, j : Integer;
  Node : TNode;
begin

    //Initialize collision componenets and positions
    iDirection := 2;

    ObjVehicle := TVehicle.create(0, 0, 40, iDirection, Vehicle_1, 'Test');

    SegmentPos1[1, 1] := 0;
    SegmentPos1[1, 2] := 90;

    SegmentPos1[2, 1] := 120;
    SegmentPos1[2, 2] := 210;

    SegmentPos1[3, 1] := 240;
    SegmentPos1[3, 2] := 330;

    SegmentPos1[4, 1] := 360;
    SegmentPos1[4, 2] := 450;

    SegmentPos1[5, 1] := 480;
    SegmentPos1[5, 2] := 570;

    SegmentPos1[6, 1] := 600;
    SegmentPos1[6, 2] := 690;

    SegmentPos2[1, 1] := 0;
    SegmentPos2[1, 2] := 90;

    SegmentPos2[2, 1] := 120;
    SegmentPos2[2, 2] := 210;

    SegmentPos2[3, 1] := 240;
    SegmentPos2[3, 2] := 330;

    SegmentPos2[4, 1] := 360;
    SegmentPos2[4, 2] := 450;

    Collider := TCollision.Create(SegmentPos1, SegmentPos2, Vehicle_1);

    iCount := 0;

    //****
    SetLength(arrGrid, 23, 15);
    //****

    for i := 0 to 22 do
    begin

      for j := 0 to 14 do
        begin

            //Sets tile to unwalkable
            Inc(iCount);
            Node := TNode.Create(i, j, 1);

            //Resets the counter if a new X coordinate is used
            if j = 0 then
            begin

              iCount := 1;

            end;

            //Sets all Y coordinates of the rows with the X coordinates listed to walkable
            if (i = 3) OR (i = 7) OR (i = 11) OR (i = 15) OR (i = 19) then
            begin

              Node.Walkable := 0;

            end;

            //Sets the tile to walkable if the counter is on 4
            if iCount = 4 then
            begin

              iCount := 0;
              Node.Walkable := 0;


            end;

            //****
            arrGrid[i, j] := Node;
            //****

        end;

    end;

    VehiclePos;

end;

procedure TfrmGPS_Screen.Timer1Timer(Sender: TObject);
begin

    //****
    //Gets the current "frame" for deltaTime calculations
    CurrentFrame := Now;

    //Calculates the deltaTime and turn it into a milisecond value
    DeltaTime := (CurrentFrame - LastFrame) * 24 * 60 * 60;

    //Sets the current "frame" to the previous fram for next round of calculations
    LastFrame := CurrentFrame;

    updateApplication;
    //****

end;

procedure TfrmGPS_Screen.Timer2Timer(Sender: TObject);
begin

    //****
    Timer2.Enabled := false;
    //****

    LastFrame := Now;
    Timer1.Enabled := true;

end;

procedure TfrmGPS_Screen.updateApplication;
begin

    VehicleStop;

    //Creates colliders for each vehicle that acts like a raycast
    Collider.RayCast(Vehicle_1.Left, Vehicle_1.Top, DirectionArray[iDir, 0], DirectionArray[iDir, 1], iDirection);

    //Gets the direction of the vehicle every "frame"
    iDirection := Collider.IntDir;


    //Moves the vehicle based on the direction and speed every "frame"
    objVehicle.MoveVehicle(iDirection, DeltaTime);

end;

procedure TfrmGPS_Screen.VehiclePos;
var
  xPos, yPos : Integer;
begin

    //Calculate the path that the vehicle should take using A* path finding
    iLastX := Floor(Vehicle_1.Left / 30);
    iLastY := FLoor(Vehicle_1.Top / 30);
    iDir := 0;

    xPos := DBModule.tblAccount['AddressX'];
    yPos := DBModule.tblAccount['AddressY'];

    Path := A_Star.create(arrGrid[iLastX, iLastY], arrGrid[xPos, yPos], arrGrid);

    DirectionArray := Copy(Path.Directions, 0, Length(Path.Directions));

    StopTimer := 0;

    Timer2.Interval := 10000;
    Timer2.Enabled := true;

end;

procedure TfrmGPS_Screen.VehicleStop;
var
  iCurrentX, iCurrentY : Integer;
begin

    //Stops the vehicle when it gets to its destination and clears the path
    //to allow the vehicle to get another path for a new destinations
    iCurrentX := Floor(Vehicle_1.Left / 30);
    iCurrentY := Floor(Vehicle_1.Top / 30);

    if (iDirection <> 5) then
    begin

      iPreviousDir := iDirection;

    end else if NOT(bStopped) then
    begin

      StopTimer := Collider.StopTimer;
      bStopped := true;

    end;

    if StopTimer > 0 then
    begin

      StopTimer := StopTimer - DeltaTime;

    end;

    if (StopTimer <= 0) AND (iDir + 1 = Length(DirectionArray)) then
    begin

      iDir := 0;
      Path.Free;
      Path := A_Star.create(arrGrid[iCurrentX, iCurrentY], arrGrid[8, 7], arrGrid);
      DirectionArray := Path.Directions;
      iDirection := iPreviousDir;
      bStopped := false;

    end;

    if (NOT(iCurrentX = iLastX) OR NOT(iCurrentY = iLastY)) AND NOT((iDir + 1) = Length(DirectionArray)) then
    begin

      Inc(iDir, 1);

    end;

    iLastX := iCurrentX;
    iLastY := iCurrentY;

end;

procedure TfrmGPS_Screen.btnQuitApplicationClick(Sender: TObject);
begin

    Application.Terminate;

end;

end.
