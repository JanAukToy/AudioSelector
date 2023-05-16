program JAT_AudioDeviceManager;

uses
  Vcl.Forms,
  Form_Main in 'Form_Main.pas' {FormMain},
  cls_AudioDeviceList in 'cls_AudioDeviceList.pas',
  JAT.MMDeviceAPI in 'JAT.MMDeviceAPI.pas',
  JAT.AudioClient in 'JAT.AudioClient.pas',
  JAT.EndpointVolume in 'JAT.EndpointVolume.pas',
  cls_AudioDevice in 'cls_AudioDevice.pas',
  cls_NotificationClient in 'cls_NotificationClient.pas',
  cmp_DevicePage in 'cmp_DevicePage.pas',
  cmp_PropertiesBox in 'cmp_PropertiesBox.pas',
  cmp_PropertyPanel in 'cmp_PropertyPanel.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
