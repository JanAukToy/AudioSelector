// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit cmp_DevicePage;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls,

  cls_AudioDevice, cmp_PropertiesBox;

type
  // ----------------------------------------------------------------------------
  // Device Page
  TDevicePage = class(TTabSheet)
    procedure OnResizeDevicePage(Sender: TObject);
  private
    f_Device: TAudioDevice;
    f_DeviceProperiesBox: TDevicePropertiesBox;
    f_AudioPropertiesBox: TAdudioPropertiesBox;

    procedure SetLanguage(const a_LanguageType: TLanguageType);
  public
    constructor Create(AOwner: TComponent; const a_Device: TAudioDevice;
      const a_LanguageType: TLanguageType); reintroduce;
    destructor Destroy; override;

    property Language: TLanguageType write SetLanguage;
  end;

implementation

uses
  System.StrUtils;

// *****************************************************************************
// Constructor
constructor TDevicePage.Create(AOwner: TComponent; const a_Device: TAudioDevice;
  const a_LanguageType: TLanguageType);
begin
  inherited Create(AOwner);

  // Store Argments
  f_Device := a_Device;

  // Set Caption
  Self.Caption := f_Device.FriendlyName;

  // Create Child Boxes
  f_DeviceProperiesBox := TDevicePropertiesBox.Create(Self, a_Device,
    a_LanguageType);
  f_AudioPropertiesBox := TAdudioPropertiesBox.Create(Self, a_Device,
    a_LanguageType);

  // Register Event Callbacks
  // a_Device.OnChangeDeviceDesc := ;
  a_Device.OnChangeMasterLevel :=
    f_AudioPropertiesBox.OnChangeMasterLevel_bySystem;
  a_Device.OnChangeMute := f_AudioPropertiesBox.OnChangeMute_bySystem;

  // Set Parent
  f_DeviceProperiesBox.Parent := Self;
  f_AudioPropertiesBox.Parent := Self;

  // Set Resize Event
  Self.OnResize := OnResizeDevicePage;
end;

// *****************************************************************************
// Destructor
destructor TDevicePage.Destroy;
begin
  if Assigned(f_DeviceProperiesBox) then
    FreeAndNil(f_DeviceProperiesBox);
  if Assigned(f_AudioPropertiesBox) then
    FreeAndNil(f_AudioPropertiesBox);

  inherited;
end;

// *****************************************************************************
// Device Page Resize Event
procedure TDevicePage.OnResizeDevicePage(Sender: TObject);
var
  l_Width: Integer;
begin
  if csDestroying in Self.ComponentState then
  begin
    Exit;
  end;

  // Resizing Child GroupBox

  // Set Width to Propety Box
  l_Width := Self.Width div 2 - Round(PITCH_SIZE * 2);
  f_DeviceProperiesBox.Width := l_Width;
  f_AudioPropertiesBox.Width := l_Width;
end;

// *****************************************************************************
// Set Language
procedure TDevicePage.SetLanguage(const a_LanguageType: TLanguageType);
begin
  // Set Language at PropertiesBoxes
  f_DeviceProperiesBox.Language := a_LanguageType;
  f_AudioPropertiesBox.Language := a_LanguageType;
end;

end.
