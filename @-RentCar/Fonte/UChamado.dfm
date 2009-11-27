object frmRentCarAberturaChamado: TfrmRentCarAberturaChamado
  Left = 287
  Top = 205
  Width = 479
  Height = 463
  Caption = '@-RentCar - Abertura de Chamados'
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
  object btnSair: TButton
    Left = 333
    Top = 401
    Width = 71
    Height = 25
    Caption = 'Sair'
    TabOrder = 0
    OnClick = btnSairClick
  end
  object btnLimpar: TButton
    Left = 241
    Top = 401
    Width = 68
    Height = 25
    Caption = 'Limpar'
    TabOrder = 1
  end
  object btnCadastrar: TButton
    Left = 51
    Top = 401
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
    Height = 92
    Caption = 'Busca dos Dados'
    TabOrder = 3
    object lblNome: TLabel
      Left = 28
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object lblCPF: TLabel
      Left = 27
      Top = 49
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object edtNome: TEdit
      Left = 28
      Top = 28
      Width = 305
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edtCPF: TEdit
      Left = 28
      Top = 63
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object rbNome: TRadioButton
      Left = 6
      Top = 30
      Width = 18
      Height = 17
      TabOrder = 2
      OnClick = rbNomeClick
    end
    object rbCPF: TRadioButton
      Left = 6
      Top = 62
      Width = 17
      Height = 17
      TabOrder = 3
      OnClick = rbCPFClick
    end
  end
  object gbAberturaChamados: TGroupBox
    Left = 4
    Top = 106
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
    object DateTimePicker1: TDateTimePicker
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
      TabOrder = 2
    end
    object rgStatusChamados: TRadioGroup
      Left = 8
      Top = 253
      Width = 191
      Height = 33
      Caption = 'Status Chamado'
      Columns = 2
      Items.Strings = (
        'Fechado'
        'Em Espera')
      TabOrder = 3
    end
  end
  object brnSalvar: TButton
    Left = 147
    Top = 401
    Width = 73
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = brnSalvarClick
  end
end
