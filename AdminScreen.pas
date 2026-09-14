unit AdminScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, DateUtils, DatabaseModule, MapScreen, Data.DB, Vcl.Grids, Vcl.DBGrids, NewVehicleScreen, UpdateVehicleScreen, NewEmployeeScreen;

type
  TfrmAdminPanel = class(TForm)
    btnCheckVehicle: TButton;
    btnQuitApplication: TButton;
    VehicleStatusRedout: TRichEdit;
    btnSaveTextFile: TButton;
    rgpSelectionChoices: TRadioGroup;
    btnDisplayStatus: TButton;
    btnRerouteToMap: TButton;
    btnNewVehicle: TButton;
    cmbVehicleID: TComboBox;
    dbgOutput: TDBGrid;
    btnUpdateVehicle: TButton;
    rgpSelectStats: TRadioGroup;
    btnNewEmployee: TButton;
    procedure btnNewVehicleClick(Sender: TObject);
    procedure btnRerouteToMapClick(Sender: TObject);
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure btnDisplayStatusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCheckVehicleClick(Sender: TObject);
    procedure btnUpdateVehicleClick(Sender: TObject);
    procedure rgpSelectionChoicesClick(Sender: TObject);
    procedure btnSaveTextFileClick(Sender: TObject);
    procedure rgpSelectStatsClick(Sender: TObject);
    procedure btnNewEmployeeClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminPanel: TfrmAdminPanel;

implementation

{$R *.dfm}

procedure TfrmAdminPanel.btnCheckVehicleClick(Sender: TObject);
var
  sVehicleID, sOutPutLine : String;
  dFixTime : TDateTime;
begin

  //Validates the inputs
  if cmbVehicleID.ItemIndex = -1 then
  begin

    ShowMessage('Please select a vehicle ID');
    Exit;

  end;

  sVehicleID := cmbVehicleID.Text;

  With DBModule do
  begin

    //Selects all the fields of the vehicle

    sqlVehicle.SQL.Text := 'SELECT VehicleID, VehicleStatus, BrokenPart, RepairTime AS [Days for repair] FROM VehicleTbl WHERE VehicleID = "' + sVehicleID + '"';
    sqlVehicle.Open;

  end;

end;

