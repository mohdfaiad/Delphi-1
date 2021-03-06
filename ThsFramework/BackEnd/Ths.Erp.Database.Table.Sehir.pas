unit Ths.Erp.Database.Table.Sehir;

interface

uses
  SysUtils, Classes, Dialogs, Forms, Windows, Controls, Types, DateUtils,
  FireDAC.Stan.Param, System.Variants, Data.DB,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Table.Field,

  Ths.Erp.Database.Table.Ulke;

type
  TSehir = class(TTable)
  private
    FSehirAdi: TFieldDB;
    FUlkeID: TFieldDB;
    FPlakaKodu: TFieldDB;
    //veri taban� alan� de�il
    /// <summary>
    ///   Veri Taban� alan� de�il.
    ///   Not a database field
    /// </summary>
    FUlkeAdi: TFieldDB;
  protected
    vUlke: TUlke;
  published
    constructor Create(OwnerDatabase:TDatabase);override;
  public
    procedure SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True); override;
    procedure SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True); override;
    procedure Insert(out pID: Integer; pPermissionControl: Boolean=True); override;
    procedure Update(pPermissionControl: Boolean=True); override;

    procedure Clear();override;
    function Clone():TTable;override;

    property SehirAdi: TFieldDB read FSehirAdi write FSehirAdi;
    property UlkeID: TFieldDB read FUlkeID write FUlkeID;
    property PlakaKodu: TFieldDB read FPlakaKodu write FPlakaKodu;
    //veri taban� alan� de�il
    /// <summary>
    ///   Veri Taban� alan� de�il.
    ///   Not a database field
    /// </summary>
    property UlkeAdi: TFieldDB read FUlkeAdi write FUlkeAdi;
  end;

implementation

uses
  Ths.Erp.Constants,
  Ths.Erp.Database.Singleton;

constructor TSehir.Create(OwnerDatabase:TDatabase);
begin
  inherited Create(OwnerDatabase);
  TableName := 'sehir';
  SourceCode := '1000';

  FSehirAdi := TFieldDB.Create('sehir_adi', ftString, '');
  FUlkeID := TFieldDB.Create('ulke_id', ftInteger, 0);
  FPlakaKodu := TFieldDB.Create('plaka_kodu', ftInteger, 0);
  //veri taban� alan� de�il
  FUlkeAdi := TFieldDB.Create('ulke_adi', ftString, '');
end;

