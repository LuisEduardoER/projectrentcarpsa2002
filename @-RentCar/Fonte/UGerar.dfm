object frmGerar: TfrmGerar
  Left = 447
  Top = 236
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '@-RentCar'
  ClientHeight = 112
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbFiltros: TGroupBox
    Left = 20
    Top = 2
    Width = 277
    Height = 54
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object DBLookupCliente: TDBLookupComboBox
      Left = 6
      Top = 24
      Width = 235
      Height = 21
      DataField = 'RentCar_Pessoa_Pes_id'
      TabOrder = 0
    end
  end
  object btnGerar: TButton
    Left = 81
    Top = 62
    Width = 131
    Height = 22
    TabOrder = 1
    OnClick = btnGerarClick
  end
  object pbPerfil: TProgressBar
    Left = 1
    Top = 90
    Width = 312
    Height = 17
    Step = 1
    TabOrder = 2
  end
end
