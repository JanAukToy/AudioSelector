unit cls_AudioDevice;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Win.ComObj,
  System.SyncObjs,
  Winapi.Windows,
  Winapi.ActiveX,
  Winapi.PropSys,
  JAT.MMDeviceAPI, JAT.EndpointVolume;

type
  TAudioDevice = class
  private
    f_Device: IMMDevice;
    f_AudioEndpointVolume: IAudioEndpointVolume;
    f_InterfaceFriendlyName: string;
    f_DeviceDesc: string;
    f_FriendlyName: string;
    f_InstanceId: string;
    f_ContainerId: TGUID;

    procedure GetProps(const a_PropertyStore: IPropertyStore);
  public
    constructor Create(const a_Device: IMMDevice);
    destructor Destroy; override;

    property InterfaceFriendlyName: string read f_InterfaceFriendlyName;
    property DeviceDesc: string read f_DeviceDesc;
    property FriendlyName: string read f_FriendlyName;
    property InstanceId: string read f_InstanceId;
    property ContainerId: TGUID read f_ContainerId;
  end;

implementation

{ TAudioDevice }

// *****************************************************************************
// Constructor
constructor TAudioDevice.Create(const a_Device: IMMDevice);
var
  l_Id: PWideChar;
  l_PropertyStore: IPropertyStore;
  l_PointAudioEndpointVolume: Pointer;
begin
  // Store Device
  f_Device := a_Device;

  // Get Device ID
  if Succeeded(a_Device.GetId(l_Id)) then
  begin
    // Store ID
    f_InstanceId := l_Id;

    // Get Open Property Interface
    if Succeeded(a_Device.OpenPropertyStore(STGM_READ, l_PropertyStore)) then
    begin
      // Get Properties
      GetProps(l_PropertyStore);
    end;

    // Get Audio Endpoint Volume
    if Succeeded(a_Device.Activate(IID_IAudioEndpointVolume,
      CLSCTX_INPROC_SERVER, nil, l_PointAudioEndpointVolume)) then
    begin
      f_AudioEndpointVolume := IAudioEndpointVolume(l_PointAudioEndpointVolume)
        as IAudioEndpointVolume;
    end;
  end;
end;

// *****************************************************************************
// Destructor
destructor TAudioDevice.Destroy;
begin
  inherited;
end;

// *****************************************************************************
// Get Properties
procedure TAudioDevice.GetProps(const a_PropertyStore: IPropertyStore);
var
  l_PropValue: TPropVariant;
begin
  if Succeeded(a_PropertyStore.GetValue(PKEY_DeviceInterface_FriendlyName,
    l_PropValue)) then
  begin
    f_InterfaceFriendlyName := l_PropValue.pwszVal;
  end;

  ZeroMemory(@l_PropValue, SizeOf(l_PropValue));

  if Succeeded(a_PropertyStore.GetValue(PKEY_Device_DeviceDesc, l_PropValue))
  then
  begin
    f_DeviceDesc := l_PropValue.pwszVal;
  end;

  ZeroMemory(@l_PropValue, SizeOf(l_PropValue));

  if Succeeded(a_PropertyStore.GetValue(PKEY_Device_FriendlyName, l_PropValue))
  then
  begin
    f_FriendlyName := l_PropValue.pwszVal;
  end;

  ZeroMemory(@l_PropValue, SizeOf(l_PropValue));

  // [ PKEY_Device_InstanceId ] is IMMDevice::GetId Value

  if Succeeded(a_PropertyStore.GetValue(PKEY_Device_ContainerId, l_PropValue))
  then
  begin
    f_ContainerId := l_PropValue.puuid^;
  end;
end;

end.