procedure TSehir.SelectToDatasource(pFilter: string;
  pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
	  with QueryOfDS do
	  begin
      vUlke := TUlke.Create(Database);
      try
        Close;
        SQL.Clear;
        SQL.Text := Database.GetSQLSelectCmd(TableName, [
            TableName + '.' + Self.Id.FieldName,
            TableName + '.' + FSehirAdi.FieldName,
            TableName + '.' + FUlkeID.FieldName,
            ColumnFromIDCol(vUlke.UlkeAdi.FieldName, vUlke.TableName, FUlkeID.FieldName, FUlkeAdi.FieldName, TableName),
            TableName + '.' + FPlakaKodu.FieldName
          ]) +
          'WHERE 1=1 ' + pFilter;
        Open;
        Active := True;

        Self.DataSource.DataSet.FindField(Self.Id.FieldName).DisplayLabel := 'ID';
        Self.DataSource.DataSet.FindField(FSehirAdi.FieldName).DisplayLabel := '�EH�R ADI';
        Self.DataSource.DataSet.FindField(FUlkeID.FieldName).DisplayLabel := '�LKE ID';
        Self.DataSource.DataSet.FindField(FUlkeAdi.FieldName).DisplayLabel := '�LKE ADI';
        Self.DataSource.DataSet.FindField(FPlakaKodu.FieldName).DisplayLabel := 'PLAKA KODU';
      finally
        vUlke.Free;
      end;
	  end;
  end;
end;

procedure TSehir.SelectToList(pFilter: string; pLock: Boolean;
  pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
	  if (pLock) then
		  pFilter := pFilter + ' FOR UPDATE OF ' + TableName + ' NOWAIT; ';

	  with QueryOfList do
	  begin
		  vUlke := TUlke.Create(Database);
      try
        Close;
        SQL.Text := Database.GetSQLSelectCmd(TableName, [
            TableName + '.' + Self.Id.FieldName,
            TableName + '.' + FSehirAdi.FieldName,
            TableName + '.' + FUlkeID.FieldName,
            ColumnFromIDCol(vUlke.UlkeAdi.FieldName, vUlke.TableName, FUlkeID.FieldName, FUlkeAdi.FieldName, TableName),
            TableName + '.' + FPlakaKodu.FieldName
          ]) +
          'WHERE 1=1 ' + pFilter;
        Open;

        FreeListContent();
        List.Clear;
        while NOT EOF do
        begin
          Self.Id.Value := FormatedVariantVal(FieldByName(Id.FieldName).DataType, FieldByName(Id.FieldName).Value);

          FSehirAdi.Value := FormatedVariantVal(FieldByName(FSehirAdi.FieldName).DataType, FieldByName(FSehirAdi.FieldName).Value);
          FUlkeID.Value := FormatedVariantVal(FieldByName(FUlkeID.FieldName).DataType, FieldByName(FUlkeID.FieldName).Value);
          FUlkeAdi.Value := FormatedVariantVal(FieldByName(FUlkeAdi.FieldName).DataType, FieldByName(FUlkeAdi.FieldName).Value);
          FPlakaKodu.Value := FormatedVariantVal(FieldByName(FPlakaKodu.FieldName).DataType, FieldByName(FPlakaKodu.FieldName).Value);

          List.Add(Self.Clone());

          Next;
        end;
        EmptyDataSet;
        Close;
      finally
        vUlke.Free;
      end;
	  end;
  end;
end;

procedure TSehir.Insert(out pID: Integer; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptAddRecord, pPermissionControl) then
  begin
	  with QueryOfInsert do
	  begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLInsertCmd(TableName, QUERY_PARAM_CHAR, [
        FSehirAdi.FieldName,
        FUlkeID.FieldName,
        FPlakaKodu.FieldName
      ]);

      NewParamForQuery(QueryOfInsert, FSehirAdi);
      NewParamForQuery(QueryOfInsert, FUlkeID);
      NewParamForQuery(QueryOfInsert, FPlakaKodu);

      Open;
      if (Fields.Count > 0) and (not Fields.FieldByName(Self.Id.FieldName).IsNull) then
        pID := Fields.FieldByName(Self.Id.FieldName).AsInteger
      else
        pID := 0;

      EmptyDataSet;
      Close;
	  end;
    Self.notify;
  end;
end;

procedure TSehir.Update(pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptUpdate, pPermissionControl) then
  begin
	  with QueryOfUpdate do
	  begin
		  Close;
		  SQL.Clear;
		  SQL.Text := Database.GetSQLUpdateCmd(TableName, QUERY_PARAM_CHAR, [
		    FSehirAdi.FieldName,
        FUlkeID.FieldName,
        FPlakaKodu.FieldName
      ]);

      NewParamForQuery(QueryOfUpdate, FSehirAdi);
      NewParamForQuery(QueryOfUpdate, FUlkeID);
      NewParamForQuery(QueryOfUpdate, FPlakaKodu);

      NewParamForQuery(QueryOfUpdate, Id);

		  ExecSQL;
		  Close;
	  end;
    Self.notify;
  end;
end;

procedure TSehir.Clear();
begin
  inherited;
  FSehirAdi.Value := '';
  FUlkeID.Value := 0;
  FUlkeAdi.Value := '';
  PlakaKodu.Value := '';
end;

function TSehir.Clone():TTable;
begin
  Result := TSehir.Create(Database);

  Self.Id.Clone(TSehir(Result).Id);

  FSehirAdi.Clone(TSehir(Result).FSehirAdi);
  FUlkeID.Clone(TSehir(Result).FUlkeID);
  FUlkeAdi.Clone(TSehir(Result).FUlkeAdi);
  FPlakaKodu.Clone(TSehir(Result).FPlakaKodu);
end;

end.
