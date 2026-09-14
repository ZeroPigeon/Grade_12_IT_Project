unit AccountRegistryScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, DatabaseModule,
  Vcl.Samples.Spin;

type
  TfrmAccountRegistry = class(TForm)
    btnQuit: TButton;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    edtVerifyPass: TLabeledEdit;
    btnRegister: TButton;
    redOutAccount: TRichEdit;
    btnLoginScreen: TButton;
    btnViewPass: TButton;
    cmbStreetNames: TComboBox;
    lblStreetIndicator: TLabel;
    Label1: TLabel;
    cmbHorizontalNum: TComboBox;
    cmbVerticaleNum: TComboBox;
    procedure btnViewPassClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnLoginScreenClick(Sender: TObject);
    procedure cmbStreetNamesChange(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
  private
    bShow, bStreetName, bHouseNum : Boolean;
    X_value, Y_value : Integer;
    sAddress : String;
    function MakeUserID(sName : String) : String;
    procedure ConvertAddress();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccountRegistry: TfrmAccountRegistry;

implementation

{$R *.dfm}

procedure TfrmAccountRegistry.btnViewPassClick(Sender: TObject);
begin

    //Makes the password text visible or hides it based on the button pressed state
    if NOT(bShow) then
    begin

      edtPassword.PasswordChar := #0;
      edtVerifyPass.PasswordChar := #0;
      bShow := true;

    end else
    begin

      edtPassword.PasswordChar := '*';
      edtVerifyPass.PasswordChar := '*';
      bShow := false;

    end;



end;

procedure TfrmAccountRegistry.cmbStreetNamesChange(Sender: TObject);
begin

  //Shows and hides the comboboxes based on which streetname is selected in the main combobox
  case cmbStreetNames.ItemIndex of
  -1: begin

        ShowMessage('Please choose a street name');
        bStreetName := false;

      end;
  0:  begin

        cmbHorizontalNum.Hide;
        cmbHorizontalNum.Enabled := false;
        cmbVerticaleNum.Show;
        cmbVerticaleNum.Enabled := true;

      end;
  1:  begin

        cmbHorizontalNum.Hide;
        cmbHorizontalNum.Enabled := false;
        cmbVerticaleNum.Show;
        cmbVerticaleNum.Enabled := true;

      end;
  3:  begin

        cmbHorizontalNum.Hide;
        cmbHorizontalNum.Enabled := false;
        cmbVerticaleNum.Show;
        cmbVerticaleNum.Enabled := true;

      end;
  4:  begin

        cmbHorizontalNum.Hide;
        cmbHorizontalNum.Enabled := false;
        cmbVerticaleNum.Show;
        cmbVerticaleNum.Enabled := true;

      end;
  5:  begin

        cmbHorizontalNum.Show;
        cmbHorizontalNum.Enabled := true;
        cmbVerticaleNum.Hide;
        cmbVerticaleNum.Enabled := false;

      end;
  6:  begin

        cmbHorizontalNum.Show;
        cmbHorizontalNum.Enabled := true;
        cmbVerticaleNum.Hide;
        cmbVerticaleNum.Enabled := false;


      end;
  7:  begin

        cmbHorizontalNum.Show;
        cmbHorizontalNum.Enabled := true;
        cmbVerticaleNum.Hide;
        cmbVerticaleNum.Enabled := false;


      end;
  end;

end;

procedure TfrmAccountRegistry.ConvertAddress();
begin

    //Checks which combobox is visible to ensure the correct combobox is used for the address
    if cmbVerticaleNum.Visible then
    begin

        if (cmbVerticaleNum.ItemIndex = -1) then
        begin

          ShowMessage('Please select a house number');
          bHouseNum := false;

        end;

    end else if cmbHorizontalNum.Visible then
    begin

        if (cmbHorizontalNum.ItemIndex = -1)  then
        begin

          ShowMessage('Please select a house number');
          bHouseNum := false;

        end;

    end;

    //Sets the X and Y values based on the index of the comboboxes
    case cmbStreetNames.ItemIndex of
    -1: begin

          ShowMessage('Please select a street name.');
          bStreetName := false;

        end;
    0:  begin

          X_value := 3;
          Y_value := StrToInt(cmbVerticaleNum.Text) - 1;
          sAddress := cmbVerticaleNum.Text + ' ' + sAddress;

        end;
    1:  begin

          X_value := 7;
          Y_value := StrToInt(cmbVerticaleNum.Text) - 1;
          sAddress := cmbVerticaleNum.Text + ' ' + sAddress;;

        end;
    2:  begin

          X_value := 11;
          Y_value := StrToInt(cmbVerticaleNum.Text) - 1;
          sAddress := cmbVerticaleNum.Text + ' ' + sAddress;;

        end;
    3:  begin

          X_value := 15;
          Y_value := StrToInt(cmbVerticaleNum.Text) - 1;
          sAddress := cmbVerticaleNum.Text + ' ' + sAddress;;

        end;
    4:  begin

          X_value := 19;
          Y_value := StrToInt(cmbVerticaleNum.Text) - 1;
          sAddress := cmbVerticaleNum.Text + ' ' + sAddress;;

        end;
    5:  begin

          Y_value := 3;
          X_value := StrToInt(cmbHorizontalNum.Text) - 1;
          sAddress := cmbHorizontalNum.Text + ' ' + sAddress;

        end;
    6:  begin

          Y_value := 7;
          X_value := StrToInt(cmbHorizontalNum.Text) - 1;
          sAddress := cmbHorizontalNum.Text + ' ' + sAddress;

        end;
    7:  begin

          Y_value := 11;
          X_value := StrToInt(cmbHorizontalNum.Text) - 1;
          sAddress := cmbHorizontalNum.Text + ' ' + sAddress;

        end;
    end;

end;

function TfrmAccountRegistry.MakeUserID(sName: String): String;
begin

    //returns a string that is used to represent a user with a unique ID
    result := IntToStr(DBModule.tblLogin.RecordCount + 1) + Copy(sName, 1, 1) + IntToStr(Random(999)) + UpperCase(Copy(sName, 2, 1));

end;

procedure TfrmAccountRegistry.btnLoginScreenClick(Sender: TObject);
begin

    //Closes the current screen and moves to the login screen
    Close;

end;

procedure TfrmAccountRegistry.btnQuitClick(Sender: TObject);
begin

    //Stops the program
    Application.Terminate;

end;

procedure TfrmAccountRegistry.btnRegisterClick(Sender: TObject);
var
  sUsername, sPassword, sPassVerification, sAuth, sID : String;
begin

    //Set all the needed variables for further use
    bStreetName := true;
    bHouseNum := true;
    sUsername := edtUsername.Text;
    sPassword := edtPassword.Text;
    sPassVerification := edtVerifyPass.Text;
    sAuth := 'Client';

    if sUsername.IsEmpty then
    begin

      ShowMessage('Please input a username');
      Exit;

    end;

    if sPassword.IsEmpty then
    begin

      ShowMessage('Please input a password');
      Exit;

    end;

    if sPassVerification.IsEmpty then
    begin

      ShowMessage('Please input a password verification');
      Exit;

    end;

    if cmbStreetNames.ItemIndex <> -1 then
    begin

      sAddress := cmbStreetNames.Text;

    end else
    begin

      ShowMessage('Please select a streetname');
      exit;

    end;

    //Verifys that the password verification is correct and if not it promts the user to retry
    if NOT(sPassword = sPassVerification) then
    begin

      ShowMessage('Password verification is incorrect, please try again');
      edtVerifyPass.Clear;
      edtVerifyPass.SetFocus;
      Exit;

    end;

    //Makes the userID and converts the address to an X and Y value for the pathfinding
    sID := MakeUserID(sUsername);
    ConvertAddress();

    //stops running the code if both variables are not true
    if NOT(bHouseNum) or NOT(bStreetName) then
    begin

      exit;

    end;

    if (cmbStreetNames.ItemIndex = 1) AND (StrToInt(cmbHorizontalNum.Text) - 1 = 8) then
    begin

      ShowMessage('Please select a new address, you can not have the same address as the warehouse');
      exit;

    end;



    with DBModule do
    begin

      //Creates a new record and fills in the needed information for the account
      tblLogin.Insert;
      tblLogin['Username'] := sAuth + '-' + sUsername;
      tblLogin['Password'] := sPassword;
      tblLogin['UserID'] := sID;
      tblLogin['AuthorizationLevel'] := sAuth;

      //Create a record in the client table to ensure that the client can always order something
      tblAccount.Insert;
      tblAccount['Username'] := sAuth + '-' + sUsername;
      tblAccount['AccountID'] := sID;
      tblAccount['Address'] := sAddress;
      tblAccount['AddressX'] := X_value;
      tblAccount['AddressY'] := Y_value;
      tblAccount.Post;
      tblLogin.Post;


      //Lets the user know that his/her account is created
      ShowMessage('Account has been created, you can now login with your account');

      //Displays all the needed information to the user
      redOutAccount.Clear;
      redOutAccount.Lines.add('Username: ' + tblLogin['Username']);
      redOutAccount.Lines.add('User identification: ' + tblLogin['UserID']);
      redOutAccount.Lines.add('Authorization level: ' + tblLogin['AuthorizationLevel']);

    end;

end;

end.
