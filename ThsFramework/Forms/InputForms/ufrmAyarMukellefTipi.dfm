inherited frmAyarMukellefTipi: TfrmAyarMukellefTipi
  Left = 501
  Top = 443
  ActiveControl = btnClose
  Caption = 'Ayar M'#252'kellef Tipi'
  ClientHeight = 127
  ClientWidth = 348
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 354
  ExplicitHeight = 156
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 344
    Height = 61
    Color = clWindow
    ExplicitWidth = 344
    ExplicitHeight = 61
    object lblDeger: TLabel
      Left = 73
      Top = 8
      Width = 35
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'De'#287'er'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object lblIsDefault: TLabel
      Left = 42
      Top = 35
      Width = 66
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Varsay'#305'lan?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object edtDeger: TEdit
      Left = 112
      Top = 5
      Width = 224
      Height = 21
      TabOrder = 0
    end
    object chkIsDefault: TCheckBox
      Left = 112
      Top = 34
      Width = 224
      Height = 17
      TabOrder = 1
    end
  end
  inherited pnlBottom: TPanel
    Top = 65
    Width = 344
    ExplicitTop = 65
    ExplicitWidth = 344
    inherited btnAccept: TButton
      Left = 135
      ExplicitLeft = 135
    end
    inherited btnDelete: TButton
      Left = 31
      ExplicitLeft = 31
    end
    inherited btnClose: TButton
      Left = 239
      ExplicitLeft = 239
    end
  end
  inherited stbBase: TStatusBar
    Top = 109
    Width = 348
    ExplicitTop = 109
    ExplicitWidth = 348
  end
end
