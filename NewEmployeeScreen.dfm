object frmNewEmployee: TfrmNewEmployee
  Left = 581
  Top = 196
  Caption = 'New Employee'
  ClientHeight = 387
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 385
    Color = clLightgray
    ParentBackground = False
    TabOrder = 0
    object lblrgpInfo: TLabel
      Left = 16
      Top = 208
      Width = 200
      Height = 20
      Caption = 'Select an authorization level:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbledtUsername: TLabeledEdit
      Left = 16
      Top = 40
      Width = 145
      Height = 23
      EditLabel.Width = 126
      EditLabel.Height = 20
      EditLabel.Caption = 'Enter a username:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object lbledtPassword: TLabeledEdit
      Left = 16
      Top = 104
      Width = 121
      Height = 23
      EditLabel.Width = 124
      EditLabel.Height = 20
      EditLabel.Caption = 'Enter a password:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 1
      Text = ''
    end
    object lbledtVerifyPass: TLabeledEdit
      Left = 16
      Top = 166
      Width = 121
      Height = 23
      EditLabel.Width = 143
      EditLabel.Height = 20
      EditLabel.Caption = 'Verify the password:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 2
      Text = ''
    end
    object pnlCreateAccount: TPanel
      Left = 14
      Top = 336
      Width = 121
      Height = 33
      Caption = 'Create account'
      Color = clDarkgray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = pnlCreateAccountClick
    end
    object pnlBack: TPanel
      Left = 166
      Top = 336
      Width = 97
      Height = 33
      Caption = 'Back'
      Color = clDarkgray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = pnlBackClick
    end
    object rgpAuthorizationLevel: TRadioGroup
      Left = 16
      Top = 234
      Width = 107
      Height = 87
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Items.Strings = (
        'Admin'
        'Driver')
      ParentFont = False
      TabOrder = 5
    end
  end
end
