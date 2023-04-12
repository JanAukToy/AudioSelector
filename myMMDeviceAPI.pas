//******************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
//******************************************************************************
unit myMMDeviceAPI;

interface

uses
  Winapi.Windows, Winapi.ActiveX, Winapi.Dwmapi,
  Winapi.propSys, Winapi.PropKey;

const
  CLSID_IMMDeviceEnumerator: TGUID = '{BCDE0395-E52F-467C-8E3D-C4579291692E}';

  IID_IMMDeviceEnumerator: TGUID = '{A95664D2-9614-4F35-A746-DE8DB63617E6}';
//  IID_IAudioEndpointVolume: TGUID = '{5CDF2C82-841E-4546-9722-0CF74078229A}';

  // https://learn.microsoft.com/ja-jp/windows/win32/coreaudio/device-state-xxx-constants
  DEVICE_STATE_ACTIVE     : DWORD = $00000001;
  DEVICE_STATE_DISABLED   : DWORD = $00000002;
  DEVICE_STATE_NOTPRESENT : DWORD = $00000004;
  DEVICE_STATE_UNPLUGGED  : DWORD = $00000008;
  DEVICE_STATEMASK_ALL    : DWORD = $0000000F;

type
  EDataFlow = (eRender, eCapture, eAll, EDataFlow_enum_count);        // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow
  ERole = (eConsole, eMultimedia, eCommunications, ERole_enum_count); // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole

//  AUDIO_VOLUME_NOTIFICATION_DATA = record
//    guidEventContext: TGUID;
//    bMuted: BOOL;
//    fMasterVolume: Single;
//    nChannels: UINT;
//    afChannelVolumes: Single;
//  end;
//
//  PAUDIO_VOLUME_NOTIFICATION_DATA = ^AUDIO_VOLUME_NOTIFICATION_DATA;


  IAudioEndpointVolumeCallback = interface(IUnknown)
    ['{657804FA-D6AD-4496-8A60-352752AF4F89}']
//    function OnNotify(pNotify: PAUDIO_VOLUME_NOTIFICATION_DATA): HRESULT; stdcall;
  end;

  // https://learn.microsoft.com/ja-jp/windows/win32/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume
  IAudioEndpointVolume = interface(IUnknown)
    ['{5CDF2C82-841E-4546-9722-0CF74078229A}']
//    function RegisterControlChangeNotify(AudioEndPtVol: IAudioEndpointVolumeCallback): HRESULT; stdcall;
//    function UnregisterControlChangeNotify(AudioEndPtVol: IAudioEndpointVolumeCallback): HRESULT; stdcall;
//    function GetChannelCount(out PInteger): HRESULT; stdcall;
//    function SetMasterVolumeLevel(fLevelDB: single; pguidEventContext: PGUID): HRESULT; stdcall;
//    function SetMasterVolumeLevelScalar(fLevelDB: single; pguidEventContext: PGUID): HRESULT; stdcall;
//    function GetMasterVolumeLevel(out fLevelDB: single): HRESULT; stdcall;
//    function GetMasterVolumeLevelScaler(out fLevelDB: single): HRESULT; stdcall;
//    function SetChannelVolumeLevel(nChannel: Integer; fLevelDB: double; pguidEventContext: PGUID): HRESULT; stdcall;
//    function SetChannelVolumeLevelScalar(nChannel: Integer; fLevelDB: double; pguidEventContext: PGUID): HRESULT; stdcall;
//    function GetChannelVolumeLevel(nChannel: Integer; out fLevelDB: double): HRESULT; stdcall;
//    function GetChannelVolumeLevelScalar(nChannel: Integer; out fLevel: double): HRESULT; stdcall;
//    function SetMute(bMute: Boolean; pguidEventContext: PGUID): HRESULT; stdcall;
//    function GetMute(out bMute: Boolean): HRESULT; stdcall;
//    function GetVolumeStepInfo(pnStep: Integer; out pnStepCount: Integer): HRESULT; stdcall;
//    function VolumeStepUp(pguidEventContext: PGUID): HRESULT; stdcall;
//    function VolumeStepDown(pguidEventContext: PGUID): HRESULT; stdcall;
//    function QueryHardwareSupport(out pdwHardwareSupportMask): HRESULT; stdcall;
//    function GetVolumeRange(out pflVolumeMindB: double; out pflVolumeMaxdB: double; out pflVolumeIncrementdB: double): HRESULT; stdcall;
  end;

  // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdevice
  IMMDevice = interface(IUnknown)
  ['{D666063F-1587-4E43-81F1-B948E807363F}']
    function Activate(iid: TGUID; dwClsCtx: DWORD; pActivationParams: PROPVARIANT; out ppInterface: IAudioEndpointVolume): HRESULT; stdcall;
    function GetId(out ppstrId: PWideChar): HRESULT; stdcall;
    function GetState(out pdwState: DWORD): HRESULT; stdcall;
    function OpenPropertyStore(stgmAccess: DWORD; out ppProperties: IPropertyStore): HRESULT; stdcall;
  end;

  // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdevicecollection
  IMMDeviceCollection = interface(IUnknown)
  ['{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}']
    function GetCount(out pcDevices: UINT): HRESULT; stdcall;
    function Item(nDevice: UINT; out ppDevice: IMMDevice): HRESULT; stdcall;
  end;

  // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient
  IMMNotificationClient = interface(IUnknown)
  ['{7991EEC9-7E89-4D85-8390-6C703CEC60C0}']
    function OnDefaultDeviceChanged(flow: EDataFlow; role: ERole; pwstrDefaultDeviceId: PWideChar): HRESULT; stdcall;
    function OnDeviceAdded(pwstrDeviceId: PWideChar): HRESULT; stdcall;
    function OnDeviceRemoved(pwstrDeviceId: PWideChar): HRESULT; stdcall;
    function OnDeviceStateChanged(pwstrDeviceId: PWideChar; dwNewState: DWORD): HRESULT; stdcall;
    function OnPropertyValueChanged(pwstrDeviceId: PWideChar; const key: PROPERTYKEY): HRESULT; stdcall;
  end;

  // https://learn.microsoft.com/ja-jp/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdeviceenumerator
  IMMDeviceEnumerator = interface(IUnknown)
  ['{A95664D2-9614-4F35-A746-DE8DB63617E6}']
    function EnumAudioEndpoints(dataFlow: EDataFlow; dwStateMask: DWORD; out ppDevices: IMMDeviceCollection): HRESULT; stdcall;
    function GetDefaultAudioEndpoint(dataFlow: EDataFlow; role: ERole; out ppEndpoint: IMMDevice): HRESULT; stdcall;
    function GetDevice(pwstrId: PWideChar; out ppDevice: IMMDevice): HRESULT; stdcall;
    function RegisterEndpointNotificationCallback(pClient: IMMNotificationClient): HRESULT; stdcall;
    function UnregisterEndpointNotificationCallback(pClient: IMMNotificationClient): HRESULT; stdcall;
  end;

implementation

end.
