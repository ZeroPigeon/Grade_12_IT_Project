unit DatabaseConnections;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDatabase = class(TDataModule)
    DatabaseCon: TADOConnection;
    LoginTbl: TADOTable;
    dsrLogin: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Database: TDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
