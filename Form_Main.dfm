object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'JAT Audio Device Selector'
  ClientHeight = 461
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Meiryo UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object pgctrl_Device: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 461
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitHeight = 478
  end
end
