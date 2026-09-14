object frmNewVehicle: TfrmNewVehicle
  Left = 710
  Top = 311
  Caption = 'New Vehicle Screen'
  ClientHeight = 316
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  TextHeight = 15
  object pnlBasePlate: TPanel
    Left = -6
    Top = 0
    Width = 260
    Height = 315
    Color = clLightgray
    ParentBackground = False
    TabOrder = 0
    object lblCmbInfo: TLabel
      Left = 16
      Top = 30
      Width = 194
      Height = 23
      Caption = 'Please select a driver ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVehicleSize: TLabel
      Left = 16
      Top = 176
      Width = 231
      Height = 20
      Caption = 'Please set size of vehicle storage:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblX1: TLabel
      Left = 80
      Top = 229
      Width = 11
      Height = 23
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblX2: TLabel
      Left = 175
      Top = 229
      Width = 11
      Height = 23
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblVehicleX: TLabel
      Left = 16
      Top = 211
      Width = 39
      Height = 15
      Caption = 'Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblWehicleZ: TLabel
      Left = 198
      Top = 211
      Width = 34
      Height = 15
      Caption = 'Width'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVehicleY: TLabel
      Left = 112
      Top = 211
      Width = 38
      Height = 15
      Caption = 'Height'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbDriverID: TComboBox
      Left = 16
      Top = 59
      Width = 145
      Height = 23
      TabOrder = 0
      Text = 'Driver ID Dropbox:'
    end
    object lbledtVehicleID: TLabeledEdit
      Left = 16
      Top = 131
      Width = 145
      Height = 23
      EditLabel.Width = 231
      EditLabel.Height = 20
      EditLabel.Caption = 'Please enter vehicle license plate:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 1
      Text = ''
    end
    object spnVehicleX: TSpinEdit
      Left = 16
      Top = 232
      Width = 49
      Height = 24
      MaxValue = 1000
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object spnVehicleY: TSpinEdit
      Left = 112
      Top = 232
      Width = 49
      Height = 24
      MaxValue = 1000
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object spnVehicleZ: TSpinEdit
      Left = 198
      Top = 232
      Width = 49
      Height = 24
      MaxValue = 1000
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object pnlVehicleRegister: TPanel
      Left = 16
      Top = 271
      Width = 126
      Height = 25
      Caption = 'Register Vehicle'
      Color = clDarkgray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = pnlVehicleRegisterClick
    end
    object pnlBack: TPanel
      Left = 175
      Top = 270
      Width = 73
      Height = 25
      Caption = 'Back'
      Color = clDarkgray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = pnlBackClick
    end
  end
end
