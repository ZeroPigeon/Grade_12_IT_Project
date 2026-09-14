unit UpdateVehicleScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DataBaseModule,
  Vcl.Mask, Vcl.WinXCalendars;

type
  TfrmUpdateVehicle = class(TForm)
    pnlBase: TPanel;
    cmbVehicleID: TComboBox;
    lblCmbInfo: TLabel;
    lbledtVehicleStatus: TLabeledEdit;
    lbledtBrokenPartInput: TLabeledEdit;
    cldRepairTime: TCalendarPicker;
    lblCalenderInfo: TLabel;
    pnlUpdateVehicle: TPanel;
    pnlBack: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure pnlUpdateVehicleClick(Sender: TObject);
    procedure pnlBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateVehicle: TfrmUpdateVehicle;

implementation

{$R *.dfm}

procedure TfrmUpdateVehicle.FormCreate(Sender: TObject);
begin

  with DBModule do
  begin

    tblVehicle.First;

    While NOT(tblVehicle.EoF) do
    begin

      cmbVehicleID.Items.Add(tblVehicle['VehicleID']);
      tblVehicle.Next;

    end;

  end;

end;

procedure TfrmUpdateVehicle.pnlBackClick(Sender: TObject);
begin

    Close;

end;

procedure TfrmUpdateVehicle.pnlUpdateVehicleClick(Sender: TObject);
var
  sVehicleID, sNewStatus, sDamagedPart : String;
  iDayCounter : Integer;
  dRepairTime : TDate;
begin

    if cmbVehicleID.ItemIndex <> -1 then
    begin

      sVehicleID := cmbVehicleID.Text;
      sNewStatus := lbledtVehicleStatus.Text;
      sDamagedPart := lbledtBrokenPartInput.Text;
      dRepairTime := cldRepairTime.Date;

      if sNewStatus.IsEmpty then
      begin

        ShowMessage('Please input the new status of the vehicle before updating the table');
        exit;

      end;

      if sDamagedPart.IsEmpty then
      begin

        ShowMessage('Please input the part that was damaged before updating the table');
        exit;

      end;

      iDayCounter := Trunc(Date - dRepairTime);

      if dRepairTime < Date then
      begin

        ShowMessage('Please select a date that is in the future from today');
        Exit;

      end;

      with DBModule do
      begin

        sqlVehicle.SQL.Text := 'UPDATE VehicleTbl SET VehicleStatus = "' + sNewStatus + '", BrokenPart = "' + sDamagedPart + '", RepairTime = "' + IntToStr(iDayCounter) + '" WHERE VehicleID = "' + sVehicleID + '"';
        //****
        sqlVehicle.ExecSQL;
        //****

      end;

    end else
    begin

      ShowMessage('Please select a vehicle ID');
      exit;

    end;

    ShowMessage('Vehicle has been updated');

end;

end.
