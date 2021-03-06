unit ufrmSysUserAccessRights;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  Vcl.DBGrids, Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.ExtCtrls,
  ufrmBase, ufrmBaseDBGrid, Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.Grids;

type
  TfrmSysUserAccessRights = class(TfrmBaseDBGrid)
    procedure FormCreate(Sender: TObject);override;
  private
    { Private declarations }
  protected
    function CreateInputForm(pFormMode: TInputFormMod):TForm; override;
  public
    procedure SetSelectedItem();override;
  published
    procedure FormShow(Sender: TObject); override;
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  ufrmSysUserAccessRight,
  Ths.Erp.Database.Table.SysUserAccessRight;

{$R *.dfm}

{ TfrmSysUserAccessRights }

function TfrmSysUserAccessRights.CreateInputForm(pFormMode: TInputFormMod): TForm;
begin
  Result:=nil;
  if (pFormMode = ifmRewiev) then
    Result := TfrmSysUserAccessRight.Create(Self, Self, Table.Clone(), True, pFormMode)
  else
  if (pFormMode = ifmNewRecord) then
    Result := TfrmSysUserAccessRight.Create(Self, Self, TSysUserAccessRight.Create(Table.Database), True, pFormMode)
  else
  if (pFormMode = ifmCopyNewRecord) then
    Result := TfrmSysUserAccessRight.Create(Self, Self, Table.Clone(), True, pFormMode);
end;

procedure TfrmSysUserAccessRights.FormCreate(Sender: TObject);
begin
  QueryDefaultFilter := '';
  QueryDefaultOrder := '';
  inherited;
end;

procedure TfrmSysUserAccessRights.FormShow(Sender: TObject);
begin
  inherited;
  mniCopyRecord.Visible := True;
end;

procedure TfrmSysUserAccessRights.SetSelectedItem;
begin
  inherited;

  TSysUserAccessRight(Table).UserName.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).UserName.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).UserName.FieldName).Value);
  TSysUserAccessRight(Table).PermissionCode.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).PermissionCode.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).PermissionCode.FieldName).Value);
  TSysUserAccessRight(Table).IsRead.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsRead.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsRead.FieldName).Value);
  TSysUserAccessRight(Table).IsAddRecord.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsAddRecord.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsAddRecord.FieldName).Value);
  TSysUserAccessRight(Table).IsUpdate.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsUpdate.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsUpdate.FieldName).Value);
  TSysUserAccessRight(Table).IsDelete.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsDelete.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsDelete.FieldName).Value);
  TSysUserAccessRight(Table).IsSpecial.Value := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsSpecial.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysUserAccessRight(Table).IsSpecial.FieldName).Value);
end;

end.
