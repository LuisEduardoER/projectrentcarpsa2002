object frmConsultarLocacoes: TfrmConsultarLocacoes
  Left = 354
  Top = 162
  Width = 528
  Height = 413
  Caption = '@-RentCar - Consultar Loca'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbFiltros: TGroupBox
    Left = 13
    Top = 8
    Width = 500
    Height = 97
    TabOrder = 0
    object lblA: TLabel
      Left = 153
      Top = 74
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object ckCliente: TCheckBox
      Left = 6
      Top = 17
      Width = 52
      Height = 17
      Caption = 'Cliente'
      TabOrder = 0
    end
    object ckVeiculo: TCheckBox
      Left = 6
      Top = 47
      Width = 59
      Height = 18
      Caption = 'Veiculo'
      TabOrder = 1
    end
    object DBLookupVeiculo: TDBLookupComboBox
      Left = 66
      Top = 43
      Width = 246
      Height = 21
      DataField = 'RentCar_Pessoa_Pes_id'
      DataSource = dmRentCar.dsTAlugar
      KeyField = 'Vel_id'
      ListField = 'Vel_Espec'
      ListSource = dmRentCar.dsCadVeiculo
      TabOrder = 2
    end
    object DateI: TDateTimePicker
      Left = 66
      Top = 70
      Width = 83
      Height = 21
      Date = 40155.776329027780000000
      Time = 40155.776329027780000000
      TabOrder = 3
    end
    object DateF: TDateTimePicker
      Left = 170
      Top = 69
      Width = 83
      Height = 21
      Date = 40155.776329027780000000
      Time = 40155.776329027780000000
      TabOrder = 4
    end
    object ckPeriodo: TCheckBox
      Left = 7
      Top = 72
      Width = 56
      Height = 18
      Caption = 'Periodo'
      TabOrder = 5
    end
  end
  object btnBuscar: TButton
    Left = 13
    Top = 117
    Width = 81
    Height = 21
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object DBGBVec: TDBGrid
    Left = 12
    Top = 146
    Width = 501
    Height = 215
    DataSource = dmRentCar.dsQFunctions
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGBVecCellClick
  end
  object DBLookupCliente: TDBLookupComboBox
    Left = 79
    Top = 24
    Width = 246
    Height = 21
    DataField = 'RentCar_Pessoa_Pes_id'
    DataSource = dmRentCar.dsTAlugar
    TabOrder = 3
  end
end
