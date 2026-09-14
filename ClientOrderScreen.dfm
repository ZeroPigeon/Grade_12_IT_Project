object frmClientOrders: TfrmClientOrders
  Left = 0
  Top = 0
  Caption = 'Order Screen'
  ClientHeight = 441
  ClientWidth = 624
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object btnQuitApplication: TButton
    Left = 504
    Top = 400
    Width = 112
    Height = 33
    Caption = 'Quit application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnQuitApplicationClick
  end
  object edtlblClientID: TLabeledEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 23
    EditLabel.Width = 142
    EditLabel.Height = 20
    EditLabel.Caption = 'Client Identification:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = ''
  end
  object edtlblPackageSize: TLabeledEdit
    Left = 8
    Top = 136
    Width = 121
    Height = 23
    EditLabel.Width = 145
    EditLabel.Height = 20
    EditLabel.Caption = 'Package dimensions:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 2
    Text = ''
    TextHint = '11X22X33'
  end
  object btnItemOrder: TButton
    Left = 160
    Top = 35
    Width = 89
    Height = 33
    Caption = 'Order Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnItemOrderClick
  end
  object edtlblAddress: TLabeledEdit
    Left = 8
    Top = 224
    Width = 121
    Height = 23
    EditLabel.Width = 156
    EditLabel.Height = 20
    EditLabel.Caption = 'Address To Deliver To:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 4
    Text = ''
    TextHint = '1 Streetname'
  end
  object edtlblUsername: TLabeledEdit
    Left = 8
    Top = 41
    Width = 121
    Height = 23
    EditLabel.Width = 75
    EditLabel.Height = 20
    EditLabel.Caption = 'Username:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = ''
  end
  object edtlblOrderID: TLabeledEdit
    Left = 8
    Top = 272
    Width = 121
    Height = 23
    EditLabel.Width = 64
    EditLabel.Height = 20
    EditLabel.Caption = 'Order ID:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 6
    Text = ''
    TextHint = '123456'
  end
  object redOutOrderInformation: TRichEdit
    Left = 288
    Top = 35
    Width = 225
    Height = 110
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object btnGPS_Reroute: TButton
    Left = 520
    Top = 336
    Width = 96
    Height = 33
    Caption = 'GPS Screen'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnGPS_RerouteClick
  end
  object cmbOrderType: TComboBox
    Left = 8
    Top = 173
    Width = 121
    Height = 23
    TabOrder = 9
    Text = 'Package Status:'
    Items.Strings = (
      'Normal Package'
      'Fragile'
      'This Side Up (packaged the right side up)'
      'Do Not Stack'
      'Keep Dry'
      'Handle With Care'
      'Heavy')
  end
  object btnReviewScreen: TButton
    Left = 392
    Top = 336
    Width = 113
    Height = 33
    Caption = 'Review Screen'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = btnReviewScreenClick
  end
end
