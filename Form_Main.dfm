object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'JAT Audio Device Selector'
  ClientHeight = 461
  ClientWidth = 734
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Meiryo UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 360
    Top = 256
    Width = 38
    Height = 15
    Caption = 'Label1'
  end
  object pgctrl_Device: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 461
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 24
    object mi_Settings: TMenuItem
      Caption = 'Settings'
      object mi_LanguageSettings: TMenuItem
        Caption = 'Language'
        object mi_Lang_English: TMenuItem
          Caption = 'English'
          OnClick = mi_Lang_EnglishClick
        end
        object mi_Lang_Japanese: TMenuItem
          Caption = 'Japanese'
          OnClick = mi_Lang_JapaneseClick
        end
      end
    end
  end
end
