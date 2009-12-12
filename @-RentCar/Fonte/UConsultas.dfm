object frmConsultas: TfrmConsultas
  Left = 312
  Top = 240
  Width = 476
  Height = 484
  Caption = '@-RentCar - Consultas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgcConsultas: TPageControl
    Left = 16
    Top = 16
    Width = 441
    Height = 425
    ActivePage = tsConsultVeiculos
    TabOrder = 0
    object tsConsultClientes: TTabSheet
      Caption = 'Consulta Clientes'
      object gbFiltros: TGroupBox
        Left = 6
        Top = 8
        Width = 419
        Height = 77
        TabOrder = 0
        object ckNome: TCheckBox
          Left = 6
          Top = 17
          Width = 49
          Height = 17
          Caption = 'Nome'
          TabOrder = 0
          OnClick = ckNomeClick
        end
        object ckCPFCNPJ: TCheckBox
          Left = 6
          Top = 47
          Width = 73
          Height = 18
          Caption = 'CPF/CNPJ'
          TabOrder = 1
          OnClick = ckCPFCNPJClick
        end
        object edtNome: TEdit
          Left = 85
          Top = 14
          Width = 329
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object edtCPFCNPJ: TEdit
          Left = 84
          Top = 42
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 3
        end
      end
      object btnBuscar: TButton
        Left = 7
        Top = 88
        Width = 81
        Height = 21
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarClick
      end
      object DBGClientes: TDBGrid
        Left = 5
        Top = 115
        Width = 419
        Height = 215
        DataSource = dmRentCar.dsQCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGClientesCellClick
      end
      object DBNavigator4: TDBNavigator
        Left = 6
        Top = 336
        Width = 415
        Height = 25
        DataSource = dmRentCar.dsQFunctions
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 3
      end
    end
    object tsConsultLoc: TTabSheet
      Caption = 'Consultar Loca'#231#245'es'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 13
        Top = 8
        Width = 416
        Height = 97
        TabOrder = 0
        object lblA: TLabel
          Left = 153
          Top = 65
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object ckCliente: TCheckBox
          Left = 7
          Top = 15
          Width = 52
          Height = 17
          Caption = 'Cliente'
          TabOrder = 0
        end
        object ckVeiculo: TCheckBox
          Left = 7
          Top = 38
          Width = 59
          Height = 18
          Caption = 'Veiculo'
          TabOrder = 1
        end
        object DBLookupVeiculo: TDBLookupComboBox
          Left = 67
          Top = 34
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
          Top = 61
          Width = 83
          Height = 21
          Date = 40155.776329027780000000
          Time = 40155.776329027780000000
          TabOrder = 3
        end
        object DateF: TDateTimePicker
          Left = 170
          Top = 60
          Width = 83
          Height = 21
          Date = 40155.776329027780000000
          Time = 40155.776329027780000000
          TabOrder = 4
        end
        object ckPeriodo: TCheckBox
          Left = 7
          Top = 63
          Width = 56
          Height = 18
          Caption = 'Periodo'
          TabOrder = 5
        end
        object DBLookupCliente: TDBLookupComboBox
          Left = 67
          Top = 10
          Width = 246
          Height = 21
          DataField = 'RentCar_Pessoa_Pes_id'
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 6
        end
      end
      object btnBuscarLoc: TButton
        Left = 12
        Top = 108
        Width = 81
        Height = 21
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarLocClick
      end
      object DBGLoc: TDBGrid
        Left = 11
        Top = 134
        Width = 420
        Height = 215
        DataSource = dmRentCar.dsQFunctions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGLocCellClick
      end
      object DBNavigator3: TDBNavigator
        Left = 11
        Top = 353
        Width = 420
        Height = 25
        DataSource = dmRentCar.dsQFunctions
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 3
      end
    end
    object tsConsultVeiculos: TTabSheet
      Caption = 'Consultar Veiculos'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 13
        Top = 8
        Width = 404
        Height = 81
        TabOrder = 0
        object ckPlaca: TCheckBox
          Left = 6
          Top = 17
          Width = 49
          Height = 17
          Caption = 'Placa'
          TabOrder = 0
          OnClick = ckPlacaClick
        end
        object ckAno: TCheckBox
          Left = 6
          Top = 47
          Width = 43
          Height = 18
          Caption = 'Ano'
          TabOrder = 1
          OnClick = ckAnoClick
        end
        object DateAno: TDateTimePicker
          Left = 66
          Top = 41
          Width = 49
          Height = 21
          Date = 40149.664795277780000000
          Format = 'yyyy'
          Time = 40149.664795277780000000
          DateMode = dmUpDown
          Enabled = False
          TabOrder = 2
        end
        object mkPlaca: TMaskEdit
          Left = 66
          Top = 14
          Width = 53
          Height = 21
          Enabled = False
          EditMask = 'LLL-9999;1;_'
          MaxLength = 8
          TabOrder = 3
          Text = '   -    '
        end
      end
      object btnBuscarVec: TButton
        Left = 13
        Top = 93
        Width = 81
        Height = 21
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarVecClick
      end
      object DBGVec: TDBGrid
        Left = 13
        Top = 118
        Width = 417
        Height = 248
        DataSource = dmRentCar.dsCadVeiculo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGVecCellClick
      end
      object DBNavigator2: TDBNavigator
        Left = 13
        Top = 369
        Width = 415
        Height = 25
        DataSource = dmRentCar.dsQFunctions
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 3
      end
    end
    object tsListagemChamados: TTabSheet
      Caption = 'Listagem Chamados'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 10
        Top = 7
        Width = 260
        Height = 43
        TabOrder = 0
        object ckProtocolo: TCheckBox
          Left = 6
          Top = 17
          Width = 73
          Height = 18
          Caption = 'Protocolo'
          TabOrder = 0
          OnClick = ckProtocoloClick
        end
        object edtProtocol: TEdit
          Left = 84
          Top = 14
          Width = 149
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object btnBuscarChamado: TButton
        Left = 9
        Top = 54
        Width = 90
        Height = 21
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarChamadoClick
      end
      object DBGListChamados: TDBGrid
        Left = 8
        Top = 80
        Width = 414
        Height = 272
        DataSource = dmRentCar.dsQFunctions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGListChamadosCellClick
      end
      object DBNavigator1: TDBNavigator
        Left = 9
        Top = 357
        Width = 415
        Height = 25
        DataSource = dmRentCar.dsQFunctions
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 3
      end
    end
  end
end
