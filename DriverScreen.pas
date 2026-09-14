unit DriverScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, DatabaseModule, GPS_Screen;

type
  TfrmAssignOrder = class(TForm)
    btnQuitApplication: TButton;
    edtlblDriverID: TLabeledEdit;
    edtlblVehicleID: TLabeledEdit;
    btnTakeOrder: TButton;
    redOutOrderInformation: TRichEdit;
    lbledtDepartureTime: TLabeledEdit;
    lbledtArrivalTime: TLabeledEdit;
    lbledtDistance: TLabeledEdit;
    x: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnQuitApplicationClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTakeOrderClick(Sender: TObject);
    procedure xClick(Sender: TObject);
  private

  bGPS : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssignOrder: TfrmAssignOrder;

implementation

{$R *.dfm}

procedure TfrmAssignOrder.btnTakeOrderClick(Sender: TObject);
var
  sVehicleID, sPackageType, sSizeOfPackage, sAddress, sDriverID : String;
  iOrderID : Integer;
begin

    //Sets variables accordinly
    bGPS := false;

    sVehicleID := edtlblVehicleID.Text;
    sDriverID := edtlblDriverID.Text;

    //Ensures no fields were left empty
    if sDriverID.IsEmpty then
    begin

      ShowMessage('Please input an ID before requesting an order');
      exit;

    end;

    if sVehicleID.IsEmpty then
    begin

      ShowMessage('Please input a vehicle ID before requesting an order.');
      exit;

    end;

    //Locate driver and output message if not found
    with DBModule do
    begin

      tblVehicle.Locate('VehicleID', sVehicleID, []);

      if tblVehicle['DriverID'] <> sDriverID then
      begin

        ShowMessage('Please input the correct driver or vehicle ID');
        Exit;

      end;

      iOrderID := 0;

      tblVehicle.First;

      //Assigns the vehicle order ID
      While NOT(tblVehicle.Eof) do
      begin

        if sVehicleID = tblVehicle['VehicleID'] then
        begin

          iOrderID := tblVehicle['OrderID'];
          break;

        end;

        tblVehicle.Next;

      end;

      tblOrders.First;

      //Assigns information of order
      While NOT(tblOrders.Eof) do
      begin

        if iOrderID <> 0 then
        begin

          if iOrderID = tblOrders['OrderID'] then
            begin

              sSizeOfPackage := tblOrders['SizeOfPackage'];
              sPackageType := tblOrders['OrderType'];
              sAddress := tblOrders['Address'];
              break;

             end;

        end else
        begin

          ShowMessage('No package currently available for delivery, please check back in later');
          exit;

        end;

        tblOrders.Next;

      end;

      //Output for user to read
      redOutOrderInformation.Clear;
      redOutOrderInformation.Lines.Add('OrderID: ' + IntToStr(iOrderID));
      redOutOrderInformation.Lines.Add('Order Type: ' + sPackageType);
      redOutOrderInformation.Lines.Add('Size Of Package: ' + sSizeOfPackage + 'cm');
      redOutOrderInformation.Lines.Add('Address: ' + sAddress);

      lbledtDepartureTime.Text := tblOrders['SuggestedDepartureTime'];
      lbledtArrivalTime.Text := tblOrders['EstimatedArrivalTime'];
      lbledtDistance.Text := IntToStr(tblOrders['DistanceToHouse']) + ' M';

    end;

end;

procedure TfrmAssignOrder.btnQuitApplicationClick(Sender: TObject);
begin

    //Terminate Application
    Application.Terminate;

end;

procedure TfrmAssignOrder.FormActivate(Sender: TObject);
begin

  //Assigns user and driver IDs accordingly
  edtlblDriverID.Text := DBModule.tblLogin['UserID'];

  DBModule.tblVehicle.Locate('DriverID', DBModule.tblLogin['UserID'], []);

  edtlblVehicleID.Text := DBModule.tblVehicle['VehicleID'];

end;

procedure TfrmAssignOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    //Terminates application
    Application.Terminate;

end;

procedure TfrmAssignOrder.xClick(Sender: TObject);
var
  GPS_Screen : TfrmGPS_Screen;
begin

    //TODO: Find other way of hiding screen and showing it later, allowing vehicle to move
    //even if the screen is not being looked at
    if NOT(bGPS) then
    begin

      //****
      Self.Hide;

      GPS_Screen := TfrmGPS_Screen.Create(Self);

      try
        GPS_Screen.ShowModal;
      finally
        GPS_Screen.Free;
        Self.Show;
      end;
      //****

      bGPS := True;

    end else
    begin

      //****
      Self.Hide;

      try
        GPS_Screen.ShowModal;
      finally
        GPS_Screen.Hide;
        Self.Show;
      end;
      //****

    end;



end;

end.
