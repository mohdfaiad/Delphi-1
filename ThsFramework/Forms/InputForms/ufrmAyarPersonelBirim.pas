unit ufrmAyarPersonelBirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, StrUtils, Vcl.Menus, Vcl.Samples.Spin,
  Vcl.AppEvnts,

  Ths.Erp.Helper.Edit,
  Ths.Erp.Helper.Memo,
  Ths.Erp.Helper.ComboBox,

  ufrmBase, ufrmBaseInputDB,
  Ths.Erp.Database.Table.AyarPersonelBolum;

type
  TfrmAyarPersonelBirim = class(TfrmBaseInputDB)
    lblBirim: TLabel;
    edtBirim: TEdit;
    procedure FormCreate(Sender: TObject);override;
    procedure RefreshData();override;
    procedure btnAcceptClick(Sender: TObject);override;
  private
  public
  protected
  published
    procedure FormDestroy(Sender: TObject); override;
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table.AyarPersonelBirim;

{$R *.dfm}

procedure TfrmAyarPersonelBirim.FormCreate(Sender: TObject);
begin
  TAyarPersonelBirim(Table).Birim.SetControlProperty(Table.TableName, edtBirim);

  inherited;
end;

procedure TfrmAyarPersonelBirim.FormDestroy(Sender: TObject);
begin
  //
  inherited;
end;

procedure TfrmAyarPersonelBirim.RefreshData();
begin
  //control i�eri�ini table class ile doldur
  edtBirim.Text := FormatedVariantVal(TAyarPersonelBirim(Table).Birim.FieldType, TAyarPersonelBirim(Table).Birim.Value);
end;

procedure TfrmAyarPersonelBirim.btnAcceptClick(Sender: TObject);
begin
  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) or (FormMode = ifmUpdate) then
  begin
    if (ValidateInput) then
    begin
      TAyarPersonelBirim(Table).Birim.Value := edtBirim.Text;
      inherited;
    end;
  end
  else
    inherited;
end;

end.
