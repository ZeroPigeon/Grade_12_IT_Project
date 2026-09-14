unit LoginScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, AccountRegistryScreen, ClientOrderScreen, AdminScreen, DriverScreen, DatabaseModule,
  Vcl.Imaging.pngimage, DateUtils;

type
  TfrmLoginScreen = class(TForm)
    edtlblUsername: TLabeledEdit;
    edtlblPassword: TLabeledEdit;
    btnLogin: TButton;
    lblAccountCreation: TLabel;
    btnQuit: TButton;
    btnViewPassword: TButton;
    imgCar: TImage;
    imgTree2: TImage;
    imgTree3: TImage;
    imgTree4: TImage;
    imgTree1: TImage;
    pnlBaseTree1: TPanel;
    pnlBaseTree2: TPanel;
    imgTree5: TImage;
    imgTree8: TImage;
    imgTree7: TImage;
    imgTree6: TImage;
    pnlBaseVehicle: TPanel;
    Timer1: TTimer;
    pnlBaseCar: TPanel;
    procedure lblAccountCreationClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnViewPasswordClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  bShowPass : Boolean;
  currentFrame, lastFrame, DeltaTime : Double;
  procedure MoveTrees;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoginScreen: TfrmLoginScreen;

implementation

{$R *.dfm}

procedure TfrmLoginScreen.btnLoginClick(Sender: TObject);
var
    sUsername, sPassword, sAuth : String;
    bAdmin, bDriver : Boolean;
begin

    //Sets all the variables for later use
    sUsername := edtlblUsername.text;
    sPassword := edtlblPassword.text;
    bAdmin := false;
    bDriver := false;

    //Gets the authorization level of the user and checks what it is to ensure
    //that the user gets the correct screen and cant access screens that they arent supposed to
    sAuth := Copy(sUsername, 1, Pos('-', sUsername) - 1);

    if sAuth = 'Admin' then
    begin

      bAdmin := true;

    end else if sAuth = 'Driver' then
    begin

      bDriver := true;

    end;

    //Checks if the username and password fields are filled with something
    if sUsername.IsEmpty then
    begin

      ShowMessage('Please input a username before trying to login.');
      exit;

    end;

    if sPassword.IsEmpty then
    begin

      ShowMessage('Please input a password before trying to login.');

    end;

    with DBModule do
    begin

      //Moves to the first record of the database and starts to loop through
      //the table to check for the users account
      tblLogin.First;

      while NOT tblLogin.Eof do
      begin

        //Checks if the username does not match, if it doesnt match then it moves
        //to the next record, if it does match then the loop is stopped
        if NOT(UpperCase(sUsername) = UpperCase(tblLogin['Username'])) then
        begin

          tblLogin.Next;

        end else
        begin

          break;

        end;

      end;

      //Checks if a record is selected or not, if no record is selected the code inside is executed
      if NOT(tblLogin.RecNo > 0) then
      begin

        ShowMessage('Account does no exist, please use an existing account or create an account.');
        Exit;

      end;


      //Checks if the password is the correct password and if it is then the user is logged into
      //his/her account, if the password is incorrect the user is notified and the edit gets cleared
      if sPassword = tblLogin['Password'] then
      begin

        //Relays the user to the correct screen based on the authorization level
        if bAdmin then
        begin

          frmAdminPanel.Show;

        end else if bDriver then
        begin

          frmAssignOrder.Show;

        end else
        begin

          frmClientOrders.Show;

        end;

        Self.Hide;

      end else
      begin

        ShowMessage('Incorrect password, please try again.');
        edtlblPassword.clear;
        edtlblPassword.SetFocus;

      end;

    end;

end;


procedure TfrmLoginScreen.btnQuitClick(Sender: TObject);
begin

    //Stops the application
    Application.Terminate;

end;

procedure TfrmLoginScreen.btnViewPasswordClick(Sender: TObject);
begin

    //Sets the password edit to visable character or * depending on its state
    if (bShowPass) then
    begin

      edtlblPassword.PasswordChar := #0;
      bShowPass := false;

    end else
    begin

      edtlblPassword.PasswordChar := '*';
      bShowPass := true;

    end;

end;

procedure TfrmLoginScreen.FormCreate(Sender: TObject);
var
    currentDate : TDate;
    VehicleDate : Integer;
begin

    //Set the variable to ensure the password can be hidden or shown
    bShowPass := true;

    lastFrame := now;


    //Checks if the date has changed and then adjusts the values accordingly
    With DBModule do
    begin

      currentDate := Date;
      tblVehicle.First;

      While NOT(tblVehicle.Eof) do
      begin

        if tblVehicle['DateOfUpdate'] < currentDate then
        begin

          VehicleDate := Trunc(currentDate - tblVehicle['DateOfUpdate']);
          tblVehicle.Edit;
          tblVehicle['RepairTime'] := tblVehicle['RepairTime'] - VehicleDate;
          tblVehicle['DateOfUpdate'] := currentDate;
          tblVehicle['DailyDelivery'] := 0;
          tblVehicle.Post;

        end;

        tblVehicle.Next;

      end;

    end;

end;

procedure TfrmLoginScreen.lblAccountCreationClick(Sender: TObject);
begin

    //****
    Self.Hide;
    
    try
      frmAccountRegistry.ShowModal;
    finally
      frmAccountRegistry.free;
      Self.Show;
    end;
    //****

end;

procedure TfrmLoginScreen.MoveTrees;
begin


    //Moves trees and resets its positions if its out of view
    pnlBaseCar.BringToFront;
    pnlBaseTree1.SendToBack;
    pnlBaseTree2.SendToBack;
    pnlBaseTree1.Left := pnlBaseTree1.Left - Round(200 * DeltaTime);
    pnlBaseTree2.Left := pnlBaseTree2.Left - Round(200 * DeltaTime);

    if pnlBaseTree1.Left < -475 then
    begin

      pnlBaseTree1.Left := 530;

    end;

    if pnlBaseTree2.Left < -475 then
    begin

      pnlBaseTree2.Left := 530;

    end;

end;

procedure TfrmLoginScreen.Timer1Timer(Sender: TObject);
begin

    //****
    //Gets the current "frame" for deltaTime calculations
    CurrentFrame := Now;

    //Calculates the deltaTime and turn it into a milisecond value
    DeltaTime := (CurrentFrame - LastFrame) * 24 * 60 * 60;

    //Sets the current "frame" to the previous fram for next round of calculations
    LastFrame := CurrentFrame;
    //****

    MoveTrees;

end;

end.
