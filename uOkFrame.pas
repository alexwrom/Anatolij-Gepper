unit uOkFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Ani, FMX.Effects;

type
  TOkFrame = class(TFrame)
    HelloText: TLabel;
    ToolBar1: TToolBar;
    btnBack: TSpeedButton;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
    procedure OnBack(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TFMXObject);
  end;

implementation

uses uMainForm, uLoginFrame;
{$R *.fmx}
{ TOkFrame }

constructor TOkFrame.Create(AOwner: TFMXObject);
begin
  inherited Create(AOwner);
  btnBack.OnClick := OnBack;

end;

procedure TOkFrame.OnBack(Sender: TObject);
begin
  Self.Parent := nil;
  MainForm.LoginFrame := TLoginFrame.Create(nil);
  MainForm.LoginFrame.Parent := MainForm;
  Self.DisposeOf;
end;

end.
