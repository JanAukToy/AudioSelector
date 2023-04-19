// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit cmp_DevicePage;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TDevicePage = class(TTabSheet)
    procedure OnResizeDevicePage(Sender: TObject);
  private
    f_DevicePropertiesBox: TGroupBox;
    f_AudioPropertiesBox: TGroupBox;

    procedure CreateDevicePropertiesBox;
    procedure CreateAudioPropertiesBox;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

// *****************************************************************************
// Constructor
constructor TDevicePage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Create Child Boxes
  CreateDevicePropertiesBox();
  CreateAudioPropertiesBox();

  // Set Resize Event
  Self.OnResize := OnResizeDevicePage;
end;

// *****************************************************************************
// Destructor
destructor TDevicePage.Destroy;
begin
  if Assigned(f_DevicePropertiesBox) then
    FreeAndNil(f_DevicePropertiesBox);
  if Assigned(f_AudioPropertiesBox) then
    FreeAndNil(f_AudioPropertiesBox);

  inherited;
end;

// *****************************************************************************
// Create Audio Properties GroupBox
procedure TDevicePage.CreateAudioPropertiesBox;
begin
  // Create
  f_DevicePropertiesBox := TGroupBox.Create(nil);

  // Settings
  f_DevicePropertiesBox.Align := alLeft;
  f_DevicePropertiesBox.AlignWithMargins := True;
  f_DevicePropertiesBox.Margins.SetBounds(10, 10, 10, 10);
  f_DevicePropertiesBox.Padding.SetBounds(10, 10, 10, 10);
  f_DevicePropertiesBox.Caption := 'Device Properties';

  // Assign Parent
  f_DevicePropertiesBox.Parent := Self;
end;

// *****************************************************************************
// Create Device Properties GroupBox
procedure TDevicePage.CreateDevicePropertiesBox;
begin
  // Create
  f_AudioPropertiesBox := TGroupBox.Create(nil);

  // Settings
  f_AudioPropertiesBox.Align := alRight;
  f_AudioPropertiesBox.AlignWithMargins := True;
  f_AudioPropertiesBox.Margins.SetBounds(10, 10, 10, 10);
  f_AudioPropertiesBox.Padding.SetBounds(10, 10, 10, 10);
  f_AudioPropertiesBox.Caption := 'Audio Properties';

  // Assign Parent
  f_AudioPropertiesBox.Parent := Self;
end;

// *****************************************************************************
// Device Page Resize Event
procedure TDevicePage.OnResizeDevicePage(Sender: TObject);
begin
  // Resizing Child GroupBox

  if Assigned(f_DevicePropertiesBox) then
  begin
    f_DevicePropertiesBox.Width := Self.Width div 2 - 15;
  end;

  if Assigned(f_AudioPropertiesBox) then
  begin
    f_AudioPropertiesBox.Width := Self.Width div 2 - 15;
  end;
end;

end.
