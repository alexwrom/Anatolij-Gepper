unit uUser;

interface

uses FMX.Types,uBasisObject;

type
  TUser = class(TBasisObject)

  private
    FEmail: String;
    FEmailValidation: String;
    FFullName: String;
    FActive: Boolean;
    FUserName: String;
    FPassword: String;
    function GetEmailValidated: Boolean;

  public
    property UserName: String read FUserName write FUserName;
    property Email: String read FEmail write FEmail;
    property FullName: String read FFullName write FFullName;
    property Active: Boolean read FActive write FActive;
    property EmailValidation: String read FEmailValidation write FEmailValidation;
    property Password: String read FPassword write FPassword;
    property EmailValidated: Boolean read GetEmailValidated;
  end;

implementation

{ TUser }

function TUser.GetEmailValidated: Boolean;
begin

end;

end.
