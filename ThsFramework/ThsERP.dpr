program ThsERP;

{$I ThsERP.inc}

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Winapi.Messages,
  Vcl.Styles.Utils.SystemMenu in 'BackEnd\Tools\Vcl.Styles.Utils.SystemMenu.pas',
  Ths.Erp.Database in 'BackEnd\Ths.Erp.Database.pas',
  Ths.Erp.Database.Singleton in 'BackEnd\Ths.Erp.Database.Singleton.pas',
  Ths.Erp.Database.Connection.Settings in 'BackEnd\Ths.Erp.Database.Connection.Settings.pas',
  Ths.Erp.Database.Table in 'BackEnd\Ths.Erp.Database.Table.pas',
  Ths.Erp.Database.Table.Ulke in 'BackEnd\Ths.Erp.Database.Table.Ulke.pas',
  Ths.Erp.Database.Table.Employee in 'BackEnd\Ths.Erp.Database.Table.Employee.pas',
  Ths.Erp.Database.Table.SysUserAccessRight in 'BackEnd\Ths.Erp.Database.Table.SysUserAccessRight.pas',
  Ths.Erp.Database.Table.SysGridColWidth in 'BackEnd\Ths.Erp.Database.Table.SysGridColWidth.pas',
  mORMotReport in 'BackEnd\synpdf\mORMotReport.pas',
  SynCommons in 'BackEnd\synpdf\SynCommons.pas',
  SynCrypto in 'BackEnd\synpdf\SynCrypto.pas',
  SynGdiPlus in 'BackEnd\synpdf\SynGdiPlus.pas',
  SynLZ in 'BackEnd\synpdf\SynLZ.pas',
  SynPdf in 'BackEnd\synpdf\SynPdf.pas',
  SynZip in 'BackEnd\synpdf\SynZip.pas',
  ufrmBase in 'Forms\ufrmBase.pas' {frmBase},
  ufrmBaseOutput in 'Forms\OutputForms\Factory\ufrmBaseOutput.pas' {frmBaseOutput},
  ufrmBaseStrGrid in 'Forms\OutputForms\StrGrid\Factory\ufrmBaseStrGrid.pas' {frmBaseStrGrid},
  ufrmBaseDBGrid in 'Forms\OutputForms\DbGrid\Factory\ufrmBaseDBGrid.pas' {frmBaseDBGrid},
  ufrmBaseInput in 'Forms\ufrmBaseInput.pas' {frmBaseInput},
  ufrmBaseInputDB in 'Forms\InputForms\Factory\ufrmBaseInputDB.pas' {frmBaseInputDB},
  ufrmBaseDetaylar in 'Forms\DetailedInputForms\Factory\ufrmBaseDetaylar.pas' {frmBaseDetaylar},
  ufrmBaseDetaylarDetay in 'Forms\DetailedInputForms\Factory\ufrmBaseDetaylarDetay.pas' {frmBaseDetaylarDetay},
  Ths.Erp.StrinGrid.Helper in 'BackEnd\Ths.Erp.StrinGrid.Helper.pas',
  Ths.Erp.Database.TableDetailed in 'BackEnd\Ths.Erp.Database.TableDetailed.pas',
  ufrmConfirmation in 'Forms\ufrmConfirmation.pas' {frmConfirmation},
  ufrmMain in 'Forms\InputForms\ufrmMain.pas' {frmMain},
  ufrmLogin in 'Forms\InputForms\ufrmLogin.pas' {frmLogin},
  Ths.Erp.Database.Table.SysUser in 'BackEnd\Ths.Erp.Database.Table.SysUser.pas',
  Ths.Erp.Functions in 'BackEnd\Ths.Erp.Functions.pas',
  ufrmUlkeler in 'Forms\OutputForms\DbGrid\ufrmUlkeler.pas' {frmUlkeler},
  ufrmUlke in 'Forms\InputForms\ufrmUlke.pas' {frmUlke},
  Ths.Erp.Constants in 'BackEnd\Ths.Erp.Constants.pas',
  ufrmSehir in 'Forms\InputForms\ufrmSehir.pas' {frmSehir},
  ufrmAbout in 'Forms\ufrmAbout.pas' {frmAbout},
  Ths.Erp.Database.Table.Field in 'BackEnd\Ths.Erp.Database.Table.Field.pas',
  Ths.Erp.Database.Table.Sehir in 'BackEnd\Ths.Erp.Database.Table.Sehir.pas',
  ufrmSehirler in 'Forms\OutputForms\DbGrid\ufrmSehirler.pas' {frmSehirler},
  ufrmFilterDBGrid in 'Forms\InputForms\ufrmFilterDBGrid.pas' {frmFilterDBGrid},
  ufrmSysPermissionSourceGroups in 'Forms\OutputForms\DbGrid\ufrmSysPermissionSourceGroups.pas' {frmSysPermissionSourceGroups},
  Ths.Erp.Database.Table.SysPermissionSource in 'BackEnd\Ths.Erp.Database.Table.SysPermissionSource.pas',
  ufrmSysPermissionSourceGroup in 'Forms\InputForms\ufrmSysPermissionSourceGroup.pas' {frmSysPermissionSourceGroup},
  ufrmSysPermissionSources in 'Forms\OutputForms\DbGrid\ufrmSysPermissionSources.pas' {frmSysPermissionSources},
  ufrmSysPermissionSource in 'Forms\InputForms\ufrmSysPermissionSource.pas' {frmSysPermissionSource},
  Ths.Erp.Database.Table.SysPermissionSourceGroup in 'BackEnd\Ths.Erp.Database.Table.SysPermissionSourceGroup.pas',
  Ths.Erp.Database.Table.SysLang in 'BackEnd\Ths.Erp.Database.Table.SysLang.pas',
  Ths.Erp.Database.Table.SysLangGuiContent in 'BackEnd\Ths.Erp.Database.Table.SysLangGuiContent.pas',
  ufrmSysUserAccessRights in 'Forms\OutputForms\DbGrid\ufrmSysUserAccessRights.pas' {frmSysUserAccessRights},
  ufrmSysUserAccessRight in 'Forms\InputForms\ufrmSysUserAccessRight.pas' {frmSysUserAccessRight},
  Ths.Erp.Database.Table.SysGridColColor in 'BackEnd\Ths.Erp.Database.Table.SysGridColColor.pas',
  Ths.Erp.Database.Table.SysGridColPercent in 'BackEnd\Ths.Erp.Database.Table.SysGridColPercent.pas',
  Ths.Erp.Database.Table.View.SysViewColumns in 'BackEnd\Ths.Erp.Database.Table.View.SysViewColumns.pas',
  Ths.Erp.Database.Table.View in 'BackEnd\Ths.Erp.Database.Table.View.pas',
  ufrmSysLangs in 'Forms\OutputForms\DbGrid\ufrmSysLangs.pas' {frmSysLangs},
  ufrmSysLang in 'Forms\InputForms\ufrmSysLang.pas' {frmSysLang},
  ufrmSysGridColWidth in 'Forms\InputForms\ufrmSysGridColWidth.pas' {frmSysGridColWidth},
  ufrmSysGridColWidths in 'Forms\OutputForms\DbGrid\ufrmSysGridColWidths.pas' {frmSysGridColWidths},
  ufrmSysGridColColor in 'Forms\InputForms\ufrmSysGridColColor.pas' {frmSysGridColColor},
  ufrmSysGridColPercent in 'Forms\InputForms\ufrmSysGridColPercent.pas' {frmSysGridColPercent},
  ufrmSysGridColColors in 'Forms\OutputForms\DbGrid\ufrmSysGridColColors.pas' {frmSysGridColColors},
  ufrmSysGridColPercents in 'Forms\OutputForms\DbGrid\ufrmSysGridColPercents.pas' {frmSysGridColPercents},
  Ths.Erp.Database.Table.AyarHaneSayisi in 'BackEnd\Ths.Erp.Database.Table.AyarHaneSayisi.pas',
  Ths.Erp.Database.Table.ParaBirimi in 'BackEnd\Ths.Erp.Database.Table.ParaBirimi.pas',
  ufrmParaBirimi in 'Forms\InputForms\ufrmParaBirimi.pas' {frmParaBirimi},
  ufrmParaBirimleri in 'Forms\OutputForms\DbGrid\ufrmParaBirimleri.pas' {frmParaBirimleri},
  ufrmSysLangGuiContents in 'Forms\OutputForms\DbGrid\ufrmSysLangGuiContents.pas' {frmSysLangGuiContents},
  ufrmSysLangGuiContent in 'Forms\InputForms\ufrmSysLangGuiContent.pas' {frmSysLangGuiContent},
  Ths.Erp.Database.Table.SysLangDataContent in 'BackEnd\Ths.Erp.Database.Table.SysLangDataContent.pas',
  ufrmSysLangDataContents in 'Forms\OutputForms\DbGrid\ufrmSysLangDataContents.pas' {frmSysLangDataContents},
  ufrmSysLangDataContent in 'Forms\InputForms\ufrmSysLangDataContent.pas' {frmSysLangDataContent},
  Ths.Erp.Database.Table.SysQualityFormNumber in 'BackEnd\Ths.Erp.Database.Table.SysQualityFormNumber.pas',
  ufrmSysQualityFormNumbers in 'Forms\OutputForms\DbGrid\ufrmSysQualityFormNumbers.pas' {frmSysQualityFormNumbers},
  ufrmSysQualityFormNumber in 'Forms\InputForms\ufrmSysQualityFormNumber.pas' {frmSysQualityFormNumber},
  Ths.Erp.Database.Table.AyarStokHareketTipi in 'BackEnd\Ths.Erp.Database.Table.AyarStokHareketTipi.pas',
  ufrmAyarStokHareketTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarStokHareketTipleri.pas' {frmAyarStokHareketTipleri},
  ufrmAyarStokHareketTipi in 'Forms\InputForms\ufrmAyarStokHareketTipi.pas' {frmAyarStokHareketTipi},
  Ths.Erp.Database.Table.StokHareketi in 'BackEnd\Ths.Erp.Database.Table.StokHareketi.pas',
  ufrmStokHareketleri in 'Forms\OutputForms\DbGrid\ufrmStokHareketleri.pas' {frmStokHareketleri},
  ufrmStokHareketi in 'Forms\InputForms\ufrmStokHareketi.pas' {frmStokHareketi},
  Ths.Erp.Database.Table.SysGridDefaultOrderFilter in 'BackEnd\Ths.Erp.Database.Table.SysGridDefaultOrderFilter.pas',
  ufrmSysGridDefaultOrderFilters in 'Forms\OutputForms\DbGrid\ufrmSysGridDefaultOrderFilters.pas' {frmSysGridDefaultOrderFilters},
  ufrmSysGridDefaultOrderFilter in 'Forms\InputForms\ufrmSysGridDefaultOrderFilter.pas' {frmSysGridDefaultOrderFilter},
  Ths.Erp.Database.Table.AyarEFaturaFaturaTipi in 'BackEnd\Ths.Erp.Database.Table.AyarEFaturaFaturaTipi.pas',
  ufrmAyarEFaturaFaturaTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarEFaturaFaturaTipleri.pas' {frmAyarEFaturaFaturaTipleri},
  ufrmAyarEFaturaFaturaTipi in 'Forms\InputForms\ufrmAyarEFaturaFaturaTipi.pas' {frmAyarEFaturaFaturaTipi},
  Ths.Erp.Database.Table.AyarFirmaTipi in 'BackEnd\Ths.Erp.Database.Table.AyarFirmaTipi.pas',
  ufrmAyarFirmaTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarFirmaTipleri.pas' {frmAyarFirmaTipleri},
  ufrmAyarFirmaTipi in 'Forms\InputForms\ufrmAyarFirmaTipi.pas' {frmAyarFirmaTipi},
  Ths.Erp.Database.Table.AyarEFaturaIletisimKanali in 'BackEnd\Ths.Erp.Database.Table.AyarEFaturaIletisimKanali.pas',
  ufrmAyarEFaturaIletisimKanallari in 'Forms\OutputForms\DbGrid\ufrmAyarEFaturaIletisimKanallari.pas' {frmAyarEFaturaIletisimKanallari},
  ufrmAyarEFaturaIletisimKanali in 'Forms\InputForms\ufrmAyarEFaturaIletisimKanali.pas' {frmAyarEFaturaIletisimKanali},
  Ths.Erp.Database.Table.AyarEFaturaIstisnaKodu in 'BackEnd\Ths.Erp.Database.Table.AyarEFaturaIstisnaKodu.pas',
  ufrmAyarEFaturaIstisnaKodlari in 'Forms\OutputForms\DbGrid\ufrmAyarEFaturaIstisnaKodlari.pas' {frmAyarEFaturaIstisnaKodlari},
  ufrmAyarEFaturaIstisnaKodu in 'Forms\InputForms\ufrmAyarEFaturaIstisnaKodu.pas' {frmAyarEFaturaIstisnaKodu},
  Ths.Erp.Database.Table.SysApplicationSettings in 'BackEnd\Ths.Erp.Database.Table.SysApplicationSettings.pas',
  ufrmSysApplicationSetting in 'Forms\InputForms\ufrmSysApplicationSetting.pas' {frmSysApplicationSetting},
  Ths.Erp.Database.Table.SysApplicationSettingsOther in 'BackEnd\Ths.Erp.Database.Table.SysApplicationSettingsOther.pas',
  ufrmSysApplicationSettingsOther in 'Forms\InputForms\ufrmSysApplicationSettingsOther.pas' {frmSysApplicationSettingsOther},
  Ths.Erp.Database.Table.PersonelKarti in 'BackEnd\Ths.Erp.Database.Table.PersonelKarti.pas',
  ufrmPersonelKartlari in 'Forms\OutputForms\DbGrid\ufrmPersonelKartlari.pas' {frmPersonelKartlari},
  ufrmPersonelKarti in 'Forms\InputForms\ufrmPersonelKarti.pas' {frmPersonelKarti},
  Ths.Erp.Database.Table.AyarPersonelAskerlikDurumu in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelAskerlikDurumu.pas',
  ufrmAyarPersonelAskerlikDurumlari in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelAskerlikDurumlari.pas' {frmAyarPersonelAskerlikDurumlari},
  ufrmAyarPersonelAskerlikDurumu in 'Forms\InputForms\ufrmAyarPersonelAskerlikDurumu.pas' {frmAyarPersonelAskerlikDurumu},
  Ths.Erp.Database.Table.AyarPersonelBolum in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelBolum.pas',
  ufrmAyarPersonelBolumler in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelBolumler.pas' {frmAyarPersonelBolumler},
  ufrmAyarPersonelBolum in 'Forms\InputForms\ufrmAyarPersonelBolum.pas' {frmAyarPersonelBolum},
  Ths.Erp.Database.Table.AyarPersonelBirim in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelBirim.pas',
  ufrmAyarPersonelBirimler in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelBirimler.pas' {frmAyarPersonelBirimler},
  ufrmAyarPersonelBirim in 'Forms\InputForms\ufrmAyarPersonelBirim.pas' {frmAyarPersonelBirim},
  Ths.Erp.Database.Table.AyarPersonelGorev in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelGorev.pas',
  ufrmAyarPersonelGorevler in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelGorevler.pas' {frmAyarPersonelGorevler},
  ufrmAyarPersonelGorev in 'Forms\InputForms\ufrmAyarPersonelGorev.pas' {frmAyarPersonelGorev},
  Ths.Erp.Database.Table.AyarVergiOrani in 'BackEnd\Ths.Erp.Database.Table.AyarVergiOrani.pas',
  ufrmAyarVergiOranlari in 'Forms\OutputForms\DbGrid\ufrmAyarVergiOranlari.pas' {frmAyarVergiOranlari},
  ufrmAyarVergiOrani in 'Forms\InputForms\ufrmAyarVergiOrani.pas' {frmAyarVergiOrani},
  Ths.Erp.Database.Table.BolgeTuru in 'BackEnd\Ths.Erp.Database.Table.BolgeTuru.pas',
  ufrmBolgeTurleri in 'Forms\OutputForms\DbGrid\ufrmBolgeTurleri.pas' {frmBolgeTurleri},
  ufrmBolgeTuru in 'Forms\InputForms\ufrmBolgeTuru.pas' {frmBolgeTuru},
  Ths.Erp.Database.Table.HesapGrubu in 'BackEnd\Ths.Erp.Database.Table.HesapGrubu.pas',
  ufrmHesapGruplari in 'Forms\OutputForms\DbGrid\ufrmHesapGruplari.pas' {frmHesapGruplari},
  ufrmHesapGrubu in 'Forms\InputForms\ufrmHesapGrubu.pas' {frmHesapGrubu},
  Ths.Erp.Database.Table.Ambar in 'BackEnd\Ths.Erp.Database.Table.Ambar.pas',
  ufrmAmbarlar in 'Forms\OutputForms\DbGrid\ufrmAmbarlar.pas' {frmAmbarlar},
  ufrmAmbar in 'Forms\InputForms\ufrmAmbar.pas',
  Ths.Erp.Database.Table.OlcuBirimi in 'BackEnd\Ths.Erp.Database.Table.OlcuBirimi.pas',
  ufrmOlcuBirimleri in 'Forms\OutputForms\DbGrid\ufrmOlcuBirimleri.pas' {frmOlcuBirimleri},
  ufrmOlcuBirimi in 'Forms\InputForms\ufrmOlcuBirimi.pas' {frmOlcuBirimi},
  Ths.Erp.Database.Table.UrunKabulRedNedeni in 'BackEnd\Ths.Erp.Database.Table.UrunKabulRedNedeni.pas',
  ufrmUrunKabulRedNedenleri in 'Forms\OutputForms\DbGrid\ufrmUrunKabulRedNedenleri.pas' {frmUrunKabulRedNedenleri},
  ufrmUrunKabulRedNedeni in 'Forms\InputForms\ufrmUrunKabulRedNedeni.pas' {frmUrunKabulRedNedeni},
  Ths.Erp.Database.Table.QualityFormMailReciever in 'BackEnd\Ths.Erp.Database.Table.QualityFormMailReciever.pas',
  ufrmQualityFormMailRecievers in 'Forms\OutputForms\DbGrid\ufrmQualityFormMailRecievers.pas' {frmQualityFormMailRecievers},
  ufrmQualityFormMailReciever in 'Forms\InputForms\ufrmQualityFormMailReciever.pas' {frmQualityFormMailReciever},
  Ths.Erp.Database.Table.SysUserMacAddressException in 'BackEnd\Ths.Erp.Database.Table.SysUserMacAddressException.pas',
  ufrmSysUserMacAddressExceptions in 'Forms\OutputForms\DbGrid\ufrmSysUserMacAddressExceptions.pas' {frmSysUserMacAddressExceptions},
  ufrmSysUserMacAddressException in 'Forms\InputForms\ufrmSysUserMacAddressException.pas' {frmSysUserMacAddressException},
  Ths.Erp.Database.Table.DovizKuru in 'BackEnd\Ths.Erp.Database.Table.DovizKuru.pas',
  ufrmDovizKurlari in 'Forms\OutputForms\DbGrid\ufrmDovizKurlari.pas' {frmDovizKurlari},
  ufrmDovizKuru in 'Forms\InputForms\ufrmDovizKuru.pas' {frmDovizKuru},
  Ths.Erp.Database.Table.Banka in 'BackEnd\Ths.Erp.Database.Table.Banka.pas',
  ufrmBankalar in 'Forms\OutputForms\DbGrid\ufrmBankalar.pas' {frmBankalar},
  ufrmBanka in 'Forms\InputForms\ufrmBanka.pas' {frmBanka},
  Ths.Erp.Database.Table.BankaSubesi in 'BackEnd\Ths.Erp.Database.Table.BankaSubesi.pas',
  ufrmBankaSubeleri in 'Forms\OutputForms\DbGrid\ufrmBankaSubeleri.pas' {frmBankaSubeleri},
  ufrmBankaSubesi in 'Forms\InputForms\ufrmBankaSubesi.pas' {frmBankaSubesi},
  Ths.Erp.Database.Table.SysMultiLangDataTableList in 'BackEnd\Ths.Erp.Database.Table.SysMultiLangDataTableList.pas',
  ufrmSysMultiLangDataTableLists in 'Forms\OutputForms\DbGrid\ufrmSysMultiLangDataTableLists.pas' {frmSysMultiLangDataTableLists},
  ufrmSysMultiLangDataTableList in 'Forms\InputForms\ufrmSysMultiLangDataTableList.pas' {frmSysMultiLangDataTableList},
  Ths.Erp.Database.Table.StokTipi in 'BackEnd\Ths.Erp.Database.Table.StokTipi.pas',
  ufrmStokTipleri in 'Forms\OutputForms\DbGrid\ufrmStokTipleri.pas' {frmStokTipleri},
  ufrmStokTipi in 'Forms\InputForms\ufrmStokTipi.pas' {frmStokTipi},
  Ths.Erp.Database.Table.CinsAilesi in 'BackEnd\Ths.Erp.Database.Table.CinsAilesi.pas',
  ufrmCinsAileleri in 'Forms\OutputForms\DbGrid\ufrmCinsAileleri.pas' {frmCinsAileleri},
  ufrmCinsAilesi in 'Forms\InputForms\ufrmCinsAilesi.pas' {frmCinsAilesi},
  Ths.Erp.Database.Table.CinsOzelligi in 'BackEnd\Ths.Erp.Database.Table.CinsOzelligi.pas',
  ufrmCinsOzellikleri in 'Forms\OutputForms\DbGrid\ufrmCinsOzellikleri.pas' {frmCinsOzellikleri},
  ufrmCinsOzelligi in 'Forms\InputForms\ufrmCinsOzelligi.pas' {frmCinsOzelligi},
  Ths.Erp.Database.Table.AyarHesapTipi in 'BackEnd\Ths.Erp.Database.Table.AyarHesapTipi.pas',
  ufrmAyarHesapTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarHesapTipleri.pas' {frmAyarHesapTipleri},
  ufrmAyarHesapTipi in 'Forms\InputForms\ufrmAyarHesapTipi.pas' {frmAyarHesapTipi},
  Ths.Erp.Database.Table.StokKarti in 'BackEnd\Ths.Erp.Database.Table.StokKarti.pas',
  ufrmStokKartlari in 'Forms\OutputForms\DbGrid\ufrmStokKartlari.pas' {frmStokKartlari},
  ufrmStokKarti in 'Forms\InputForms\ufrmStokKarti.pas' {frmStokKarti},
  Ths.Erp.Database.Table.StokGrubuTuru in 'BackEnd\Ths.Erp.Database.Table.StokGrubuTuru.pas',
  ufrmStokGrubuTurleri in 'Forms\OutputForms\DbGrid\ufrmStokGrubuTurleri.pas' {frmStokGrubuTurleri},
  ufrmStokGrubuTuru in 'Forms\InputForms\ufrmStokGrubuTuru.pas' {frmStokGrubuTuru},
  Ths.Erp.Database.Table.StokGrubu in 'BackEnd\Ths.Erp.Database.Table.StokGrubu.pas',
  ufrmStokGruplari in 'Forms\OutputForms\DbGrid\ufrmStokGruplari.pas' {frmStokGruplari},
  ufrmStokGrubu in 'Forms\InputForms\ufrmStokGrubu.pas' {frmStokGrubu},
  ufrmBaseHelper in 'Forms\OutputForms\Helper\Factory\ufrmBaseHelper.pas' {frmBaseHelper},
  ufrmHelperOlcuBirimi in 'Forms\OutputForms\Helper\ufrmHelperOlcuBirimi.pas' {frmHelperOlcuBirimi},
  ufrmHelperStokGrubu in 'Forms\OutputForms\Helper\ufrmHelperStokGrubu.pas' {frmHelperStokGrubu},
  ufrmHelperStokKarti in 'Forms\OutputForms\Helper\ufrmHelperStokKarti.pas' {frmHelperStokKarti},
  Ths.Erp.Database.Table.AyarBarkodUrunTuru in 'BackEnd\Ths.Erp.Database.Table.AyarBarkodUrunTuru.pas',
  ufrmAyarBarkodUrunTurleri in 'Forms\OutputForms\DbGrid\ufrmAyarBarkodUrunTurleri.pas' {frmAyarBarkodUrunTurleri},
  ufrmAyarBarkodUrunTuru in 'Forms\InputForms\ufrmAyarBarkodUrunTuru.pas' {frmAyarBarkodUrunTuru},
  Ths.Erp.Database.Table.AyarBarkodTezgah in 'BackEnd\Ths.Erp.Database.Table.AyarBarkodTezgah.pas',
  ufrmAyarBarkodTezgahlar in 'Forms\OutputForms\DbGrid\ufrmAyarBarkodTezgahlar.pas' {frmAyarBarkodTezgahlar},
  ufrmAyarBarkodTezgah in 'Forms\InputForms\ufrmAyarBarkodTezgah.pas' {frmAyarBarkodTezgah},
  Ths.Erp.Database.Table.AyarBarkodSeriNoTuru in 'BackEnd\Ths.Erp.Database.Table.AyarBarkodSeriNoTuru.pas',
  ufrmAyarBarkodSeriNoTurleri in 'Forms\OutputForms\DbGrid\ufrmAyarBarkodSeriNoTurleri.pas' {frmAyarBarkodSeriNoTurleri},
  ufrmAyarBarkodSeriNoTuru in 'Forms\InputForms\ufrmAyarBarkodSeriNoTuru.pas' {frmAyarBarkodSeriNoTuru},
  Ths.Erp.Database.Table.AyarBarkodHazirlikDosyaTuru in 'BackEnd\Ths.Erp.Database.Table.AyarBarkodHazirlikDosyaTuru.pas',
  ufrmAyarBarkodHazirlikDosyaTurleri in 'Forms\OutputForms\DbGrid\ufrmAyarBarkodHazirlikDosyaTurleri.pas' {frmAyarBarkodHazirlikDosyaTurleri},
  ufrmAyarBarkodHazirlikDosyaTuru in 'Forms\InputForms\ufrmAyarBarkodHazirlikDosyaTuru.pas' {frmAyarBarkodHazirlikDosyaTuru},
  Ths.Erp.Database.Table.AyarCekSenetTipi in 'BackEnd\Ths.Erp.Database.Table.AyarCekSenetTipi.pas',
  ufrmAyarCekSenetTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarCekSenetTipleri.pas' {frmAyarCekSenetTipleri},
  ufrmAyarCekSenetTipi in 'Forms\InputForms\ufrmAyarCekSenetTipi.pas' {frmAyarCekSenetTipi},
  Ths.Erp.Database.Table.AyarTeklifDurum in 'BackEnd\Ths.Erp.Database.Table.AyarTeklifDurum.pas',
  ufrmAyarTeklifDurumlar in 'Forms\OutputForms\DbGrid\ufrmAyarTeklifDurumlar.pas' {frmAyarTeklifDurumlar},
  ufrmAyarTeklifDurum in 'Forms\InputForms\ufrmAyarTeklifDurum.pas' {frmAyarTeklifDurum},
  Ths.Erp.Database.Table.AyarCekSenetCashEdiciTipi in 'BackEnd\Ths.Erp.Database.Table.AyarCekSenetCashEdiciTipi.pas',
  ufrmAyarCekSenetCashEdiciTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarCekSenetCashEdiciTipleri.pas' {frmAyarCekSenetCashEdiciTipleri},
  ufrmAyarCekSenetCashEdiciTipi in 'Forms\InputForms\ufrmAyarCekSenetCashEdiciTipi.pas' {frmAyarCekSenetCashEdiciTipi},
  Ths.Erp.Database.Table.AyarCekSenetTahsilOdemeTipi in 'BackEnd\Ths.Erp.Database.Table.AyarCekSenetTahsilOdemeTipi.pas',
  ufrmAyarCekSenetTahsilOdemeTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarCekSenetTahsilOdemeTipleri.pas' {frmAyarCekSenetTahsilOdemeTipleri},
  ufrmAyarCekSenetTahsilOdemeTipi in 'Forms\InputForms\ufrmAyarCekSenetTahsilOdemeTipi.pas' {frmAyarCekSenetTahsilOdemeTipi},
  Ths.Erp.Database.Table.SatisTeklif in 'BackEnd\Ths.Erp.Database.Table.SatisTeklif.pas',
  Ths.Erp.Database.Table.SatisTeklifDetay in 'BackEnd\Ths.Erp.Database.Table.SatisTeklifDetay.pas',
  ufrmSatisTeklifler in 'Forms\OutputForms\DbGrid\ufrmSatisTeklifler.pas' {frmSatisTeklifler},
  ufrmSatisTeklifDetaylar in 'Forms\DetailedInputForms\ufrmSatisTeklifDetaylar.pas' {frmSatisTeklifDetaylar},
  ufrmSatisTeklifDetay in 'Forms\DetailedInputForms\ufrmSatisTeklifDetay.pas' {frmSatisTeklifDetay},
  Ths.Erp.Database.Table.AyarTeklifTipi in 'BackEnd\Ths.Erp.Database.Table.AyarTeklifTipi.pas',
  ufrmAyarTeklifTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarTeklifTipleri.pas' {frmAyarTeklifTipleri},
  ufrmAyarTeklifTipi in 'Forms\InputForms\ufrmAyarTeklifTipi.pas' {frmAyarTeklifTipi},
  Ths.Erp.Database.Table.AyarOdemeBaslangicDonemi in 'BackEnd\Ths.Erp.Database.Table.AyarOdemeBaslangicDonemi.pas',
  ufrmAyarOdemeBaslangicDonemleri in 'Forms\OutputForms\DbGrid\ufrmAyarOdemeBaslangicDonemleri.pas' {frmAyarOdemeBaslangicDonemleri},
  ufrmAyarOdemeBaslangicDonemi in 'Forms\InputForms\ufrmAyarOdemeBaslangicDonemi.pas' {frmAyarOdemeBaslangicDonemi},
  Ths.Erp.Database.Table.AyarPersonelTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelTipi.pas',
  ufrmAyarPersonelTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelTipleri.pas' {frmAyarPersonelTipleri},
  ufrmAyarPersonelTipi in 'Forms\InputForms\ufrmAyarPersonelTipi.pas' {frmAyarPersonelTipi},
  Ths.Erp.Database.Table.AyarPersonelCinsiyet in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelCinsiyet.pas',
  ufrmAyarPersonelCinsiyetler in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelCinsiyetler.pas' {frmAyarPersonelCinsiyetler},
  ufrmAyarPersonelCinsiyet in 'Forms\InputForms\ufrmAyarPersonelCinsiyet.pas' {frmAyarCinsiyet},
  Ths.Erp.Database.Table.AyarPersonelKanGrubu in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelKanGrubu.pas',
  ufrmAyarPersonelKanGruplari in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelKanGruplari.pas' {frmAyarPersonelKanGruplari},
  ufrmAyarPersonelKanGrubu in 'Forms\InputForms\ufrmAyarPersonelKanGrubu.pas' {frmAyarPersonelKanGrubu},
  Ths.Erp.Database.Table.AyarPersonelEgitimDurumu in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelEgitimDurumu.pas',
  ufrmAyarPersonelEgitimDurumlari in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelEgitimDurumlari.pas' {frmAyarPersonelEgitimDurumlari},
  ufrmAyarPersonelEgitimDurumu in 'Forms\InputForms\ufrmAyarPersonelEgitimDurumu.pas' {frmAyarPersonelEgitimDurumu},
  Ths.Erp.Database.Table.AyarPersonelRaporTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelRaporTipi.pas',
  ufrmAyarPersonelRaporTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelRaporTipleri.pas' {frmAyarPersonelRaporTipleri},
  ufrmAyarPersonelRaporTipi in 'Forms\InputForms\ufrmAyarPersonelRaporTipi.pas' {frmAyarPersonelRaporTipi},
  Ths.Erp.Database.Table.AyarPersonelIzinTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelIzinTipi.pas',
  ufrmAyarPersonelIzinTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelIzinTipleri.pas' {frmAyarPersonelIzinTipleri},
  ufrmAyarPersonelIzinTipi in 'Forms\InputForms\ufrmAyarPersonelIzinTipi.pas' {frmAyarPersonelIzinTipi},
  Ths.Erp.Database.Table.AyarPersonelMedeniDurum in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelMedeniDurum.pas',
  ufrmAyarPersonelMedeniDurumlar in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelMedeniDurumlar.pas' {frmAyarPersonelMedeniDurumlar},
  ufrmAyarPersonelMedeniDurum in 'Forms\InputForms\ufrmAyarPersonelMedeniDurum.pas' {frmAyarPersonelMedeniDurum},
  Ths.Erp.Database.Table.AyarPersonelDil in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelDil.pas',
  ufrmAyarPersonelDilleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelDilleri.pas' {frmAyarPersonelDilleri},
  ufrmAyarPersonelDil in 'Forms\InputForms\ufrmAyarPersonelDil.pas' {frmAyarPersonelDil},
  Ths.Erp.Database.Table.AyarPersonelDilSeviyesi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelDilSeviyesi.pas',
  ufrmAyarPersonelDilSeviyeleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelDilSeviyeleri.pas' {frmAyarPersonelDilSeviyeleri},
  ufrmAyarPersonelDilSeviyesi in 'Forms\InputForms\ufrmAyarPersonelDilSeviyesi.pas' {frmAyarPersonelDilSeviyesi},
  Ths.Erp.Database.Table.PersonelDilBilgisi in 'BackEnd\Ths.Erp.Database.Table.PersonelDilBilgisi.pas',
  ufrmPersonelDilBilgileri in 'Forms\OutputForms\DbGrid\ufrmPersonelDilBilgileri.pas' {frmPersonelDilBilgileri},
  ufrmPersonelDilBilgisi in 'Forms\InputForms\ufrmPersonelDilBilgisi.pas' {frmPersonelDilBilgisi},
  Ths.Erp.Database.Table.AyarPersonelEhliyetTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelEhliyetTipi.pas',
  ufrmAyarPersonelEhliyetTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelEhliyetTipleri.pas' {frmAyarPersonelEhliyetTipleri},
  ufrmAyarPersonelEhliyetTipi in 'Forms\InputForms\ufrmAyarPersonelEhliyetTipi.pas' {frmAyarPersonelEhliyetTipi},
  Ths.Erp.Database.Table.AyarPersonelMykTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelMykTipi.pas',
  ufrmAyarPersonelMykTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelMykTipleri.pas' {frmAyarPersonelMykTipleri},
  ufrmAyarPersonelMykTipi in 'Forms\InputForms\ufrmAyarPersonelMykTipi.pas' {frmAyarPersonelMykTipi},
  Ths.Erp.Database.Table.AyarPersonelSrcTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelSrcTipi.pas',
  ufrmAyarPersonelSrcTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelSrcTipleri.pas' {frmAyarPersonelSrcTipleri},
  ufrmAyarPersonelSrcTipi in 'Forms\InputForms\ufrmAyarPersonelSrcTipi.pas' {frmAyarPersonelSrcTipi},
  Ths.Erp.Database.Table.AyarPersonelAyrilmaNedeniTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelAyrilmaNedeniTipi.pas',
  ufrmAyarPersonelAyrilmaNedeniTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelAyrilmaNedeniTipleri.pas' {frmAyarPersonelAyrilmaNedeniTipleri},
  ufrmAyarPersonelAyrilmaNedeniTipi in 'Forms\InputForms\ufrmAyarPersonelAyrilmaNedeniTipi.pas' {frmAyarPersonelAyrilmaNedeniTipi},
  Ths.Erp.Database.Table.AyarPersonelMektupTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelMektupTipi.pas',
  ufrmAyarPersonelMektupTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelMektupTipleri.pas' {frmAyarPersonelMektupTipleri},
  ufrmAyarPersonelMektupTipi in 'Forms\InputForms\ufrmAyarPersonelMektupTipi.pas' {frmAyarPersonelMektupTipi},
  Ths.Erp.Database.Table.AyarPersonelTatilTipi in 'BackEnd\Ths.Erp.Database.Table.AyarPersonelTatilTipi.pas',
  ufrmAyarPersonelTatilTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarPersonelTatilTipleri.pas' {frmAyarPersonelTatilTipleri},
  ufrmAyarPersonelTatilTipi in 'Forms\InputForms\ufrmAyarPersonelTatilTipi.pas' {frmAyarPersonelTatilTipi},
  Ths.Erp.Helper.Button in 'BackEnd\Ths.Erp.Helper.Button.pas',
  ufrmCalculator in 'Forms\OtherForms\ufrmCalculator.pas' {frmCalculator},
  ufrmAybeyTeklifHesapla in 'Forms\OtherForms\ufrmAybeyTeklifHesapla.pas' {frmAybeyTeklifHesapla},
  Ths.Erp.Helper.Edit in 'BackEnd\Ths.Erp.Helper.Edit.pas',
  Ths.Erp.Helper.ComboBox in 'BackEnd\Ths.Erp.Helper.ComboBox.pas',
  Ths.Erp.Helper.BaseTypes in 'BackEnd\Ths.Erp.Helper.BaseTypes.pas',
  Ths.Erp.Helper.Memo in 'BackEnd\Ths.Erp.Helper.Memo.pas',
  Ths.Erp.Database.Table.HesapKarti in 'BackEnd\Ths.Erp.Database.Table.HesapKarti.pas',
  ufrmHesapKartlari in 'Forms\OutputForms\DbGrid\ufrmHesapKartlari.pas' {frmHesapKartlari},
  ufrmHesapKarti in 'Forms\InputForms\ufrmHesapKarti.pas' {frmHesapKarti},
  Ths.Erp.Database.Table.Bolge in 'BackEnd\Ths.Erp.Database.Table.Bolge.pas',
  ufrmBolgeler in 'Forms\OutputForms\DbGrid\ufrmBolgeler.pas' {frmBolgeler},
  ufrmBolge in 'Forms\InputForms\ufrmBolge.pas' {frmBolge},
  Ths.Erp.Database.Table.HesapPlani in 'BackEnd\Ths.Erp.Database.Table.HesapPlani.pas',
  ufrmHesapPlanlari in 'Forms\OutputForms\DbGrid\ufrmHesapPlanlari.pas' {frmHesapPlanlari},
  ufrmHesapPlani in 'Forms\InputForms\ufrmHesapPlani.pas' {frmHesapPlani},
  Ths.Erp.Database.Table.AyarMukellefTipi in 'BackEnd\Ths.Erp.Database.Table.AyarMukellefTipi.pas',
  ufrmAyarMukellefTipleri in 'Forms\OutputForms\DbGrid\ufrmAyarMukellefTipleri.pas' {frmAyarMukellefTipleri},
  ufrmAyarMukellefTipi in 'Forms\InputForms\ufrmAyarMukellefTipi.pas' {frmAyarMukellefTipi},
  Ths.Erp.Helper.CustomFileDialog in 'BackEnd\Tools\Ths.Erp.Helper.CustomFileDialog.pas',
  ufrmHelperHesapGrubu in 'Forms\OutputForms\Helper\ufrmHelperHesapGrubu.pas' {frmHelperHesapGrubu},
  Ths.Erp.Database.Table.AyarFirmaTuru in 'BackEnd\Ths.Erp.Database.Table.AyarFirmaTuru.pas',
  ufrmAyarFirmaTurleri in 'Forms\OutputForms\DbGrid\ufrmAyarFirmaTurleri.pas' {frmAyarFirmaTurleri},
  ufrmAyarFirmaTuru in 'Forms\InputForms\ufrmAyarFirmaTuru.pas' {frmAyarFirmaTuru},
  Ths.Erp.Database.Table.AracTakip.Arac in 'BackEnd\Ths.Erp.Database.Table.AracTakip.Arac.pas',
  ufrmAracTakipAraclar in 'Forms\OutputForms\DbGrid\ufrmAracTakipAraclar.pas' {frmAracTakipAraclar},
  ufrmAracTakipArac in 'Forms\InputForms\ufrmAracTakipArac.pas' {frmAracTakipArac},
  Ths.Erp.Database.Table.MusteriTemsilciGrubu in 'BackEnd\Ths.Erp.Database.Table.MusteriTemsilciGrubu.pas',
  ufrmMusteriTemsilciGruplari in 'Forms\OutputForms\DbGrid\ufrmMusteriTemsilciGruplari.pas' {frmMusteriTemsilciGruplari},
  ufrmMusteriTemsilciGrubu in 'Forms\InputForms\ufrmMusteriTemsilciGrubu.pas' {frmMusteriTemsilciGrubu},
  Ths.Erp.Database.Table.PersonelPDKSKart in 'BackEnd\Ths.Erp.Database.Table.PersonelPDKSKart.pas',
  ufrmPersonelPDKSKartlar in 'Forms\OutputForms\DbGrid\ufrmPersonelPDKSKartlar.pas' {frmPersonelPDKSKartlar},
  ufrmPersonelPDKSKart in 'Forms\InputForms\ufrmPersonelPDKSKart.pas' {frmPersonelPDKSKart},
  Ths.Erp.Database.Table.PersonelTasimaServisi in 'BackEnd\Ths.Erp.Database.Table.PersonelTasimaServisi.pas',
  ufrmPersonelTasimaServisleri in 'Forms\OutputForms\DbGrid\ufrmPersonelTasimaServisleri.pas' {frmPersonelTasimaServisleri},
  ufrmPersonelTasimaServisi in 'Forms\InputForms\ufrmPersonelTasimaServisi.pas' {frmPersonelTasimaServisi},
  Ths.Erp.Database.Table.View.SysViewTables in 'BackEnd\Ths.Erp.Database.Table.View.SysViewTables.pas';

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := True;

  TStyleManager.TrySetStyle('Silver');
  Application.Title := 'Thunder Soft ERP';
  Application.CreateForm(TfrmMain, frmMain);
  if TfrmLogin.Execute then
  begin
    Application.ShowMainForm := True;
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;
end.

