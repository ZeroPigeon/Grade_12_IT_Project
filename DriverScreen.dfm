object frmAssignOrder: TfrmAssignOrder
  Left = 549
  Top = 245
  Caption = 'Order Assignment Panel'
  ClientHeight = 441
  ClientWidth = 624
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 20
  object btnQuitApplication: TButton
    Left = 488
    Top = 400
    Width = 128
    Height = 33
    Caption = 'Quit application'
    TabOrder = 0
    OnClick = btnQuitApplicationClick
  end
  object edtlblDriverID: TLabeledEdit
    Left = 8
    Top = 48
    Width = 121
    Height = 23
    EditLabel.Width = 141
    EditLabel.Height = 20
    EditLabel.Caption = 'Driver Identification'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = ''
    TextHint = '1A123B'
  end
  object edtlblVehicleID: TLabeledEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 23
    EditLabel.Width = 147
    EditLabel.Height = 20
    EditLabel.Caption = 'Vehicle Identification'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = ''
    TextHint = 'AA11BB_GP'
  end
  object btnTakeOrder: TButton
    Left = 8
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Take Order'
    TabOrder = 3
    OnClick = btnTakeOrderClick
  end
  object redOutOrderInformation: TRichEdit
    Left = 8
    Top = 202
    Width = 210
    Height = 135
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object lbledtDepartureTime: TLabeledEdit
    Left = 288
    Top = 200
    Width = 145
    Height = 28
    EditLabel.Width = 186
    EditLabel.Height = 20
    EditLabel.Caption = 'Suggested departure time:'
    TabOrder = 5
    Text = ''
  end
  object lbledtArrivalTime: TLabeledEdit
    Left = 288
    Top = 256
    Width = 145
    Height = 23
    EditLabel.Width = 158
    EditLabel.Height = 20
    EditLabel.Caption = 'Estimated arrival time:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = ''
  end
  object lbledtDistance: TLabeledEdit
    Left = 288
    Top = 312
    Width = 145
    Height = 28
    EditLabel.Width = 141
    EditLabel.Height = 20
    EditLabel.Caption = 'Distance to address:'
    TabOrder = 7
    Text = ''
  end
  object x: TButton
    Left = 359
    Top = 400
    Width = 107
    Height = 33
    Caption = 'GPS screen'
    TabOrder = 8
    OnClick = xClick
  end
end
