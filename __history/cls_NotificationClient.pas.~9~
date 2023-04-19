// *****************************************************************************
// Created by JanAukToy
// [Github] https://github.com/JanAukToy
// *****************************************************************************
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
    constructor Create();
    destructor Destroy; override;

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
// Constructor
constructor TNotificationClient.Create;
begin;
end;

// *****************************************************************************
// Destructor
destructor TNotificationClient.Destroy;
begin

  inherited;
end;

// *****************************************************************************
// Default Device Change Event
function TNotificationClient.OnDefaultDeviceChanged(flow: EDataFlow;
  role: ERole; pwstrDefaultDeviceId: PWideChar): HResult;
begin;
  Result := S_OK;
end;

// *****************************************************************************
// Add Device Event
function TNotificationClient.OnDeviceAdded(pwstrDeviceId: PWideChar): HResult;
begin
  Result := S_OK;
end;

// *****************************************************************************
// Remove Device Event
function TNotificationClient.OnDeviceRemoved(pwstrDeviceId: PWideChar): HResult;
begin
  Result := S_OK;
end;

// *****************************************************************************
// Changed Device State Event
function TNotificationClient.OnDeviceStateChanged(pwstrDeviceId: PWideChar;
  dwNewState: DWORD): HResult;
begin
  Result := S_OK;
end;

// *****************************************************************************
// Changed Property Value Event
function TNotificationClient.OnPropertyValueChanged(pwstrDeviceId: PWideChar;
  const key: PROPERTYKEY): HResult;
begin
  Result := S_OK;
end;

end.
