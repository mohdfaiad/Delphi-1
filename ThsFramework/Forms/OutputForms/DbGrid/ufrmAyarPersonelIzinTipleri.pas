unit ufrmAyarPersonelIzinTipleri;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  Vcl.DBGrids, Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.ExtCtrls,
  ufrmBase, ufrmBaseDBGrid, System.ImageList, Vcl.ImgList, Vcl.Samples.Spin,
  Vcl.StdCtrls, Vcl.Grids;

type
  TfrmAyarPersonelIzinTipleri = class(TfrmBaseDBGrid)
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
  ufrmAyarPersonelIzinTipi,
  Ths.Erp.Database.Table.AyarPersonelIzinTipi;

{$R *.dfm}

{ TfrmAyarPersonelIzinTipleri }

function TfrmAyarPersonelIzinTipleri.CreateInputForm(pFormMode: TInputFormMod): TForm;
begin
  Result:=nil;
  if (pFormMode = ifmRewiev) then
    Result := TfrmAyarPersonelIzinTipi.Create(Application, Self, Table.Clone(), True, pFormMode)
  else
  if (pFormMode = ifmNewRecord) then
    Result := TfrmAyarPersonelIzinTipi.Create(Application, Self, TAyarPersonelIzinTipi.Create(Table.Database), True, pFormMode)
  else
  if (pFormMode = ifmCopyNewRecord) then
    Result := TfrmAyarPersonelIzinTipi.Create(Application, Self, Table.Clone(), True, pFormMode);
end;

procedure TfrmAyarPersonelIzinTipleri.SetSelectedItem;
begin
  inherited;

  TAyarPersonelIzinTipi(Table).Deger.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TAyarPersonelIzinTipi(Table).Deger.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TAyarPersonelIzinTipi(Table).Deger.FieldName).Value);
end;

end.
