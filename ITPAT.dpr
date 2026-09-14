program ITPAT;

uses
  Vcl.Forms,
  AdminScreen in 'AdminScreen.pas' {frmAdminPanel},
  LoginScreen in 'LoginScreen.pas' {frmLoginScreen},
  MapScreen in 'MapScreen.pas' {frmMapScreen},
  DriverScreen in 'DriverScreen.pas' {frmAssignOrder},
  CustomerScreen in 'CustomerScreen.pas' {frmCustomerReviewScreen},
  AccountRegistryScreen in 'AccountRegistryScreen.pas' {frmAccountRegistry},
  ClientOrderScreen in 'ClientOrderScreen.pas' {frmClientOrders},
  Collision in 'Collision.pas',
  VehicleMove in 'VehicleMove.pas',
  Grid_Node in 'Grid_Node.pas',
  A_Star_PathFinding in 'A_Star_PathFinding.pas',
  DatabaseModule in 'DatabaseModule.pas' {DBModule: TDataModule},
  GPS_Screen in 'GPS_Screen.pas' {frmGPS_Screen},
  NewVehicleScreen in 'NewVehicleScreen.pas' {frmNewVehicle},
  UpdateVehicleScreen in 'UpdateVehicleScreen.pas' {frmUpdateVehicle},
  NewEmployeeScreen in 'NewEmployeeScreen.pas' {frmNewEmployee};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBModule, DBModule);
  Application.CreateForm(TfrmLoginScreen, frmLoginScreen);
  Application.CreateForm(TfrmAdminPanel, frmAdminPanel);
  Application.CreateForm(TfrmAssignOrder, frmAssignOrder);
  Application.CreateForm(TfrmMapScreen, frmMapScreen);
  Application.CreateForm(TfrmGPS_Screen, frmGPS_Screen);
  Application.CreateForm(TfrmAccountRegistry, frmAccountRegistry);
  Application.CreateForm(TfrmClientOrders, frmClientOrders);
  Application.Run;
end.
