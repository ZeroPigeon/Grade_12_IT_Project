object frmMapScreen: TfrmMapScreen
  Left = 452
  Top = 278
  BorderStyle = bsDialog
  Caption = 'Overall map screen'
  ClientHeight = 577
  ClientWidth = 986
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Base: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 450
    ParentCustomHint = False
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object Block_1: TPanel
      Left = 0
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 0
    end
    object Block_2: TPanel
      Left = 120
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 1
    end
    object Block_3: TPanel
      Left = 240
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 2
    end
    object Block_4: TPanel
      Left = 360
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 3
    end
    object Block_5: TPanel
      Left = 480
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 4
    end
    object Block_6: TPanel
      Left = 600
      Top = 0
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 5
    end
    object Block_7: TPanel
      Left = 0
      Top = 117
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 6
    end
    object Block_13: TPanel
      Left = 0
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 7
    end
    object Block_19: TPanel
      Left = 0
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 8
    end
    object Block_8: TPanel
      Left = 120
      Top = 120
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 9
    end
    object Block_9: TPanel
      Left = 240
      Top = 120
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 10
    end
    object Block_10: TPanel
      Left = 360
      Top = 117
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 11
    end
    object Block_11: TPanel
      Left = 480
      Top = 120
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 12
    end
    object Block_12: TPanel
      Left = 602
      Top = 120
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 13
    end
    object Block_14: TPanel
      Left = 120
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 14
    end
    object Block_15: TPanel
      Left = 240
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 15
    end
    object Block_16: TPanel
      Left = 360
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 16
    end
    object Block_17: TPanel
      Left = 480
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 17
    end
    object Block_18: TPanel
      Left = 600
      Top = 240
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 18
    end
    object Block_20: TPanel
      Left = 120
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 19
    end
    object Block_21: TPanel
      Left = 241
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 20
    end
    object Block_22: TPanel
      Left = 360
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 21
    end
    object Block_23: TPanel
      Left = 480
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 22
    end
    object Block_24: TPanel
      Left = 600
      Top = 360
      Width = 90
      Height = 90
      Color = clGrayText
      ParentBackground = False
      TabOrder = 23
    end
  end
  object btnQuitApplication: TButton
    Left = 560
    Top = 481
    Width = 130
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
  object btnBack: TButton
    Left = 432
    Top = 480
    Width = 114
    Height = 34
    Caption = 'Admin screen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnBackClick
  end
  object lbledtVehicleID: TLabeledEdit
    Left = 706
    Top = 46
    Width = 137
    Height = 23
    EditLabel.Width = 151
    EditLabel.Height = 20
    EditLabel.Caption = 'Vehicle Identification:'
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
    TabOrder = 3
    Text = ''
    TextHint = 'AA11BB_GP'
  end
  object btnGatherInfo: TButton
    Left = 706
    Top = 80
    Width = 137
    Height = 33
    Caption = 'Get information'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnGatherInfoClick
  end
  object redOutInformation: TRichEdit
    Left = 706
    Top = 136
    Width = 263
    Height = 382
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 16
    OnTimer = Timer1Timer
    Left = 328
    Top = 474
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 392
    Top = 472
  end
end
