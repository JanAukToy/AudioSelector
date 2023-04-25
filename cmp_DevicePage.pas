// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit cmp_DevicePage;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls,

  cls_AudioDevice;

type
  // Language Type
  TLanguageType = (ltEnglish, ltJapanese);

  // Property Panel
  TPropertyPanel = class(TPanel)
  private
    f_Label: TLabel;
    f_Edit: TEdit;

    function GetPropertyLabel(): string;
    function GetPropertyValue(): string;
    procedure SetPropertyLabel(const a_Value: string);
    procedure SetPropertyValue(const a_Value: string);
  public
    constructor Create(AOwner: TComponent; const a_Label, a_Value: string;
      const a_NumbersOnly: Boolean); reintroduce;
    destructor Destroy; override;

    property PropertyLabel: string read GetPropertyLabel write SetPropertyLabel;
    property PropertyValue: string read GetPropertyValue write SetPropertyValue;
  end;

  // Properties Box
  TPropertiesBox = class(TGroupBox)
  private
    f_Device: TAudioDevice;

    procedure SetLanguage(const a_LanguageType: TLanguageType);
      virtual; abstract;
  public
    constructor Create(AOwner: TComponent; const a_Device: TAudioDevice;
      const a_LanguageType: TLanguageType); reintroduce;
    destructor Destroy; override;
    property Language: TLanguageType write SetLanguage;
    procedure RefreshProperties(); virtual; abstract;
  end;

  // Properties Box - Device
  TDevicePropertiesBox = class(TPropertiesBox)
  private
    f_InterfaceFriendlyNamePanel: TPropertyPanel;
    f_DeviceDescPanel: TPropertyPanel;
    f_FriendlyNamePanel: TPropertyPanel;

    procedure SetLanguage(const a_LanguageType: TLanguageType); override;
  public
    procedure RefreshProperties(); override;
  end;

  // Properties Box - Audio
  TAdudioPropertiesBox = class(TPropertiesBox)
  private
    procedure SetLanguage(const a_LanguageType: TLanguageType); override;
  public
    procedure RefreshProperties(); override;
  end;

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

const
  PITCH_SIZE: Integer = 10;

implementation

uses
  System.StrUtils;

{ TDevicePage }

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

{ TAdudioPropertiesBox }

// *****************************************************************************
// Set LanguageType
procedure TAdudioPropertiesBox.SetLanguage(const a_LanguageType: TLanguageType);
begin
  Self.Caption := IfThen(a_LanguageType = ltEnglish, 'Audio Properties',
    'オーディオ設定');
end;

// *****************************************************************************
// Refresh Props
procedure TAdudioPropertiesBox.RefreshProperties;
begin;
end;

{ TDevicePropertiesBox }

// *****************************************************************************
// Set LanguageType
procedure TDevicePropertiesBox.SetLanguage(const a_LanguageType: TLanguageType);
begin
  Self.Caption := IfThen(a_LanguageType = ltEnglish, 'Device Properties',
    'デバイス設定');
  f_InterfaceFriendlyNamePanel.PropertyLabel :=
    IfThen(a_LanguageType = ltEnglish, 'InterfaceFriendlyName', 'アダプター名');
  f_DeviceDescPanel.PropertyLabel := IfThen(a_LanguageType = ltEnglish,
    'DeviceDesc', '説明');
  f_FriendlyNamePanel.PropertyLabel := IfThen(a_LanguageType = ltEnglish,
    'FriendlyName', 'デバイス名');
end;

// *****************************************************************************
// Refresh Props
procedure TDevicePropertiesBox.RefreshProperties;
begin
  // Destroying
  if Assigned(f_InterfaceFriendlyNamePanel) then
    FreeAndNil(f_InterfaceFriendlyNamePanel);
  if Assigned(f_DeviceDescPanel) then
    FreeAndNil(f_DeviceDescPanel);
  if Assigned(f_FriendlyNamePanel) then
    FreeAndNil(f_FriendlyNamePanel);

  // Create Panels
  f_InterfaceFriendlyNamePanel := TPropertyPanel.Create(Self,
    'InterfaceFriendlyName', f_Device.InterfaceFriendlyName, False);
  f_DeviceDescPanel := TPropertyPanel.Create(Self, 'DeviceDesc',
    f_Device.DeviceDesc, False);
  f_FriendlyNamePanel := TPropertyPanel.Create(Self, 'FriendlyName',
    f_Device.FriendlyName, False);

  // Set Parent
  f_InterfaceFriendlyNamePanel.Parent := Self;
  f_DeviceDescPanel.Parent := Self;
  f_FriendlyNamePanel.Parent := Self;
end;

{ TPropertiesBox }

// *****************************************************************************
// Constructor
constructor TPropertiesBox.Create(AOwner: TComponent;
  const a_Device: TAudioDevice; const a_LanguageType: TLanguageType);
begin
  inherited Create(AOwner);

  // Setting
  Self.Align := alLeft;
  Self.AlignWithMargins := True;
  Self.Margins.SetBounds(PITCH_SIZE, PITCH_SIZE, PITCH_SIZE, PITCH_SIZE);
  Self.Padding.SetBounds(PITCH_SIZE, PITCH_SIZE, PITCH_SIZE, PITCH_SIZE);

  // Store Argments
  f_Device := a_Device;

  // Refresh Properties
  RefreshProperties();

  // Set Language
  SetLanguage(a_LanguageType);
end;

// *****************************************************************************
// Destructor
destructor TPropertiesBox.Destroy;
begin
  inherited;
end;

{ TPropertyPanel }

// *****************************************************************************
// Constructor
constructor TPropertyPanel.Create(AOwner: TComponent;
  const a_Label, a_Value: string; const a_NumbersOnly: Boolean);
begin
  inherited Create(AOwner);

  // Self Settings
  Self.Caption := '';
  Self.Align := alTop;
  Self.AlignWithMargins := True;
  Self.Margins.SetBounds(5, 5, 5, 5);
  Self.Padding.SetBounds(5, 0, 0, 0);
  Self.Height := 25;

  // Create Child
  f_Label := TLabel.Create(Self);
  f_Edit := TEdit.Create(Self);

  // Child Settings
  f_Label.Align := alLeft;
  f_Label.AutoSize := False;
  f_Label.Width := 100;
  f_Label.Layout := tlCenter;
  f_Edit.Align := alClient;

  // Set Values
  f_Label.Caption := a_Label;
  f_Edit.Text := a_Value;
  f_Edit.NumbersOnly := a_NumbersOnly;

  // Set Parent
  f_Label.Parent := Self;
  f_Edit.Parent := Self;
end;

// *****************************************************************************
// Destructor
destructor TPropertyPanel.Destroy;
begin
  inherited;
end;

// *****************************************************************************
// Getter
function TPropertyPanel.GetPropertyLabel: string;
begin
  Result := f_Label.Caption;
end;

function TPropertyPanel.GetPropertyValue: string;
begin
  Result := f_Edit.Text;
end;

// *****************************************************************************
// Setter
procedure TPropertyPanel.SetPropertyLabel(const a_Value: string);
begin
  f_Label.Caption := a_Value;
end;

procedure TPropertyPanel.SetPropertyValue(const a_Value: string);
begin
  f_Edit.Text := a_Value;
end;

end.
