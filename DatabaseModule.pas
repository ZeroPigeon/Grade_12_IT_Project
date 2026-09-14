unit DatabaseModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Data.FMTBcd,
  Data.SqlExpr;

type
  TDBModule = class(TDataModule)
    ConDatabase: TADOConnection;
    tblLogin: TADOTable;
    tblAccount: TADOTable;
    tblOrders: TADOTable;
    tblVehicle: TADOTable;
    dsrVehicle: TDataSource;
    sqlVehicle: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBModule: TDBModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
