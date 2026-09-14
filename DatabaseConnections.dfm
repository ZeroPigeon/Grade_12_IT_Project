object Database: TDatabase
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object DatabaseCon: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\briha\OneD' +
      'rive\Documents\PAT-12\IT-PAT\Phase 1\PAT-Databasis.mdb;Mode=Read' +
      'Write;Persist Security Info=False;Jet OLEDB:System database="";J' +
      'et OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLE' +
      'DB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Glo' +
      'bal Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet ' +
      'OLEDB:New Database Password="";Jet OLEDB:Create System Database=' +
      'False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Loca' +
      'le on Compact=False;Jet OLEDB:Compact Without Replica Repair=Fal' +
      'se;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 64
  end
  object LoginTbl: TADOTable
    Active = True
    Connection = DatabaseCon
    CursorType = ctStatic
    TableName = 'LoginTbl'
    Left = 160
    Top = 64
  end
  object dsrLogin: TDataSource
    DataSet = LoginTbl
    Left = 256
    Top = 64
  end
end
