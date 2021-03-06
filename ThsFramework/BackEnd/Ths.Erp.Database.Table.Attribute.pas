unit Ths.Erp.Database.Table.Attribute;

interface

implementation

type
  AttTableName = class(TCustomAttribute)
  private
    FName: string;
  public
    property Name: string read FName write FName;
    constructor Create(AValue: string);
  end;

type
  AttFieldName = class(TCustomAttribute)
  private
    FName: String;
//    FFK: Boolean;
//    FAutoInc: Boolean;
//    FPK: Boolean;
  public
    property Name: String read FName write FName;
//    property PK: Boolean read FPK write FPK;
//    property AutoInc: Boolean read FAutoInc write FAutoInc;
//    property FK: Boolean read FFK write FFK;

    constructor Create(const AValue: string);
//    constructor Create(const AValue: String; const APK: Boolean = False;
//        const AAutoInc: Boolean = false; const AFK: Boolean = False);
  end;

//type
//  AttFildNameHelper = class Helper for TCustomAttribute
//  public
//    function getFieldName(pFieldName: string): string;
//  end;


{ AttTableName }

constructor AttTableName.Create(AValue: string);
begin
  FName := AValue;
end;

{ AttFieldName }

constructor AttFieldName.Create(const AValue: string);// const APK, AAutoInc,
  //AFK: Boolean);
begin
  FName := AValue;
//  FPK := APK;
//  FAutoInc := AAutoInc;
//  FFK := AFK;
end;

{ AttFildNameHelper }

//function AttFildNameHelper.getFieldName(pFieldName: string): string;
//begin
//  Result := '';
//  if Self is AttFieldName then
//    if AttFieldName(Self).FName = pFieldName then
//      Result := AttFieldName(Self).FName;
//end;

end.
