unit MapScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.ToolWin, Collision, VehicleMove, DatabaseModule, Grid_Node, A_Star_PathFinding, Math,
  Vcl.Imaging.pngimage;

type
  TfrmMapScreen = class(TForm)
    Base: TPanel;
    Block_1: TPanel;
    Block_2: TPanel;
    Block_3: TPanel;
    Block_4: TPanel;
    Block_5: TPanel;
    Block_6: TPanel;
    Block_7: TPanel;
    Block_13: TPanel;
    Block_19: TPanel;
    Block_8: TPanel;
    Block_9: TPanel;
    btnQuitApplication: TButton;
    btnBack: TButton;
    lbledtVehicleID: TLabeledEdit;
    btnGatherInfo: TButton;
    redOutInformation: TRichEdit;
    Timer1: TTimer;
    Block_10: TPanel;
    Block_11: TPanel;
    Block_12: TPanel;
    Block_14: TPanel;
    Block_15: TPanel;
    Block_16: TPanel;
    Block_17: TPanel;
    Block_18: TPanel;
    Block_20: TPanel;
    Block_21: TPanel;
    Block_22: TPanel;
    Block_23: TPanel;
    Block_24: TPanel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnGatherInfoClick(Sender: TObject);
  private
    { Private declarations }
    LastFrame, CurrentFrame, DeltaTime: Double;
    SegmentPos1 : TStaticInt2DArray;
    SegmentPos2 : TstaticInt2DArray2;
    VehicleList : TList<TVehicle>;
    ColliderList : TList<TCollision>;
    arrGrid : TGridArray;
    iRecordNum : Integer;
    procedure UpdateApplication(_DeltaTime: Double);
    procedure ClosingProgram;
    procedure OnVehicleClick(Sender : TObject);

  public
    { Public declarations }
  end;

var
  frmMapScreen: TfrmMapScreen;

implementation

{$R *.dfm}


procedure TfrmMapScreen.btnBackClick(Sender: TObject);
begin

    //Close current screen
    Close;

end;

procedure TfrmMapScreen.btnQuitApplicationClick(Sender: TObject);
begin

    //Savely terminates program
    ClosingProgram;
    Application.Terminate;

end;

procedure TfrmMapScreen.btnGatherInfoClick(Sender: TObject);
var
  sVehicleID, sTextFileName, sLine, sFeedback : String;
  VehicleFile : TextFile;
