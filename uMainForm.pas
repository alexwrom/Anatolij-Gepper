unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, System.Net.HttpClient,
  FMX.Memo.Types, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.DBScope, Data.DB, Datasnap.DBClient,
  REST.Response.Adapter, uLoginFrame, FMX.StdCtrls, Generics.Collections, uUser,
  REST.Authenticator.Simple, System.Net.URLClient;

type
  TMainForm = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    LoginFrame: TLoginFrame;
    Users: TList<TUser>;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Users := TList<TUser>.Create;
  LoginFrame := TLoginFrame.Create(nil);
  LoginFrame.Parent := Self;
end;

end.
