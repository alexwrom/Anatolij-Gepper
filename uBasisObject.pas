unit uBasisObject;

interface

type
 IBasisObject = interface(IInvokable)
  end;

  TBasisObject = class(TInterfacedObject, IBasisObject)
  private
    FGUID: String;
    FToDelete: Boolean;
    procedure SetGUID(const Value: String);

  public
    property GUID: String read FGUID write SetGUID;
    property ToDelete: Boolean read FToDelete write FToDelete;
  end;
implementation

procedure TBasisObject.SetGUID(const Value: String);
begin
  FGUID := Value;
end;
end.
