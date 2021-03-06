unit ufrmAyarPersonelGorev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, StrUtils, Vcl.Menus, Vcl.Samples.Spin,
  Vcl.AppEvnts,

  Ths.Erp.Helper.Edit,
  Ths.Erp.Helper.Memo,
  Ths.Erp.Helper.ComboBox,

  ufrmBase, ufrmBaseInputDB;

type
  TfrmAyarPersonelGorev = class(TfrmBaseInputDB)
    lblGorev: TLabel;
    edtGorev: TEdit;
    procedure FormCreate(Sender: TObject);override;
    procedure RefreshData();override;
    procedure btnAcceptClick(Sender: TObject);override;
  private
  public
  protected
  published
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table.AyarPersonelGorev;

{$R *.dfm}

procedure TfrmAyarPersonelGorev.FormCreate(Sender: TObject);
begin
  TAyarPersonelGorev(Table).Gorev.SetControlProperty(Table.TableName, edtGorev);

  inherited;
end;

procedure TfrmAyarPersonelGorev.RefreshData();
begin
  //control i�eri�ini table class ile doldur
  edtGorev.Text := FormatedVariantVal(TAyarPersonelGorev(Table).Gorev.FieldType, TAyarPersonelGorev(Table).Gorev.Value);
end;

procedure TfrmAyarPersonelGorev.btnAcceptClick(Sender: TObject);
begin
  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) or (FormMode = ifmUpdate) then
  begin
    if (ValidateInput) then
    begin
      TAyarPersonelGorev(Table).Gorev.Value := edtGorev.Text;
      inherited;
    end;
  end
  else
    inherited;
end;

end.
