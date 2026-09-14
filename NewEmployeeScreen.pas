unit NewEmployeeScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, DataBaseModule, Math;

type
  TfrmNewEmployee = class(TForm)
    pnlBase: TPanel;
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    lbledtVerifyPass: TLabeledEdit;
    pnlCreateAccount: TPanel;
    pnlBack: TPanel;
    lblrgpInfo: TLabel;
    rgpAuthorizationLevel: TRadioGroup;
    procedure pnlCreateAccountClick(Sender: TObject);
    procedure pnlBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewEmployee: TfrmNewEmployee;

implementation

{$R *.dfm}

procedure TfrmNewEmployee.pnlBackClick(Sender: TObject);
begin

    Close;

end;

procedure TfrmNewEmployee.pnlCreateAccountClick(Sender: TObject);
var
  sUsername, sPassword, sVerifyPass, sAuth : String;
begin

  sUsername := lbledtUsername.Text;
  sPassword := lbledtPassword.Text;
  sVerifyPass := lbledtVerifyPass.Text;

  if rgpAuthorizationLevel.ItemIndex <> -1 then
  begin

    sAuth := rgpAuthorizationLevel.Items[rgpAuthorizationLevel.ItemIndex];

  end else
  begin

    ShowMessage('Please select an authorization level');
    exit;

  end;

  if sUsername.IsEmpty then
  begin

    ShowMessage('Please input a username');
    exit;

  end;

  if sPassword.IsEmpty then
  begin

    ShowMessage('Please input a password');
    exit;

  end;

  if sVerifyPass.IsEmpty then
  begin

    ShowMessage('Please verify password');
    exit;

  end;

  if sPassword = sVerifyPass then
  begin

    With DBModule do
    begin

      tblLogin.Insert;
      tblLogin['Username'] := sAuth + '-' + sUsername;
      tblLogin['Password'] := sPassword;
      tblLogin['UserID'] := IntToStr(tblVehicle.RecordCount) + Copy(sUsername, 1, 1) + IntToStr(RandomRange(1, 1000)) + UpperCase(Copy(sUsername, 2, 1));
      tbllogin['AuthorizationLevel'] := sAuth;

      tblAccount.Insert;
      tblAccount['AccountID'] := tblLogin['UserID'];
      tblAccount['Username'] := sAuth + '-' + sUsername;
      tblAccount['Address'] := '---';
      tblAccount.Post;
      tblLogin.Post;

      ShowMessage('New ' + sAuth + ' account has been added');

    end;

  end;

end;

end.
