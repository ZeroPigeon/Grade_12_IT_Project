object DBModule: TDBModule
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object ConDatabase: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\briha\OneD' +
      'rive\Documents\PAT-12\IT-PAT\Phase 2\PAT-Databasis.mdb;Mode=Read' +
      'Write;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 144
    Top = 72
  end
  object tblLogin: TADOTable
    Active = True
    Connection = ConDatabase
    CursorType = ctStatic
    TableName = 'LoginTbl'
    Left = 144
    Top = 160
  end
  object tblAccount: TADOTable
    Active = True
    Connection = ConDatabase
    CursorType = ctStatic
    TableName = 'AccountTbl'
    Left = 232
    Top = 160
  end
  object tblOrders: TADOTable
    Active = True
    Connection = ConDatabase
    CursorType = ctStatic
    TableName = 'OrderTbl'
    Left = 328
    Top = 160
  end
  object tblVehicle: TADOTable
    Active = True
    Connection = ConDatabase
    CursorType = ctStatic
    TableName = 'VehicleTbl'
    Left = 416
    Top = 160
  end
  object dsrVehicle: TDataSource
    DataSet = sqlVehicle
    Left = 416
    Top = 256
  end
  object sqlVehicle: TADOQuery
    Connection = ConDatabase
    CursorType = ctStatic
    Parameters = <>
    Left = 416
    Top = 360
  end
end
