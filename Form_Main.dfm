object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Audio Selector'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Client: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 633
      Height = 105
      Align = alTop
      Caption = 'GroupBox1'
      TabOrder = 0
      ExplicitLeft = 224
      ExplicitTop = 96
      ExplicitWidth = 185
      object Button1: TButton
        Left = 2
        Top = 15
        Width = 120
        Height = 88
        Align = alLeft
        Caption = 'Button1'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 122
        Top = 15
        Width = 120
        Height = 88
        Align = alLeft
        Caption = 'Button2'
        TabOrder = 1
      end
    end
  end
  object TrayIcon1: TTrayIcon
    Left = 48
    Top = 152
  end
end
