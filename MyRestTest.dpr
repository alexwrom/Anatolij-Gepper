program MyRestTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uUser in 'uUser.pas',
  uLoginToken in 'uLoginToken.pas',
  uLogInFrame in 'uLogInFrame.pas' {LoginFrame: TFrame},
  uOkFrame in 'uOkFrame.pas' {OkFrame: TFrame},
  uBasisObject in 'uBasisObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
