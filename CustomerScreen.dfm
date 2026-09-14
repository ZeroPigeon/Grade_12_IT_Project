object frmCustomerReviewScreen: TfrmCustomerReviewScreen
  Left = 581
  Top = 229
  Caption = 'frmCustomerReviewScreen'
  ClientHeight = 441
  ClientWidth = 624
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 189
    Width = 100
    Height = 20
    Caption = 'Service rating:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblReviewInfo: TLabel
    Left = 24
    Top = 247
    Width = 294
    Height = 20
    Caption = 'Please enter the review you want to leave:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnQuitApplication: TButton
    Left = 479
    Top = 376
    Width = 121
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
  object spnRating: TSpinEdit
    Left = 24
    Top = 210
    Width = 65
    Height = 24
    MaxValue = 5
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object lbledtUsername: TLabeledEdit
    Left = 24
    Top = 40
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = ''
  end
  object lbledtOrderID: TLabeledEdit
    Left = 24
    Top = 96
    Width = 121
    Height = 23
    EditLabel.Width = 107
    EditLabel.Height = 20
    EditLabel.Caption = 'Order Number:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 3
    Text = ''
  end
  object lbledtVehicleID: TLabeledEdit
    Left = 24
    Top = 152
    Width = 121
    Height = 23
    EditLabel.Width = 150
    EditLabel.Height = 20
    EditLabel.Caption = 'Vehicle identification:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = ''
  end
  object redInputComment: TRichEdit
    Left = 24
    Top = 268
    Width = 249
    Height = 94
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object btnSendReview: TButton
    Left = 24
    Top = 384
    Width = 100
    Height = 33
    Caption = 'Send review'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnSendReviewClick
  end
  object btnReturnOrderScreen: TButton
    Left = 368
    Top = 376
    Width = 97
    Height = 33
    Caption = 'Return'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnReturnOrderScreenClick
  end
end
