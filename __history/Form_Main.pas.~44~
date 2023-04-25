// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit Form_Main;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.ComCtrls, Vcl.Controls,
  Vcl.ToolWin, Vcl.Menus, System.Generics.Collections,

  cls_AudioDeviceList, cmp_DevicePage;

type
  TFormMain = class(TForm)
    pgctrl_Device: TPageControl;
    MainMenu1: TMainMenu;
    mi_Settings: TMenuItem;
    mi_LanguageSettings: TMenuItem;
    mi_Lang_English: TMenuItem;
    mi_Lang_Japanese: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mi_Lang_EnglishClick(Sender: TObject);
    procedure mi_Lang_JapaneseClick(Sender: TObject);
  private
    { Private êÈåæ }
    f_AudioDeviceList: TAudioDeviceList;
    f_DevicePageList: TList<TDevicePage>;
  public
    { Public êÈåæ }
  end;

var
  FormMain: TFormMain;

implementation

uses
  cls_AudioDevice;

{$R *.dfm}

// *****************************************************************************
// Constructor
procedure TFormMain.FormCreate(Sender: TObject);
var
  ii: Integer;
begin
  // Create Audio Device List
  f_AudioDeviceList := TAudioDeviceList.Create;

  // Create Device Page List
  f_DevicePageList := TList<TDevicePage>.Create;

  // Create Device Pages
  for ii := 0 to f_AudioDeviceList.Count - 1 do
  begin
    f_DevicePageList.Add(TDevicePage.Create(Self, f_AudioDeviceList[ii],
      ltEnglish));
    f_DevicePageList[ii].PageControl := pgctrl_Device;
  end;
end;

// *****************************************************************************
// Destructor
procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(f_AudioDeviceList);
  FreeAndNil(f_DevicePageList);
end;

// *****************************************************************************
// Select Language
procedure TFormMain.mi_Lang_EnglishClick(Sender: TObject);
var
  l_DevicePage: TDevicePage;
begin
  for l_DevicePage in f_DevicePageList do
  begin
    l_DevicePage.Language := ltEnglish;
  end;
end;

// *****************************************************************************
// Select Language
procedure TFormMain.mi_Lang_JapaneseClick(Sender: TObject);
var
  l_DevicePage: TDevicePage;
begin
  for l_DevicePage in f_DevicePageList do
  begin
    l_DevicePage.Language := ltJapanese;
  end;
end;

end.
