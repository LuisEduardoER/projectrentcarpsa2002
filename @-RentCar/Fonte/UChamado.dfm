object frmRentCarAberturaChamado: TfrmRentCarAberturaChamado
  Left = 287
  Top = 205
  Width = 479
  Height = 439
  Caption = '@-RentCar - Abertura de Chamados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSair: TButton
    Left = 331
    Top = 372
    Width = 71
    Height = 25
    Caption = 'Sair'
    TabOrder = 0
    OnClick = btnSairClick
  end
  object btnLimpar: TButton
    Left = 239
    Top = 372
    Width = 68
    Height = 25
    Caption = 'Limpar'
    TabOrder = 1
  end
  object btnCadastrar: TButton
    Left = 49
    Top = 372
    Width = 78
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastrarClick
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 5
    Width = 465
    Height = 61
    Caption = 'Busca dos Dados'
    TabOrder = 3
    object lblNome: TLabel
      Left = 14
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object edtNome: TEdit
      Left = 14
      Top = 28
      Width = 305
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscar: TButton
      Left = 334
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object gbAberturaChamados: TGroupBox
    Left = 4
    Top = 74
    Width = 465
    Height = 291
    Caption = 'Abertura Chamados'
    Enabled = False
    TabOrder = 4
    object lblSolicitacao: TLabel
      Left = 8
      Top = 20
      Width = 52
      Height = 13
      Caption = 'Solicita'#231#227'o'
    end
    object lblData: TLabel
      Left = 183
      Top = 25
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lblDesc: TLabel
      Left = 9
      Top = 72
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblProtocol: TLabel
      Left = 208
      Top = 264
      Width = 55
      Height = 13
      Caption = 'Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTProtocol: TDBText
      Left = 272
      Top = 264
      Width = 81
      Height = 17
      DataField = 'Ch_Protocol'
      DataSource = dmRentCar.dsTChamado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTHora: TDBText
      Left = 311
      Top = 38
      Width = 65
      Height = 17
      DataField = 'Ch_HoraCh'
      DataSource = dmRentCar.dsTChamado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 311
      Top = 25
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object DBLCBSolcit: TDBLookupComboBox
      Left = 8
      Top = 36
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object DataChamado: TDateTimePicker
      Left = 183
      Top = 37
      Width = 103
      Height = 21
      Date = 40134.684487303240000000
      Time = 40134.684487303240000000
      TabOrder = 1
    end
    object DBREChamado: TDBRichEdit
      Left = 8
      Top = 87
      Width = 449
      Height = 162
      DataField = 'Ch_DescCh'
      DataSource = dmRentCar.dsTChamado
      TabOrder = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 254
      Width = 185
      Height = 33
      Caption = 'Status Chamado'
      Columns = 2
      DataField = 'Ch_Status'
      DataSource = dmRentCar.dsTChamado
      Items.Strings = (
        'Fechado'
        'Em Espera')
      TabOrder = 3
      Values.Strings = (
        'F'
        'E')
    end
  end
  object brnSalvar: TButton
    Left = 145
    Top = 372
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = brnSalvarClick
  end
end
