unit CustomerScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Samples.Spin, DatabaseModule;

type
  TfrmCustomerReviewScreen = class(TForm)
    btnQuitApplication: TButton;
    spnRating: TSpinEdit;
    lbledtUsername: TLabeledEdit;
    lbledtOrderID: TLabeledEdit;
    lbledtVehicleID: TLabeledEdit;
    Label1: TLabel;
    redInputComment: TRichEdit;
    btnSendReview: TButton;
    btnReturnOrderScreen: TButton;
    lblReviewInfo: TLabel;
    procedure btnReturnOrderScreenClick(Sender: TObject);
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendReviewClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomerReviewScreen: TfrmCustomerReviewScreen;

implementation

{$R *.dfm}

procedure TfrmCustomerReviewScreen.btnReturnOrderScreenClick(Sender: TObject);
begin

    //Close screen
    Close;

end;

procedure TfrmCustomerReviewScreen.btnQuitApplicationClick(Sender: TObject);
begin

    //Terminates the application
    Application.Terminate;

end;

procedure TfrmCustomerReviewScreen.btnSendReviewClick(Sender: TObject);
var
    sUsername, sVehicleID, sReview, sFileName, sStars : String;
    iOrderID, iRating : Integer;
    VehicleReviewFile : TextFile;
  i: Integer;
begin

  //Assigns variables
  sUsername := lbledtUsername.Text;
  sVehicleID := lbledtVehicleID.Text;
  iOrderID := StrToInt(lbledtOrderID.Text);
  iRating := spnRating.Value;
  sReview := redInputComment.Text;

  sStars := '';

  //Fills in stars for the rating and fills the rest of the rating with #
  for i := 1 to iRating do
  begin

    sStars := sStars + '*';

  end;

  for i := 1 to 5 - iRating do
  begin

    sStars := sStars + '#';

  end;

  //Assigns rating to the corrisponding vehicle
  sFileName := sVehicleID + '.txt';

  AssignFile(VehicleReviewFile, sFileName);

  if FileExists(sFileName) then
  begin

    Append(VehicleReviewFile);

    WriteLn(VehicleReviewFile, 'Client name: ' + sUsername + '     Package ID: ' + IntToStr(iOrderID) + '     Rating given to driver: ' + sStars);
    WriteLn(VehicleReviewFile, sReview);
    WriteLn(VehicleReviewFile, '');

  end else
  begin

    Rewrite(VehicleReviewFile);

    WriteLn(VehicleReviewFile, 'Client name: ' + sUsername + '     Package ID: ' + IntToStr(iOrderID) + '     Rating given to driver: ' + sStars);
    WriteLn(VehicleReviewFile, sReview);
    WriteLn(VehicleReviewFile, '');

  end;

  CloseFile(VehicleReviewFile);

  ShowMessage('Your review has been processed and will be examined for future improvements');


end;

procedure TfrmCustomerReviewScreen.FormActivate(Sender: TObject);
begin

  //Assings user variables upon opening the screen
  with DBModule do
  begin

    lbledtUsername.Text := tblAccount['Username'];
    lbledtVehicleID.Text := tblVehicle['VehicleID'];
    lbledtOrderID.Text := tblVehicle['OrderID'];

  end;


end;

procedure TfrmCustomerReviewScreen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    //Terminates the application
    Application.Terminate;

end;

end.
