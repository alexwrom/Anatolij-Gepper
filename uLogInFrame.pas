unit uLogInFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Generics.Collections,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, System.JSON, uLoginToken, uOkFrame, uUser, REST.JSON, System.Threading,REST.Types;

type
  TLoginFrame = class(TFrame)
    Layout1: TLayout;
    Login: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Password: TEdit;
    btnLogIn: TSpeedButton;
    procedure btnLogInClick(Sender: TObject);
  private
    { Private declarations }
    LoginToken: TLoginToken;
    OkFrame: TOkFrame;
    procedure OpenOkFrame;
  public
    { Public declarations }
  end;

implementation

uses uMainForm;
{$R *.fmx}

procedure TLoginFrame.btnLogInClick(Sender: TObject);
var
Stream : TStream;
begin
  LoginToken := TLoginToken.Create;
  LoginToken.UserName := Login.Text;
  LoginToken.Password := Password.Text;
  LoginToken.IsMd5 := false;
  Stream := TStream.Create;
  MainForm.RESTRequest.ClearBody;
  MainForm.RESTRequest.AddBody(LoginToken);

  TTask.Run(
    procedure
    var
      IsError: boolean;
    begin
          IsError := false;
          try
            MainForm.RESTRequest.Execute;
          except
            IsError := true;
          end;
      TThread.Synchronize(nil,
        procedure
        begin
          if IsError then
            showmessage('Error connect.')
          else
            case MainForm.RESTResponse.StatusCode of
              200:
                OpenOkFrame;
              401:
                showmessage('Login or password incorrect. Please try again.');

            end;
        end);
    end);

end;

procedure TLoginFrame.OpenOkFrame;
var
  JsonParam: TJSONObject;
  ListHelper: TJSONArray;
  ListHelperItem: TJSONObject;
  UserName: string;
begin

  // Парсим JSON
  JsonParam := TJSONObject.ParseJSONValue(MainForm.RESTResponse.JSONText) as TJSONObject;
  ListHelper := JsonParam.GetValue('listHelper') as TJSONArray;
  ListHelperItem := ListHelper.Items[0] as TJSONObject;

  if MainForm.Users = nil then
    MainForm.Users := TList<TUser>.Create;

  MainForm.Users.Clear;
  MainForm.Users.Add(REST.JSON.TJson.JsonToObject<TUser>(ListHelperItem));
  // Создаем фрейм ответа
  if OkFrame = nil then
  begin
    OkFrame := TOkFrame.Create(nil);
    OkFrame.Parent := MainForm;
    OkFrame.HelloText.Text := 'Hello, ' + MainForm.Users[0].FullName + '!';

    JsonParam.DisposeOf;

    MainForm.LoginFrame.Parent := nil;
    MainForm.LoginFrame.DisposeOf;
  end;
end;

end.
