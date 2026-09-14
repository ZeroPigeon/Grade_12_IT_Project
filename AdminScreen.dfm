object frmAdminPanel: TfrmAdminPanel
  Left = 549
  Top = 213
  Caption = 'Admin Panel'
  ClientHeight = 447
  ClientWidth = 709
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object btnCheckVehicle: TButton
    Left = 168
    Top = 232
    Width = 113
    Height = 33
    Caption = 'Look up vehicle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnCheckVehicleClick
  end
  object btnQuitApplication: TButton
    Left = 560
    Top = 391
    Width = 121
    Height = 33
    Caption = 'Quit application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnQuitApplicationClick
  end
  object VehicleStatusRedout: TRichEdit
    Left = 24
    Top = 79
    Width = 257
    Height = 106
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '@Yu Gothic UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 2
  end
  object btnSaveTextFile: TButton
    Left = 24
    Top = 354
    Width = 113
    Height = 33
    Caption = 'Save to textfile'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSaveTextFileClick
  end
  object rgpSelectionChoices: TRadioGroup
    Left = 287
    Top = 216
    Width = 170
    Height = 169
    Caption = 'Choices'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Items.Strings = (
      'All Vehicles'
      'All Damaged Vehicles'
      'All Drivable Vehicles')
    ParentFont = False
    TabOrder = 4
    OnClick = rgpSelectionChoicesClick
  end
  object btnDisplayStatus: TButton
    Left = 24
    Top = 232
    Width = 113
    Height = 33
    Caption = 'Display Statuses'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnDisplayStatusClick
  end
  object btnRerouteToMap: TButton
    Left = 424
    Top = 391
    Width = 113
    Height = 33
    Caption = 'Map screen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnRerouteToMapClick
  end
  object btnNewVehicle: TButton
    Left = 168
    Top = 288
    Width = 113
    Height = 33
    Caption = 'New Vehicle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnNewVehicleClick
  end
  object cmbVehicleID: TComboBox
    Left = 24
    Top = 32
    Width = 145
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'Select Vehicle ID:'
  end
  object dbgOutput: TDBGrid
    Left = 287
    Top = 79
    Width = 354
    Height = 106
    DataSource = DBModule.dsrVehicle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnUpdateVehicle: TButton
    Left = 24
    Top = 288
    Width = 113
    Height = 33
    Caption = 'Update Vehicle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = btnUpdateVehicleClick
  end
  object rgpSelectStats: TRadioGroup
    Left = 458
    Top = 216
    Width = 223
    Height = 169
    Caption = 'Statistics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Items.Strings = (
      'Total amount of deliveries'
      'Average amount of deliveries'
      'Deliveries per vehicle'
      'Vehicle with most deliveries'
      'Vehicle with least deliveries')
    ParentFont = False
    TabOrder = 11
    OnClick = rgpSelectStatsClick
  end
  object btnNewEmployee: TButton
    Left = 168
    Top = 356
    Width = 113
    Height = 29
    Caption = 'New Employee'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = btnNewEmployeeClick
  end
end
