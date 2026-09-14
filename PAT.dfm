object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 304
    Width = 121
    Height = 17
    Caption = 'Regester an account'
  end
  object Login: TButton
    Left = 24
    Top = 216
    Width = 91
    Height = 41
    Caption = 'Login'
    TabOrder = 0
  end
  object Username: TLabeledEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 23
    EditLabel.Width = 53
    EditLabel.Height = 15
    EditLabel.Caption = 'Username'
    TabOrder = 1
    Text = ''
  end
  object Password: TLabeledEdit
    Left = 24
    Top = 176
    Width = 121
    Height = 23
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Password'
    TabOrder = 2
    Text = ''
  end
  object Button1: TButton
    Left = 24
    Top = 376
    Width = 97
    Height = 33
    Caption = 'Quit application'
    TabOrder = 3
  end
end
