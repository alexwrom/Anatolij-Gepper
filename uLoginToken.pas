unit uLoginToken;

interface
  uses uBasisObject;
type
  TLoginToken = class(TBasisObject)

  private
    FPassword: String;
    FUserName: String;
    FIsMd5: boolean;
    FToken: String;

  public
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property IsMd5: boolean read FIsMd5 write FIsMd5;
    property Token: String read FToken write FToken;

  end;

implementation

end.
