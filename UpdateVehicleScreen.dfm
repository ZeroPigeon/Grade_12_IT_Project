object frmUpdateVehicle: TfrmUpdateVehicle
  Left = 549
  Top = 295
  Caption = 'frmUpdateVehicle'
  ClientHeight = 338
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 337
    Color = clLightgray
    ParentBackground = False
    TabOrder = 0
    object lblCmbInfo: TLabel
      Left = 15
      Top = 16
      Width = 181
      Height = 20
      Caption = 'Select a vehicle to update:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCalenderInfo: TLabel
      Left = 15
      Top = 203
      Width = 152
      Height = 20
      Caption = 'Select the repair date:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbVehicleID: TComboBox
      Left = 15
      Top = 42
      Width = 145
      Height = 23
      TabOrder = 0
      Text = 'Vehicle ID selector:'
    end
    object lbledtVehicleStatus: TLabeledEdit
      Left = 15
      Top = 104
      Width = 121
      Height = 23
      EditLabel.Width = 196
      EditLabel.Height = 20
      EditLabel.Caption = 'New status given to vehicle:'
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
      TabOrder = 1
      Text = ''
    end
    object lbledtBrokenPartInput: TLabeledEdit
      Left = 15
      Top = 160
      Width = 121
      Height = 23
      EditLabel.Width = 153
      EditLabel.Height = 20
      EditLabel.Caption = 'Part(s) that is broken:'
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
      TabOrder = 2
      Text = ''
    end
    object cldRepairTime: TCalendarPicker
      Left = 15
      Top = 229
      Height = 32
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -17
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -25
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TextHint = 'select a date'
    end
    object pnlUpdateVehicle: TPanel
      Left = 15
      Top = 287
      Width = 131
      Height = 33
      Caption = 'Update Vehicle'
      Color = clDarkgray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = pnlUpdateVehicleClick
    end
    object pnlBack: TPanel
      Left = 160
      Top = 287
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
      TabOrder = 5
      OnClick = pnlBackClick
    end
  end
end
