unit NewVehicleScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, DatabaseModule,
  Vcl.Samples.Spin, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmNewVehicle = class(TForm)
    pnlBasePlate: TPanel;
    cmbDriverID: TComboBox;
    lblCmbInfo: TLabel;
    lbledtVehicleID: TLabeledEdit;
    lblVehicleSize: TLabel;
    spnVehicleX: TSpinEdit;
    spnVehicleY: TSpinEdit;
    spnVehicleZ: TSpinEdit;
    lblX1: TLabel;
    lblX2: TLabel;
    lblVehicleX: TLabel;
    lblWehicleZ: TLabel;
    lblVehicleY: TLabel;
    pnlVehicleRegister: TPanel;
    pnlBack: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure pnlVehicleRegisterClick(Sender: TObject);
    procedure pnlBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewVehicle: TfrmNewVehicle;

implementation

{$R *.dfm}

procedure TfrmNewVehicle.FormActivate(Sender: TObject);
begin

  with DBModule do
  begin

    sqlVehicle.SQL.Text := 'SELECT AccountTbl.AccountID FROM AccountTbl WHERE AccountTbl.Username LIKE ''Driver-%'' AND AccountTbl.AccountID NOT IN (SELECT VehicleTbl.DriverID FROM VehicleTbl)';
    sqlVehicle.Open;

    cmbDriverID.Items.Clear;
    while NOT sqlVehicle.Eof do
    begin

      cmbDriverID.Items.Add(sqlVehicle.Fields[0].AsString);
      sqlVehicle.Next;

    end;


  end;


end;

procedure TfrmNewVehicle.pnlBackClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmNewVehicle.pnlVehicleRegisterClick(Sender: TObject);
var
    sVehicleID, sDriverID, sVehicleSize : String;
begin

  sVehicleID := lbledtVehicleID.Text;
  sVehicleSize := spnVehicleX.Value.ToString + 'X' + spnVehicleY.Value.ToString + 'X' + spnVehicleZ.Value.ToString;

  if sVehicleID.IsEmpty then
  begin

    ShowMessage('Please input a vehicle ID before trying to register it');
    exit;

  end;

  if cmbDriverID.ItemIndex <> -1 then
  begin

    sDriverID := cmbDriverID.Text;

  end;

  With DBModule do
    begin

      if sqlVehicle.Active then
        sqlVehicle.Close;

      sqlVehicle.SQL.Text := 'INSERT INTO VehicleTbl (VehicleID, DriverID, VehicleStatus, BrokenPart, VehicleSize) VALUES ("' + sVehicleID + '", "' + sDriverID + '", "New Vehicle", "Not Any", "' + sVehicleSize + '")';
      sqlVehicle.ExecSQL;

    end;

  if cmbDriverID.ItemIndex <> -1 then
  begin

    cmbDriverID.Items.Delete(cmbDriverID.ItemIndex);
    cmbDriverID.ItemIndex := -1;

  end;

  ShowMessage('New Vehicle was added');

end;

end.
