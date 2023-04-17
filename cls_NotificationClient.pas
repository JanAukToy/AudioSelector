unit cls_NotificationClient;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ActiveX,

  JAT.MMDeviceAPI;

type
  TNotificationClient = class(TInterfacedObject, IMMNotificationClient)
  private
  public
    function OnDeviceStateChanged(pwstrDeviceId: PWideChar; dwNewState: DWORD)
      : HResult; stdcall;
    function OnDeviceAdded(pwstrDeviceId: PWideChar): HResult; stdcall;
    function OnDeviceRemoved(pwstrDeviceId: PWideChar): HResult; stdcall;
    function OnDefaultDeviceChanged(flow: EDataFlow; role: ERole;
      pwstrDefaultDeviceId: PWideChar): HResult; stdcall;
    function OnPropertyValueChanged(pwstrDeviceId: PWideChar;
      const key: PROPERTYKEY): HResult; stdcall;
  end;

implementation

{ TNotificationClient }

// *****************************************************************************
// Default Device Change Event
function TNotificationClient.OnDefaultDeviceChanged(flow: EDataFlow;
  role: ERole; pwstrDefaultDeviceId: PWideChar): HResult;
begin
  ;
end;

// *****************************************************************************
// Add Device Event
function TNotificationClient.OnDeviceAdded(pwstrDeviceId: PWideChar): HResult;
begin
  ;
end;

// *****************************************************************************
// Remove Device Event
function TNotificationClient.OnDeviceRemoved(pwstrDeviceId: PWideChar): HResult;
begin
  ;
end;

// *****************************************************************************
// Changed Device State Event
function TNotificationClient.OnDeviceStateChanged(pwstrDeviceId: PWideChar;
  dwNewState: DWORD): HResult;
begin
  ;
end;

// *****************************************************************************
// Changed Property Value Event
function TNotificationClient.OnPropertyValueChanged(pwstrDeviceId: PWideChar;
  const key: PROPERTYKEY): HResult;
begin
  ;
end;

end.
