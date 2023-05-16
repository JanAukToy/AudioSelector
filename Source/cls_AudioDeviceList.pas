// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
unit cls_AudioDeviceList;

interface

uses
  System.SysUtils, System.Classes, System.Win.ComObj, System.SyncObjs,
  System.Generics.Collections, Winapi.Windows, Winapi.ActiveX,

  JAT.MMDeviceAPI, JAT.EndpointVolume, JAT.AudioClient, cls_AudioDevice,
  cls_NotificationClient;

type
  // Device State Filter
  TDeviceStateFilter = (sfAll, sfActive);

  TAudioDeviceList = class(TObjectList<TAudioDevice>)
  private
    f_DeviceEnumerator: IMMDeviceEnumerator;
    f_DeviceCollection: IMMDeviceCollection;
  public
    constructor Create(const a_StateFilter: TDeviceStateFilter);
    destructor Destroy; override;

    procedure Reload(const a_StateFilter: TDeviceStateFilter);
  end;

implementation

uses
  System.StrUtils,
  Winapi.PropSys;

{ TAudioDevices }

// *****************************************************************************
// Constructor
constructor TAudioDeviceList.Create(const a_StateFilter: TDeviceStateFilter);
begin
  inherited Create(True); // Create Self Object List

  // Get COM ClassÅ@https://learn.microsoft.com/ja-jp/windows/win32/coreaudio/enumerating-audio-devices
  if Succeeded(CoCreateInstance(CLSID_IMMDeviceEnumerator, nil,
    CLSCTX_INPROC_SERVER, IID_IMMDeviceEnumerator, f_DeviceEnumerator)) then
  begin
    // Get Audio Device Collection
    Reload(a_StateFilter);
  end;
end;

// *****************************************************************************
// Destructor
destructor TAudioDeviceList.Destroy;
begin
  CoUninitialize();

  inherited;
end;

// *****************************************************************************
// Reload Self ( ReGet Audio Device Collection
procedure TAudioDeviceList.Reload(const a_StateFilter: TDeviceStateFilter);
var
  ii: Integer;
  l_Filter: Cardinal;
  l_Count: Cardinal;
  l_Device: IMMDevice;
begin
  // First, Destroy Device and Clear List
  Self.Clear();

  // Get Filetr
  case a_StateFilter of
    sfAll:
      l_Filter := DEVICE_STATEMASK_ALL;
    sfActive:
      l_Filter := DEVICE_STATE_ACTIVE;

  else
    l_Filter := DEVICE_STATEMASK_ALL;
  end;

  // Check Already Get Class
  if Assigned(f_DeviceEnumerator) then
  begin
    // Get Audio Device Collection (Render = Output Sound)
    if Succeeded(f_DeviceEnumerator.EnumAudioEndpoints(eRender, l_Filter,
      f_DeviceCollection)) and
    // Get Count on Collection
      Succeeded(f_DeviceCollection.GetCount(l_Count)) then
    begin
      for ii := 0 to l_Count - 1 do
      begin
        // Get Device
        if Succeeded(f_DeviceCollection.Item(ii, l_Device)) then
        begin
          // Add List
          Self.Add(TAudioDevice.Create(l_Device));
        end;
      end;
    end;
  end;
end;

end.
