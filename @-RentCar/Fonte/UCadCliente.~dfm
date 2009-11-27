object frmCadClientes: TfrmCadClientes
  Left = 288
  Top = 167
  Width = 733
  Height = 533
  Caption = '@-RentCar - Cadastro de Clientes'
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
  object pgcClientes: TPageControl
    Left = 16
    Top = 8
    Width = 697
    Height = 233
    ActivePage = tsDadosPJ
    TabOrder = 0
    object tsDadosPF: TTabSheet
      Caption = 'Dados Pessoais'
      object lblNome: TLabel
        Left = 5
        Top = 12
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object lblCPF: TLabel
        Left = 5
        Top = 50
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object lblRG: TLabel
        Left = 145
        Top = 49
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object lblCNH: TLabel
        Left = 6
        Top = 146
        Width = 23
        Height = 13
        Caption = 'CNH'
      end
      object lblValidade: TLabel
        Left = 142
        Top = 146
        Width = 41
        Height = 13
        Caption = 'Validade'
      end
      object Label1: TLabel
        Left = 186
        Top = 102
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object lblResCPFCNPJ: TLabel
        Left = 6
        Top = 90
        Width = 90
        Height = 13
        Caption = 'lblResCPFCNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBENome: TDBEdit
        Left = 5
        Top = 25
        Width = 345
        Height = 21
        DataField = 'Pes_Nome'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 0
        OnKeyPress = DBENomeKeyPress
      end
      object DBECPF: TDBEdit
        Left = 5
        Top = 66
        Width = 124
        Height = 21
        DataField = 'PesFis_CPF'
        DataSource = dmRentCar.dsTPesFis
        MaxLength = 11
        TabOrder = 1
        OnKeyPress = DBECPFKeyPress
      end
      object DBERG: TDBEdit
        Left = 145
        Top = 65
        Width = 118
        Height = 21
        DataField = 'PesFis_RG'
        DataSource = dmRentCar.dsTPesFis
        TabOrder = 2
        OnKeyPress = DBERGKeyPress
      end
      object dbrgSexo: TDBRadioGroup
        Left = 5
        Top = 106
        Width = 172
        Height = 33
        Caption = 'Sexo'
        Columns = 2
        DataField = 'PesFis_Sexo'
        DataSource = dmRentCar.dsTPesFis
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 3
      end
      object DBECNH: TDBEdit
        Left = 6
        Top = 162
        Width = 121
        Height = 21
        DataField = 'PesFis_CNH'
        DataSource = dmRentCar.dsTPesFis
        TabOrder = 4
        OnKeyPress = DBECNHKeyPress
      end
      object DateValidade: TDateTimePicker
        Left = 142
        Top = 160
        Width = 105
        Height = 21
        Date = 40134.891749305560000000
        Time = 40134.891749305560000000
        TabOrder = 5
      end
      object DBCBEstCivil: TDBComboBox
        Left = 185
        Top = 117
        Width = 104
        Height = 21
        Style = csDropDownList
        DataField = 'PesFis_EstCivil'
        DataSource = dmRentCar.dsTPesFis
        ItemHeight = 13
        Items.Strings = (
          'Casado(a)'
          'Solteiro(a)'
          'Vi'#250'vo(a)'
          'Divorciado(a)')
        TabOrder = 6
        OnKeyPress = DBCBEstCivilKeyPress
      end
    end
    object tsDadosPJ: TTabSheet
      Caption = 'Dados Pessoais'
      ImageIndex = 3
      object Label2: TLabel
        Left = 5
        Top = 12
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label3: TLabel
        Left = 5
        Top = 106
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label5: TLabel
        Left = 5
        Top = 60
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object lblResCNPJ: TLabel
        Left = 6
        Top = 147
        Width = 67
        Height = 13
        Caption = 'lblResCNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBENmFant: TDBEdit
        Left = 5
        Top = 25
        Width = 345
        Height = 21
        DataField = 'PesJu_NmFantasia'
        DataSource = dmRentCar.dsTPesJu
        TabOrder = 0
        OnKeyPress = DBENmFantKeyPress
      end
      object DBECNPJ: TDBEdit
        Left = 5
        Top = 122
        Width = 124
        Height = 21
        DataField = 'PesJu_CNPJ'
        DataSource = dmRentCar.dsTPesJu
        TabOrder = 1
      end
      object DBERzSocial: TDBEdit
        Left = 5
        Top = 73
        Width = 345
        Height = 21
        DataField = 'PesJu_RazaoSocial'
        DataSource = dmRentCar.dsTPesJu
        TabOrder = 2
        OnKeyPress = DBERzSocialKeyPress
      end
    end
    object tsEndereco: TTabSheet
      Caption = 'Endereco'
      ImageIndex = 4
      object lblCEP: TLabel
        Left = 4
        Top = 4
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object DBECEP: TDBEdit
        Left = 4
        Top = 17
        Width = 121
        Height = 21
        DataField = 'End_CEP'
        DataSource = dmRentCar.dsTEndereco
        TabOrder = 0
      end
      object btnBuscar: TButton
        Left = 140
        Top = 15
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarClick
      end
      object gbEndereco: TGroupBox
        Left = 0
        Top = 40
        Width = 681
        Height = 164
        TabOrder = 2
        object lblEndereco: TLabel
          Left = 8
          Top = 7
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object lblBairro: TLabel
          Left = 7
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object lblCidade: TLabel
          Left = 6
          Top = 87
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object lblEstado: TLabel
          Left = 6
          Top = 124
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object lblNumero: TLabel
          Left = 441
          Top = 10
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object DBEndereco: TDBEdit
          Left = 8
          Top = 23
          Width = 425
          Height = 21
          DataField = 'End_Endereco'
          DataSource = dmRentCar.dsTEndereco
          TabOrder = 0
        end
        object DBEBairro: TDBEdit
          Left = 7
          Top = 62
          Width = 217
          Height = 21
          DataField = 'End_Bairro'
          DataSource = dmRentCar.dsTEndereco
          TabOrder = 1
        end
        object DBECidade: TDBEdit
          Left = 6
          Top = 100
          Width = 217
          Height = 21
          DataField = 'End_Cidade'
          DataSource = dmRentCar.dsTEndereco
          TabOrder = 2
        end
        object DBCBEstado: TDBComboBox
          Left = 6
          Top = 140
          Width = 49
          Height = 21
          DataField = 'End_Estado'
          DataSource = dmRentCar.dsTEndereco
          ItemHeight = 13
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          TabOrder = 3
        end
        object DBENumero: TDBEdit
          Left = 441
          Top = 25
          Width = 49
          Height = 21
          DataField = 'End_Num'
          DataSource = dmRentCar.dsTEndereco
          TabOrder = 4
        end
      end
    end
    object tsContato: TTabSheet
      Caption = 'Contato'
      ImageIndex = 5
      object lblTelefone: TLabel
        Left = 8
        Top = 14
        Width = 100
        Height = 13
        Caption = 'Telefone Residencial'
      end
      object lblCelular: TLabel
        Left = 8
        Top = 64
        Width = 32
        Height = 13
        Caption = 'Celular'
      end
      object lblEmail: TLabel
        Left = 185
        Top = 64
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object lblTelOp: TLabel
        Left = 184
        Top = 14
        Width = 87
        Height = 13
        Caption = 'Telefone Opcional'
      end
      object DBTelRes: TDBEdit
        Left = 8
        Top = 30
        Width = 113
        Height = 21
        DataField = 'Pes_TelRes'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 0
      end
      object DBCel: TDBEdit
        Left = 8
        Top = 78
        Width = 113
        Height = 21
        DataField = 'Pes_Cel'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 1
      end
      object DBEmail: TDBEdit
        Left = 185
        Top = 78
        Width = 273
        Height = 21
        DataField = 'Pes_Email'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 2
      end
      object DBTelOp: TDBEdit
        Left = 184
        Top = 27
        Width = 121
        Height = 21
        DataField = 'Pes_TelOp'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 3
      end
    end
  end
  object btnSalvar: TButton
    Left = 127
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnAlterar: TButton
    Left = 214
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 303
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object btnLimpar: TButton
    Left = 391
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = btnLimparClick
  end
  object btnConsultar: TButton
    Left = 479
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 5
    OnClick = btnConsultarClick
  end
  object btnSair: TButton
    Left = 567
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btnSairClick
  end
  object DBGClientes: TDBGrid
    Left = 23
    Top = 284
    Width = 697
    Height = 201
    DataSource = dmRentCar.dsTPessoa
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnCadastar: TButton
    Left = 40
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 8
    OnClick = btnCadastarClick
  end
  object HTTCEP: THTTPRIO
    WSDLLocation = 'http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?wsdl'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 360
  end
end