begin

  //Assign variables and ensure that no fields were left empty
  sVehicleID := lbledtVehicleID.Text;

  if sVehicleID.IsEmpty then
  begin

    ShowMessage('Please input a vehicle ID before requesting data');
    exit;

  end;

  redOutInformation.Clear;

  if sVehicleID.IsEmpty then
  begin

    ShowMessage('Please select a vehicle');
    exit;

  end;

  sTextFileName := sVehicleID + '.txt';

  AssignFile(VehicleFile, sTextFileName);

  //Retrieve rating info from the vehicle file
  if FileExists(sTextFileName) then
  begin

    Reset(VehicleFile);

    ReadLn(VehicleFile, sLine);

    While NOT(EOF(VehicleFile)) do
    begin

      Delete(sLine, 1, POS(':', sLine) + 1);
      sFeedback := Copy(sLine, 1, POS(':', sLine) - 16);
      redOutInformation.Lines.Add('Name and authorization level of user:' + #13 + sFeedback);


      Delete(sLine, 1, POS(':', sLine) + 1);
      sFeedback := Copy(sLine, 1, POS(':', sLine) - 28);
      redOutInformation.Lines.Add('ID of the package that was delivered :' + #13 + sFeedback);

      Delete(sLine, 1, POS(':', sLine) + 1);
      sFeedback := Copy(sLine, 1, Length(sLine));
      redOutInformation.Lines.Add('Rating that was given by the client:' + #13 + sFeedback + #13 + 'Review that was left: ' + #13);

      sFeedback := '';

      While (NOT(EOF(VehicleFile))) do
      begin

        ReadLn(VehicleFile, sLine);

        if Copy(sLine, 1, 12) = 'Client name:' then
        begin

          Break;

        end else
          sFeedback := sFeedback + #13 + sLine;

      end;

      redOutInformation.Lines.add(sFeedback + #13);

    end;

  end else
  begin

    ShowMessage('There is no record or reviews for this vehicle yet');
    exit;

  end;

  CloseFile(VehicleFile);

end;

procedure TfrmMapScreen.ClosingProgram;
var
  i : Integer;
  currentVehicle : TVehicle;
  currentPanel : TPanel;
begin


    //Saves all needed information to the database before terminating the program
    With DBModule do
    begin

      for i := 0 to VehicleList.Count - 1 do
        begin
      
          currentVehicle := VehicleList[i];
          currentPanel := VehicleList[i].fVehicle;

          tblVehicle.Locate('VehicleID', currentVehicle.fVehicleID, []);

          tblVehicle.Edit;
          tblVehicle['VehicleLEFT'] := currentPanel.Left;
          tblVehicle['VehicleTOP'] := currentPanel.Top;
          tblVehicle['DirX'] := currentVehicle.fCurrentDirX;
          tblVehicle['DirY'] := currentVehicle.fCurrentDirY;
          tblVehicle['Direction'] := currentVehicle.fDirection;
          tblVehicle.Post;

          currentVehicle.free;
          ColliderList[i].free;
      
        end;

    end;

end;

procedure TfrmMapScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    //Hide form
    Action := caHide;

end;

procedure TfrmMapScreen.FormCreate(Sender: TObject);
var
  i, j, iCount : Integer;
  Node : TNode;
  newVehicle : TVehicle;
  newCollider : TCollision;
  VehiclePanel : TPanel;
  VehicleImage : TImage;
begin

    //****
    VehicleList := TList<TVehicle>.Create;
    ColliderList := TList<TCollision>.Create;
    //****


    //"Create" new objects for each vehicle within the database
    with DBModule do
    begin

       iRecordNum := tblVehicle.RecordCount;

      for i := 1 to tblVehicle.RecordCount do
      begin

        tblVehicle.RecNo := i;

        VehiclePanel := TPanel.Create(Base);
        VehiclePanel.Parent := Base;
        VehiclePanel.Name := tblVehicle['VehicleID'];
        VehiclePanel.Caption := '';
        VehiclePanel.OnClick := OnVehicleClick;
        VehiclePanel.Left := tblVehicle['VehicleLEFT'];
        VehiclePanel.Top := tblVehicle['VehicleTOP'];
        VehiclePanel.ParentBackground := false;
        VehiclePanel.Color := clHighlight;

        newVehicle := TVehicle.Create(tblVehicle['DirX'], tblVehicle['DirY'], RandomRange(35, 46), tblVehicle['Direction'], VehiclePanel, tblVehicle['VehicleID']);

        VehicleList.Add(newVehicle);

      end;


    end;

    //Initialises all the lines that cannot be crossed by the vehicles
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

    //Add colliders for each vehicle
    with DBModule do
    begin

      for i := 0 to VehicleList.Count - 1 do
      begin

        newCollider := TCollision.Create(SegmentPos1, SegmentPos2, VehicleList[i].fVehicle);

        ColliderList.Add(newCollider);

      end;

    end;

    //Sets the walkable and non-walkable values for the A* pathfinding to
    //be able to calculate the correct route
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

    //Initializes vehicle
    for i := 0 to VehicleList.Count - 1 do
    begin

      VehicleList[i].InitializeVehicle(arrGrid);

    end;

    //****
    //Gets the first "frame" of the program for deltaTime
    LastFrame := Now;
    //****

    Timer1.Enabled := true;
    Timer2.Enabled := true;

end;


procedure TfrmMapScreen.OnVehicleClick(Sender : TObject);
var
  i: Integer;
begin

    //Select clicked vehicle and displays all corrisponding information
    for i := 0 to VehicleList.Count - 1 do
    begin

      VehicleList[i].fVehicle.Color := clHighlight;

      if (Sender as TPanel).Name = VehicleList[i].fVehicleID then
      begin

        (Sender as TPanel).Color := clLime;
        lbledtVehicleID.Text := (Sender as TPanel).Name;

      end;

    end;


end;

procedure TfrmMapScreen.Timer1Timer(Sender: TObject);
begin

    //****
    //Gets the current "frame" for deltaTime calculations
    CurrentFrame := Now;

    //Calculates the deltaTime and turn it into a milisecond value
    DeltaTime := (CurrentFrame - LastFrame) * 24 * 60 * 60;

    //Sets the current "frame" to the previous fram for next round of calculations
    LastFrame := CurrentFrame;

    //Updates the application and does and needed calculations for each "frame"
    UpdateApplication(DeltaTime);
    //****

end;


procedure TfrmMapScreen.Timer2Timer(Sender: TObject);
var
  i: Integer;
  VehiclePanel : TPanel;
  newVehicle : TVehicle;
  newCollider : TCollision;
begin

    //Create all vehicles within the database upon starting to form
    with DBModule do
    begin

      tblVehicle.Close;
      tblVehicle.Open;

      if iRecordNum < tblVehicle.RecordCount then
      begin

        iRecordNum := tblVehicle.RecordCount;

        tblVehicle.Sort := 'RecordNum DESC';
        tblVehicle.First;

        VehiclePanel := TPanel.Create(Base);
        VehiclePanel.Parent := Base;
        VehiclePanel.Name := tblVehicle['VehicleID'];
        VehiclePanel.Caption := '';
        VehiclePanel.OnClick := OnVehicleClick;
        VehiclePanel.Left := 245;
        VehiclePanel.Top := 225;
        VehiclePanel.ParentBackground := False;
        VehiclePanel.Color := clHighlight;
        newVehicle := TVehicle.Create(1, 0, RandomRange(35, 46), 2, VehiclePanel, tblVehicle['VehicleID']);
        newCollider := TCollision.create(SegmentPos1, SegmentPos2, VehiclePanel);

        tblVehicle.Edit;
        tblVehicle['VehicleLEFT'] := 245;
        tblVehicle['VehicleTOP'] := 225;
        tblVehicle['DirX'] := 1;
        tblVehicle['DirY'] := 0;
        tblVehicle['Direction'] := 2;
        tblVehicle['DateOfUpdate'] := Date;
        tblVehicle.Post;

        ColliderList.Add(newCollider);
        VehicleList.Add(newVehicle);

        newVehicle.InitializeVehicle(arrGrid);

      end;

    end;

end;
    

procedure TfrmMapScreen.UpdateApplication(_DeltaTime: Double);
var
  i : Integer;
  tempVehicle : TVehicle;
  tempCollider : TCollision;
begin

    //Updates all vehicle and colliders when called
    for i := 0 to VehicleList.Count - 1 do
    begin

      tempVehicle := VehicleList[i];
      tempCollider := ColliderList[i];

      tempVehicle.UpdateVehicle(tempCollider.IntDir, tempCollider, DeltaTime);

      tempCollider.RayCast(tempVehicle.fVehicle.Left, tempVehicle.fVehicle.Top, tempVehicle.DirectionsArray[tempVehicle.fDir, 0], tempVehicle.DirectionsArray[tempVehicle.fDir, 1], tempVehicle.fDirection);

      tempVehicle.MoveVehicle(tempVehicle.fDirection, _DeltaTime);

    end;


end;

end.
