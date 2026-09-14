unit ClientOrderScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, DateUtils, DatabaseModule,
  Vcl.ComCtrls, GPS_Screen, CustomerScreen;

type
  TfrmClientOrders = class(TForm)
    btnQuitApplication: TButton;
    edtlblClientID: TLabeledEdit;
    edtlblPackageSize: TLabeledEdit;
    btnItemOrder: TButton;
    edtlblAddress: TLabeledEdit;
    edtlblUsername: TLabeledEdit;
    edtlblOrderID: TLabeledEdit;
    redOutOrderInformation: TRichEdit;
    btnGPS_Reroute: TButton;
    cmbOrderType: TComboBox;
    btnReviewScreen: TButton;
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure btnItemOrderClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGPS_RerouteClick(Sender: TObject);
    procedure btnReviewScreenClick(Sender: TObject);
  private

    iDistance : Integer;


    function CalcPackageCost(sPackageSize : String) : Real;
    function ChooseVehicle(PackageSize : String; bThisSideUp : Boolean) : String;
    function CalcArrivalTime : TTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientOrders: TfrmClientOrders;

implementation

{$R *.dfm}

procedure TfrmClientOrders.btnQuitApplicationClick(Sender: TObject);
begin

    //Stops the application from running
    Application.terminate;

end;

procedure TfrmClientOrders.btnReviewScreenClick(Sender: TObject);
var
  frmCustomerReviewScreen : TfrmCustomerReviewScreen;
begin

    //****

    Self.Hide;

    frmCustomerReviewScreen := TfrmCustomerReviewScreen.Create(Self);

    try
      frmCustomerReviewScreen.ShowModal;
    finally
      frmCustomerReviewScreen.Free;
      Self.Show;
    end;
    //****

end;

function TfrmClientOrders.CalcArrivalTime : TTime;
var
  iWarehouseX, iWarehouseY, iAddressX, iAddressY : Integer;
  tCurrentTime : TTime;
  i: Integer;
begin

  //Sets variables for later use
  iWarehouseX := 8;
  iWarehouseY := 7;
  iAddressX := DBModule.tblAccount['AddressX'];
  iAddressY := DBModule.tblAccount['AddressY'];

  //Calculate the distance from the warehouse to the destination
  iDistance := Abs(iWarehouseX - iAddressX) + Abs(iWarehouseY - iAddressY);

  tCurrentTime := Time;
  tCurrentTime := IncMinute(tCurrentTime, 10);

  //Calculate the estimated time of arrivale for the vehicle
  for i := 1 to iDistance do
  begin

    tCurrentTime := IncMinute(tCurrentTime, 2);

  end;

  result := tCurrentTime;

end;


function TfrmClientOrders.CalcPackageCost(sPackageSize: String): Real;
var
  rCost : Real;
  i: Integer;
begin

  //Calculates the cost of the delivery based on the package size
  rCost := 0;
  for i := 1 to 2 do
  begin

      rCost := rCost + (StrToFloat(Copy(sPackageSize, 1, Pos('X', sPackageSize) - 1)) * 3);
      Delete(sPackageSize, 1, Pos('X', sPackageSize));

  end;

  rCost := rCost + (StrToFloat(sPackageSize) * 3);

  result := rCost;

end;

function TfrmClientOrders.ChooseVehicle(PackageSize: String; bThisSideUp : Boolean): String;
var
  iPx, iPy, iPz, iVx, iVy, iVz : Integer;
  sVehicleSize : String;
begin

    //Selects a vehicle based on the size of the package to ensure that the
    //package will fit inside the vehicle
    iPx := StrToInt(Copy(PackageSize, 1, Pos('X', PackageSize) - 1));
    Delete(PackageSize, 1, Pos('X', PackageSize));
    iPy := StrToInt(Copy(PackageSize, 1, Pos('X', PackageSize) - 1));
    Delete(PackageSize, 1, Pos('X', PackageSize));
    iPz := StrToInt(Copy(PackageSize, 1, Length(PackageSize)));

    with DBModule do
    begin

      tblVehicle.First;

      While NOT tblVehicle.Eof do
      begin

        sVehicleSize := tblVehicle['VehicleSize'];

        iVx := StrToInt(Copy(sVehicleSize, 1, Pos('X', sVehicleSize) - 1));
        Delete(sVehicleSize, 1, Pos('X', sVehicleSize));
        iVy := StrToInt(Copy(sVehicleSize, 1, Pos('X', sVehicleSize) - 1));
        Delete(sVehicleSize, 1, Pos('X', sVehicleSize));
        iVz := StrToInt(Copy(sVehicleSize, 1, Length(sVehicleSize)));

        if ((iPx < iVx) AND (iPy < iVy) AND (iPz < iVz)) OR ((iPy < iVx) AND (iPx < iVy) AND (iPz < iVz)) OR ((iPz < iVx) AND (iPy < iVy) AND (iPx < iVz)) OR ((iPx < iVx) AND (iPz < iVy) AND (iPy < iVz)) then
        begin

          if bThisSideUp then
          begin

              if (iPx < iVx) AND (iPy < iVy) AND (iPz < iVz) then
              begin

                ShowMessage('Your order has been entered into the system, a driver will be picking it up as soon as possible');
                tblVehicle.Edit;
                tblVehicle['OrderID'] := tblOrders['OrderID'];
                tblVehicle.Post;
                result := tblVehicle['VehicleID'];
                Exit;

              end else
                begin

                  if (tblVehicle.RecNo = tblVehicle.RecordCount) then
                  begin

                    break;

                  end else
                  begin

                    Continue;

                  end;
                end;

          end else
          begin

            ShowMessage('Your order has been entered into the system, a driver will be picking it up as soon as possible');
            tblVehicle.Edit;
            tblVehicle['OrderID'] := tblOrders['OrderID'];
            tblVehicle.Post;
            result := tblVehicle['VehicleID'];
            Exit;

          end;

        end else

        tblVehicle.Next;

      end;

    end;

    ShowMessage('Your package is to big for any vehicle that the company owns, please get a different package');

