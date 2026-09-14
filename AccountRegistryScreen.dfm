object frmAccountRegistry: TfrmAccountRegistry
  Left = 645
  Top = 262
  Caption = 'Account Registration'
  ClientHeight = 414
  ClientWidth = 624
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object lblStreetIndicator: TLabel
    Left = 24
    Top = 179
    Width = 89
    Height = 20
    Caption = 'Street name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 192
    Top = 179
    Width = 108
    Height = 20
    Caption = 'House number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnQuit: TButton
    Left = 360
    Top = 376
    Width = 121
    Height = 30
    Caption = 'Quit application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnQuitClick
  end
  object edtUsername: TLabeledEdit
    Left = 24
    Top = 32
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
    TabOrder = 1
    Text = ''
    TextHint = 'Name'
  end
  object edtPassword: TLabeledEdit
    Left = 24
    Top = 88
    Width = 121
    Height = 23
    EditLabel.Width = 71
    EditLabel.Height = 20
    EditLabel.Caption = 'Password:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    Text = ''
    TextHint = '******'
  end
  object edtVerifyPass: TLabeledEdit
    Left = 24
    Top = 145
    Width = 121
    Height = 23
    EditLabel.Width = 116
    EditLabel.Height = 20
    EditLabel.Caption = 'Verify Password:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 3
    Text = ''
    TextHint = '******'
  end
  object btnRegister: TButton
    Left = 24
    Top = 256
    Width = 138
    Height = 33
    Caption = 'Register account'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnRegisterClick
  end
  object redOutAccount: TRichEdit
    Left = 24
    Top = 312
    Width = 313
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object btnLoginScreen: TButton
    Left = 360
    Top = 311
    Width = 121
    Height = 25
    Caption = 'Login Screen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnLoginScreenClick
  end
  object btnViewPass: TButton
    Left = 151
    Top = 144
    Width = 25
    Height = 25
    Caption = #55357#56384
    TabOrder = 7
    OnClick = btnViewPassClick
  end
  object cmbStreetNames: TComboBox
    Left = 24
    Top = 205
    Width = 138
    Height = 23
    TabOrder = 8
    Text = 'Select Street Name:'
    OnChange = cmbStreetNamesChange
    Items.Strings = (
      'Oak Crescent'
      'Coral Terrace'
      'Ancient Avenue'
      'Creek Trail'
      'Golden Drive'
      'Sailor road'
      'Lake road'
      'Emerald way')
  end
  object cmbHorizontalNum: TComboBox
    Left = 192
    Top = 245
    Width = 145
    Height = 23
    Enabled = False
    TabOrder = 9
    Text = 'Select house number:'
    Visible = False
    Items.Strings = (
      '1'
      '2'
      '3'
      '5'
      '6'
      '7'
      '10'
      '11'
      '13'
      '14'
      '15'
      '17'
      '18'
      '19'
      '21'
      '22'
      '23')
  end
  object cmbVerticaleNum: TComboBox
    Left = 192
    Top = 205
    Width = 145
    Height = 23
    TabOrder = 10
    Text = 'Select house number:'
    Items.Strings = (
      '1'
      '2'
      '3'
      '5'
      '6'
      '7'
      '9'
      '10'
      '11'
      '13'
      '14'
      '15')
  end
end
