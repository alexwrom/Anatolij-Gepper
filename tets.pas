unit tets;

interface
  uses uBasisObject;
type
  TTEST = class(TBasisObject)

  private
    FPage: Integer;
    FAmount: Integer;
    FtotalAmount: Integer;
    FPages: Integer;

  public
    property page: Integer read FPage write FPage;
    property amount: Integer read FAmount write FAmount;
    property totalAmount: Integer read FtotalAmount write FtotalAmount;
    property pages: Integer read FPages write FPages;


  end;

implementation

end.
