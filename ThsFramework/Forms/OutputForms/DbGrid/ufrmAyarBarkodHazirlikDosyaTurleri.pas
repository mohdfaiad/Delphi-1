unit ufrmAyarBarkodHazirlikDosyaTurleri;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  Vcl.DBGrids, Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.ExtCtrls,
  ufrmBase, ufrmBaseDBGrid, Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.Grids;

type
  TfrmAyarBarkodHazirlikDosyaTurleri = class(TfrmBaseDBGrid)
  private
    { Private declarations }
  protected
    function CreateInputForm(pFormMode: TInputFormMod):TForm; override;
  public
    procedure SetSelectedItem();override;
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  ufrmAyarBarkodHazirlikDosyaTuru,
  Ths.Erp.Database.Table.AyarBarkodHazirlikDosyaTuru;

{$R *.dfm}

{ TfrmAyarBarkodHazirlikDosyaTurleri }

function TfrmAyarBarkodHazirlikDosyaTurleri.CreateInputForm(pFormMode: TInputFormMod): TForm;
begin
  Result:=nil;
  if (pFormMode = ifmRewiev) then
    Result := TfrmAyarBarkodHazirlikDosyaTuru.Create(Application, Self, Table.Clone(), True, pFormMode)
  else
  if (pFormMode = ifmNewRecord) then
    Result := TfrmAyarBarkodHazirlikDosyaTuru.Create(Application, Self, TAyarBarkodHazirlikDosyaTuru.Create(Table.Database), True, pFormMode)
  else
  if (pFormMode = ifmCopyNewRecord) then
    Result := TfrmAyarBarkodHazirlikDosyaTuru.Create(Application, Self, Table.Clone(), True, pFormMode);
end;

procedure TfrmAyarBarkodHazirlikDosyaTurleri.SetSelectedItem;
begin
  inherited;

  TAyarBarkodHazirlikDosyaTuru(Table).Tur.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TAyarBarkodHazirlikDosyaTuru(Table).Tur.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TAyarBarkodHazirlikDosyaTuru(Table).Tur.FieldName).Value);
end;

end.
