// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit Form_Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,

  cls_AudioDeviceList, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFormMain = class(TForm)
    TrayIcon1: TTrayIcon;
    pnl_Client: TPanel;
    imglst_Icon: TImageList;
    PopupMenu1: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private êÈåæ }
    f_AudioDeviceList: TAudioDeviceList;
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
  l_MenuItem: TMenuItem;
begin
  // Create Audio Device List
  f_AudioDeviceList := TAudioDeviceList.Create;

  // Create Button using Audio Device
  for ii := 0 to f_AudioDeviceList.Count - 1 do
  begin
    l_MenuItem := TMenuItem.Create(Self);
    l_MenuItem.Caption := f_AudioDeviceList[ii].FriendlyName;

    PopupMenu1.Items.Add(l_MenuItem);
  end;
end;

// *****************************************************************************
// Destructor
procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(f_AudioDeviceList);
end;

end.