end;

procedure TfrmClientOrders.btnGPS_RerouteClick(Sender: TObject);
var
  GPS_Screen : TfrmGPS_Screen;
begin

    //****

    //TODO: Find other way of hiding screen and showing it later, allowing vehicle to move
    //even if the screen is not being looked at
    Self.Hide;

    GPS_Screen := TfrmGPS_Screen.Create(Self);

    try
      GPS_Screen.ShowModal;
    finally
      GPS_Screen.Free;
      Self.Show;
    end;
    //****


end;

procedure TfrmClientOrders.btnItemOrderClick(Sender: TObject);
var
    sPackageSize, sOrderType, sOrderID, sVehicleID : String;
    rCost : Real;
    tArrivalTime : TTime;
    bThisSideUp : Boolean;
begin

  //Assings variables and checks that no fields are left empty
  sPackageSize := edtlblPackageSize.Text;
  sOrderID := edtlblOrderID.Text;

  bThisSideUp := false;

  if sPackageSize.IsEmpty then
  begin

    ShowMessage('Please input a package size before trying to order it');
    exit;

  end;

  if sOrderID.IsEmpty then
  begin

    ShowMessage('Please enter the package ID before trying to order a package');
    exit;

  end;

  if cmbOrderType.ItemIndex <> -1 then
  begin

    sOrderType := cmbOrderType.Text;

  end else
  begin

    ShowMessage('Please select the order type before trying to order the package');
    exit;

  end;


  if sOrderType = 'This Side Up (packaged the right side up)' then
  begin

    bThisSideUp := true;

  end;

  //Assigns values accordinly and checks if a vehicle was selected
  rCost := CalcPackageCost(sPackageSize);
  sVehicleID := ChooseVehicle(sPackageSize, bThisSideUp);
  tArrivalTime := CalcArrivalTime;

  if Length(sVehicleID) > 0 then
  begin

    redOutOrderInformation.Clear;
    redOutOrderInformation.Lines.Add('Delivery Cost: ' + FloatToStrF(rCost, ffCurrency, 10, 2));
    redOutOrderInformation.Lines.Add('Delivery Vehicle ID: ' + sVehicleID);
    redOutOrderInformation.Lines.Add('Estimated Delivery Time: ' + TimeToStr(tArrivalTime));

  end;

  //Assigns the order to the vehicle ID for the vehicle to deliver the package
  with DBModule do
  begin

    tblOrders.Insert;
    tblOrders['SizeOfPackage'] := sPackageSize;
    tblOrders['OrderType'] := sOrderType;
    tblOrders['OrderID'] := sOrderID;
    tblOrders['Address'] := tblAccount['Address'];
    tblOrders['PackageCost'] := rCost;
    tblOrders['SuggestedDepartureTime'] := IncMinute(Time, 10);
    tblOrders['EstimatedArrivalTime'] := tArrivalTime;
    tblOrders['DistanceToHouse'] := iDistance * 30;
    tblOrders.Post;
    tblAccount.Edit;
    tblAccount['OrderID'] := sOrderID;
    tblAccount.Post;

    btnReviewScreen.Enabled := true;
    btnGPS_Reroute.Enabled := true;

  end;


end;

procedure TfrmClientOrders.FormActivate(Sender: TObject);
var
  sID : String;
begin

    //Sets some edits for the user to ensure easier usage

    with DBModule do
    begin

      sID := tblLogin['UserID'];

      tblAccount.Locate('AccountID', sID, []);

      edtlblClientID.Text := tblAccount['AccountID'];
      edtlblUsername.Text := tblAccount['Username'];
      edtlblAddress.Text := tblAccount['Address'];

    end;

end;

procedure TfrmClientOrders.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    //Stops the application if the user closes the screen
    Application.Terminate;

end;

end.