procedure TfrmAdminPanel.btnDisplayStatusClick(Sender: TObject);
begin


    //Displays all the statusses of all the vehicles in the database

    with DBModule do
    begin

      VehicleStatusRedout.Clear;

      tblVehicle.First;

      While NOT(tblVehicle.EoF) do
      begin

          VehicleStatusRedout.Lines.add('Vehicle ID: ' + tblVehicle['vehicleID'] + #13 + 'Vehicle Status: ' + tblVehicle['VehicleStatus'] + #13);

          tblVehicle.Next;

      end;

    end;

end;

procedure TfrmAdminPanel.btnNewEmployeeClick(Sender: TObject);
var
  NewEmployee : TfrmNewEmployee;
begin

    //Opens the Employee screen

    NewEmployee := TfrmNewEmployee.Create(Self);

    Try
      NewEmployee.ShowModal;
    Finally
      NewEmployee.Free;
    End;

end;

procedure TfrmAdminPanel.btnNewVehicleClick(Sender: TObject);
var
  NewVehicle : TfrmNewVehicle;
begin

    //Opens new vehicle screen

    NewVehicle := TfrmNewVehicle.Create(Self);

    Try
      NewVehicle.ShowModal;
    Finally
      NewVehicle.Free;
    End;

end;

procedure TfrmAdminPanel.btnQuitApplicationClick(Sender: TObject);
begin

    //Stops the program
    Application.Terminate;

end;

procedure TfrmAdminPanel.btnRerouteToMapClick(Sender: TObject);
begin

    //Shows the admin screen

    Self.Hide;

    Try
      frmMapScreen.ShowModal;
    Finally
      frmMapScreen.Hide;
      Self.Show;
    End;


end;

procedure TfrmAdminPanel.btnSaveTextFileClick(Sender: TObject);
var
  VTextFile : TextFile;
  sFileName, sVehicleID : String;
begin

  //validates all the variables

  if cmbVehicleID.ItemIndex = -1 then
  begin

    ShowMessage('Please select a vehicle ID to be saved into a file');
    Exit;

  end;

  sVehicleID := cmbVehicleID.Text;

  //Saves the needed info to a textfile that can be used to print and used later on
  sFileName := sVehicleID + '__Statustics.txt';

  AssignFile(VTextFile, sFileName);


  with DBModule do
  begin

    sqlVehicle.SQl.Text := 'SELECT * FROM VehicleTbl WHERE VehicleID = "' + sVehicleID +'"';
    sqlVehicle.Open;

    ReWrite(VTextFile);

    WriteLn(VTextFile, 'Vehicle ID: ' + cmbVehicleID.Text + #13 + '-------------------------' + #13 + 'Account ID of the assigned driver' + sqlVehicle.FieldByName('DriverID').AsString + #13 + #13);
    WriteLn(VTextFile, 'Vehicle status: ' + sqlVehicle.FieldByName('VehicleStatus').AsString);
    WriteLn(VTextFile, 'Part of vehicle that is broken: ' + sqlVehicle.FieldByName('BrokenPart').AsString);
    WriteLn(VTextFile, 'Date by which the vehicle should be fixed: ' + sqlVehicle.FieldByName('RepairTime').AsString);
    WriteLn(VTextFile, 'Size of vehicles storage: ' + sqlVehicle.FieldByName('VehicleSize').AsString + ' CM ');

    ShowMessage('Vehicle successfully saved to textfile.');

  end;


  CloseFile(VTextFile);

end;

procedure TfrmAdminPanel.btnUpdateVehicleClick(Sender: TObject);
var
  UpdateVehicle : TfrmUpdateVehicle;
begin

    //Shows update screen

    UpdateVehicle := TfrmUpdatevehicle.Create(Self);

    Try
      UpdateVehicle.ShowModal;
    Finally
      UpdateVehicle.Free;
    End;

end;

procedure TfrmAdminPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    //Stops the program
    Application.Terminate;

end;

procedure TfrmAdminPanel.FormCreate(Sender: TObject);
begin


  //Shows all the vehicles and their info when creating the form
  with DBModule do
  begin

    tblVehicle.First;

    While NOT(tblVehicle.EoF) do
    begin

      cmbVehicleID.Items.Add(tblVehicle['VehicleID']);
      tblVehicle.Next;

    end;

    sqlVehicle.SQL.Text := 'SELECT VehicleID, VehicleStatus, BrokenPart, RepairTime, OrderID, DriverID, VehicleSize FROM VehicleTbl';
    sqlVehicle.Open;

  end;

end;

procedure TfrmAdminPanel.rgpSelectionChoicesClick(Sender: TObject);
begin

  //Does a query based on the option selected

  with DBModule do
  begin

    case rgpSelectionChoices.ItemIndex of
    0: sqlVehicle.SQL.Text := 'SELECT VehicleID, VehicleStatus, BrokenPart, RepairTime AS [Days for repair] FROM VehicleTbl';
    1: sqlVehicle.SQL.Text := 'SELECT VehicleID, VehicleStatus, BrokenPart, RepairTime AS [Days for repair] FROM VehicleTbl WHERE BrokenPart <> "Not Any"';
    2: sqlVehicle.SQl.Text := 'SELECT VehicleID, VehicleStatus, BrokenPart, RepairTime AS [Days for repair] FROM VehicleTbl WHERE BrokenPart = "Not Any"';
    end;

    sqlVehicle.Open;

  end;


end;

procedure TfrmAdminPanel.rgpSelectStatsClick(Sender: TObject);
begin


    //Does a query based on the option selected

    With DBModule do
    begin

      case rgpSelectStats.ItemIndex of
      0: sqlVehicle.SQL.Text := 'SELECT SUM(DailyDelivery) AS [Deliveries done today] FROM VehicleTbl';
      1: sqlVehicle.SQL.Text := 'SELECT AVG(DailyDelivery) AS [Average of deliveries done today] FROM VehicleTbl';
      2: sqlVehicle.SQL.Text := 'SELECT VehicleID, DailyDelivery FROM VehicleTbl';
      3: sqlVehicle.SQL.Text := 'SELECT TOP 1 VehicleID, DailyDelivery FROM VehicleTbl ORDER BY DailyDelivery DESC';
      4: sqlVehicle.SQL.Text := 'SELECT TOP 1 VehicleID, DailyDelivery FROM VehicleTbl ORDER BY DailyDelivery';
      end;

      sqlVehicle.Open;

    end;

end;

end.
