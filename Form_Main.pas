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

    cls_AudioDeviceManager;

type
    TFormMain = class(TForm)
        TrayIcon1: TTrayIcon;
        pnl_Client: TPanel;
        GroupBox1: TGroupBox;
        Button1: TButton;
        Button2: TButton;
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
    private
        { Private �錾 }
        f_AudioDeviceManager: TAudioDeviceManager;
    public
        { Public �錾 }
    end;

var
    FormMain: TFormMain;

implementation

{$R *.dfm}

// *****************************************************************************
// Constructor
procedure TFormMain.FormCreate(Sender: TObject);
begin
    f_AudioDeviceManager := TAudioDeviceManager.Create;

    // Get Device Collection...
    if f_AudioDeviceManager.GetDeviceCollection then
    begin

    end;
end;

// *****************************************************************************
// Destructor
procedure TFormMain.FormDestroy(Sender: TObject);
begin
    FreeAndNil(f_AudioDeviceManager);
end;

end.
