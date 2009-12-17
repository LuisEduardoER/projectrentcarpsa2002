object frmCadClientes: TfrmCadClientes
  Left = 237
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '@-RentCar - Cadastro de Clientes'
  ClientHeight = 475
  ClientWidth = 645
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
  object lblStatusCad: TLabel
    Left = 6
    Top = 213
    Width = 89
    Height = 16
    Caption = 'lblStatusCad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object pgcClientes: TPageControl
    Left = 5
    Top = 8
    Width = 628
    Height = 201
    ActivePage = tsDadosPF
    TabOrder = 0
    object tsDadosPF: TTabSheet
      Caption = 'Dados Pessoais'
      Enabled = False
      object lblNome: TLabel
        Left = 5
        Top = 1
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object lblCPF: TLabel
        Left = 5
        Top = 41
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object lblRG: TLabel
        Left = 145
        Top = 40
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object lblCNH: TLabel
        Left = 5
        Top = 126
        Width = 23
        Height = 13
        Caption = 'CNH'
      end
      object lblValidade: TLabel
        Left = 141
        Top = 126
        Width = 41
        Height = 13
        Caption = 'Validade'
      end
      object Label1: TLabel
        Left = 185
        Top = 79
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object lblResCPFCNPJ: TLabel
        Left = 6
        Top = 90
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 281
        Top = 39
        Width = 56
        Height = 13
        Caption = 'Nascimento'
      end
      object DBENome: TDBEdit
        Left = 5
        Top = 14
        Width = 345
        Height = 21
        DataField = 'PesFis_Nome'
        DataSource = dmRentCar.dsTPesFis
        TabOrder = 0
        OnKeyPress = DBENomeKeyPress
      end
      object DBECPF: TDBEdit
        Left = 5
        Top = 57
        Width = 108
        Height = 21
        DataField = 'PesFis_CPF'
        DataSource = dmRentCar.dsTPesFis
        MaxLength = 11
        TabOrder = 1
        OnExit = DBECPFExit
        OnKeyPress = DBECPFKeyPress
      end
      object DBERG: TDBEdit
        Left = 145
        Top = 56
        Width = 118
        Height = 21
        DataField = 'PesFis_RG'
        DataSource = dmRentCar.dsTPesFis
        TabOrder = 2
        OnKeyPress = DBERGKeyPress
      end
      object dbrgSexo: TDBRadioGroup
        Left = 4
        Top = 87
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
        Values.Strings = (
          'M'
          'F')
      end
      object DBECNH: TDBEdit
        Left = 5
        Top = 142
        Width = 121
        Height = 21
        DataField = 'PesFis_CNH'
        DataSource = dmRentCar.dsTPesFis
        MaxLength = 12
        TabOrder = 4
        OnExit = DBECNHExit
        OnKeyPress = DBECNHKeyPress
      end
      object DateValidade: TDateTimePicker
        Left = 141
        Top = 140
        Width = 105
        Height = 21
        Date = 40134.891749305560000000
        Time = 40134.891749305560000000
        TabOrder = 5
      end
      object DBCBEstCivil: TDBComboBox
        Left = 184
        Top = 94
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
      object DBImgCli: TDBImage
        Left = 496
        Top = 3
        Width = 95
        Height = 95
        DataField = 'Pes_Img'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 7
      end
      object btnCapImg: TButton
        Left = 470
        Top = 106
        Width = 138
        Height = 25
        Caption = 'Capturar Imagem'
        TabOrder = 8
        OnClick = btnCapImgClick
      end
      object DateNascimento: TDateTimePicker
        Left = 280
        Top = 56
        Width = 97
        Height = 21
        Date = 40160.609826388880000000
        Time = 40160.609826388880000000
        TabOrder = 9
        OnExit = DateNascimentoExit
        OnKeyPress = DateNascimentoKeyPress
      end
    end
    object tsDadosPJ: TTabSheet
      Caption = 'Dados Cadastrais'
      Enabled = False
      ImageIndex = 3
      object Label2: TLabel
        Left = 6
        Top = 3
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label3: TLabel
        Left = 5
        Top = 88
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label5: TLabel
        Left = 5
        Top = 45
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object lblResCNPJ: TLabel
        Left = 6
        Top = 147
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBENmFant: TDBEdit
        Left = 6
        Top = 16
        Width = 345
        Height = 21
        DataField = 'PesJu_NmFantasia'
        DataSource = dmRentCar.dsTPesJu
        TabOrder = 0
        OnKeyPress = DBENmFantKeyPress
      end
      object DBECNPJ: TDBEdit
        Left = 5
        Top = 104
        Width = 124
        Height = 21
        DataField = 'PesJu_CNPJ'
        DataSource = dmRentCar.dsTPesJu
        MaxLength = 14
        TabOrder = 1
        OnExit = DBECNPJExit
        OnKeyPress = DBECNPJKeyPress
      end
      object DBERzSocial: TDBEdit
        Left = 5
        Top = 58
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
      Enabled = False
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
        Width = 99
        Height = 21
        DataField = 'End_CEP'
        DataSource = dmRentCar.dsTEndereco
        MaxLength = 8
        TabOrder = 0
        OnKeyPress = DBECEPKeyPress
      end
      object btnBuscar: TButton
        Left = 108
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
        Width = 529
        Height = 97
        Enabled = False
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
          Left = 238
          Top = 47
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object lblEstado: TLabel
          Left = 462
          Top = 47
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object lblNumero: TLabel
          Left = 441
          Top = 8
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
          Enabled = False
          TabOrder = 1
        end
        object DBECidade: TDBEdit
          Left = 238
          Top = 60
          Width = 217
          Height = 21
          DataField = 'End_Cidade'
          DataSource = dmRentCar.dsTEndereco
          Enabled = False
          TabOrder = 2
        end
        object DBENumero: TDBEdit
          Left = 441
          Top = 23
          Width = 49
          Height = 21
          DataField = 'End_Num'
          DataSource = dmRentCar.dsTEndereco
          TabOrder = 3
        end
        object DBCBEstado: TDBComboBox
          Left = 462
          Top = 60
          Width = 45
          Height = 21
          DataField = 'End_Estado'
          DataSource = dmRentCar.dsTEndereco
          Enabled = False
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
          TabOrder = 4
          OnKeyPress = DBCBEstCivilKeyPress
        end
      end
    end
    object tsContato: TTabSheet
      Caption = 'Contato'
      Enabled = False
      ImageIndex = 5
      object lblTelefone: TLabel
        Left = 4
        Top = 4
        Width = 100
        Height = 13
        Caption = 'Telefone Residencial'
      end
      object lblCelular: TLabel
        Left = 4
        Top = 49
        Width = 32
        Height = 13
        Caption = 'Celular'
      end
      object lblEmail: TLabel
        Left = 156
        Top = 49
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object lblTelOp: TLabel
        Left = 155
        Top = 6
        Width = 87
        Height = 13
        Caption = 'Telefone Opcional'
      end
      object DBTelRes: TDBEdit
        Left = 4
        Top = 20
        Width = 113
        Height = 21
        DataField = 'Pes_TelRes'
        DataSource = dmRentCar.dsTPessoa
        MaxLength = 14
        TabOrder = 0
        OnExit = DBTelResExit
        OnKeyPress = DBTelResKeyPress
      end
      object DBCel: TDBEdit
        Left = 4
        Top = 63
        Width = 113
        Height = 21
        DataField = 'Pes_Cel'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 1
        OnExit = DBCelExit
        OnKeyPress = DBCelKeyPress
      end
      object DBEmail: TDBEdit
        Left = 156
        Top = 63
        Width = 273
        Height = 21
        DataField = 'Pes_Email'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 2
        OnExit = DBEmailExit
      end
      object DBTelOp: TDBEdit
        Left = 155
        Top = 19
        Width = 121
        Height = 21
        DataField = 'Pes_TelOp'
        DataSource = dmRentCar.dsTPessoa
        TabOrder = 3
        OnExit = DBTelOpExit
        OnKeyPress = DBTelOpKeyPress
      end
    end
  end
  object DBGClientes: TDBGrid
    Left = 6
    Top = 266
    Width = 631
    Height = 201
    DataSource = dmRentCar.dsQCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGClientesCellClick
  end
  object btnCadastrar: TBitBtn
    Left = 38
    Top = 235
    Width = 76
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastrarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECA8A8A8737373553F2A553F2A553F2A553F2A553F2A553F2A553F
      2A553F2A553F2AA7A7A7D8E9ECD8E9ECD8E9ECD8E9EC929292AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FF553F2AD8E9ECD8E9EC
      D8E9ECD8E9EC919191AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFF
      FF99F8FFAAFFFF553F2AD8E9ECD8E9ECD8E9ECD8E9EC919191AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FF553F2AD8E9ECD8E9EC
      D8E9ECD8E9EC909090AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFF
      FF99F8FFAAFFFF767676D8E9ECD8E9ECD8E9ECD8E9EC919191AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FF808080D8E9ECD8E9EC
      D8E9ECD8E9EC91919198F7FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFF
      FF99F8FFAAFFFF8D8D8DD8E9ECD8E9ECD8E9ECD8E9ECC1C1C1C1C1C198F7FFAA
      FFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FF9B9B9BD8E9ECD8E9EC
      EFAD00A377007F5B00EFAD00C1C1C198F7FF98F7FF98F7FF98F7FF98F7FF98F7
      FF98F7FF98F7FFA7A7A7D8E9ECD8E9EC7F5B00D9A77DD9A77D7F5B00C1C1C1C1
      C1C198F7FF98F7FF98F7FF98F7FF55DFFF55DFFF54BFD3737373EFAD00A27600
      A27600D9A77DD9A77DA377007F5B00EFAD00C1C1C198F7FF98F7FFB4B4B4A0A0
      A0737373737373B4B4B4AA7F00F6CF6DD9A77DD9A77DD9A77DD9A77DFF9F2A7F
      5B00C1C1C198F7FF98F7FFA1A1A1E6E6E6DADADADADADAB4B4B4AA7F00FFFFCB
      FFFFCBF6CF6DD9A77DF6CF6DF6CF6DA37700C1C1C198F7FF98F7FFA7A7A7AAFF
      FFE7E7E7B4B4B4D8E9ECF7D06CE5B726E2B629FFFF66F6CF6DAA7F00AA7F00F7
      CF6CD8E9ECAAFFFFE6E6E68D8D8DD8E9ECB4B4B4D8E9ECD8E9ECD8E9ECD8E9EC
      F1BF2BFFFF99FFFF99AA7F00B4B4B4CDCDCDC1C1C1B4B4B48D8D8D8D8D8DC1C1
      C1D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECF8D06DFFC82DFDC831F7CF6CD8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
  end
  object btnSalvar: TBitBtn
    Left = 126
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 3
    OnClick = btnGravarClick
    Glyph.Data = {
      06030000424D06030000000000003600000028000000100000000F0000000100
      180000000000D0020000120B0000120B00000000000000000000D8E9ECD8E9EC
      A7A7A77373737373735959595959594B4B4B4B4B4B3D3D3D3030303030303030
      30A7A7A7D8E9ECD8E9ECD8E9ECA7A7A7633600CDCDCDE6E6E6C1C1C1C1C1C1CD
      CDCDF0F0F0EDEDEDE6E6E6A7A7A7333333303030A7A7A7D8E9EC633600633600
      633600DADADAE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6DADADACB8C
      44633600303030303030633600CB8C44633600D9A77DD9A77DD9A77DD9A77DD9
      A77DCB8C44CB8C44CB8C44CB8C44CB8C446336007F5B00303030633600D9A77D
      633600D9A77DD9A77DD9A77DD9A77DD9A77DD9A77DCB8C44CB8C44CB8C44CB8C
      44633600CB8C44303030633600D9A77D633600D9A77DD9A77DD9A77DD9A77DD9
      A77DD9A77DD9A77DCB8C44CB8C44CB8C44633600CB8C443D3D3D633600D9A77D
      633600AA3F2A633600633600633600633600633600633600633600633600CB8C
      44633600CB8C444B4B4B633600D9A77D6336009A9A9AAAFFFF99F8FF99F8FF99
      F8FF99F8FF99F8FF99F8FF99F8FF633600633600CB8C444B4B4B633600D9A77D
      633600AAFFFFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FF633600CB8C444B4B4B633600D9A77D7F5B00AAFFFFAAFFFFAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FF7F5B00CB8C444B4B4B633600D9A77D
      7F5B00AAFFFFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FF7F5B00CB8C444B4B4B633600D9A77D989898AAFFFFAAFFFFAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FF989898CB8C44595959633600D9A77D
      A6A6A6D8E9ECCDCDCDCB8C44CB8C44A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FFA6A6A6D9A77D666666A7A7A76336007F5B00D8E9ECD8E9ECAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF7F5B00633600A7A7A7D8E9ECD8E9EC
      A7A7A76336006336006336006336006336006336006336006336006336006336
      009A9A9AD8E9ECD8E9EC}
  end
  object btnExcluir: TBitBtn
    Left = 302
    Top = 236
    Width = 79
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 4
    OnClick = btnExcluirClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000A8A8A8666666
      3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D
      3DA7A7A7D8E9ECD8E9EC66666655DFD43D3D3D55DFFF55DFFF55DFFF55DFFF55
      DFFF55DFD455DFFF55DFD455DFFF55C0D43D3D3DD8E9ECD8E9EC66666600F2FF
      55DFD43D3D3DA9FFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFD455DF
      FF55DFD43D3D3DD8E9EC73737354FFFF00F2FF55DFD43D3D3D3D3D3D3D3D3D3D
      3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D73737354FFFF
      54FFFF00F2FF55DFD400F2FF55DFD4FFFFFF98F7FF99F7FF98F7FF98F7FF98F7
      FF98F7FF98F7FFB4B4B4818181A9FFFF54FFFF54FFFF00F2FF55DFD4B4B4B4FF
      FFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFB4B4B481818154FFFF
      A9FFFF818181737373595959595959595959595959737373AAFFFF99F8FFAAFF
      FF99F8FFAAFFFF7676769A9A9AA9FFFF54FFFF818181005FFF001FFF001FFF00
      1FFF001FFF59595999F8FFAAFFFF99F8FFAAFFFF99F8FF7676769A9A9A54FFFF
      A9FFFF8181811D94F71D94F7005FFF001FFF001FFF595959AAFFFF99F8FFAAFF
      FF99F8FFAAFFFF818181A7A7A7A7A7A700F2FFA7A7A79A9A9A9A9A9A9A9A9A9A
      9A9A9A9A9AA7A7A799F8FFAAFFFF99F8FFAAFFFF99F8FF8E8E8ED8E9ECA7A7A7
      00F2FF00F2FF00F2FF00F2FFB4B4B4FFFFFFAAFFFFAAFFFFAAFFFF99F8FF55DF
      FF55DFFF55C0D49A9A9AD8E9EC9B9B9B54FFFF67F4FF67F4FF67F4FF919191FF
      FFFFAAFFFFAAFFFFAAFFFFB4B4B4A0A0A08D8D8D818181A7A7A7D8E9ECD8E9EC
      9B9B9B8D8D8D8D8D8DB4B4B4909090FFFFFFFFFFFFAAFFFFAAFFFFA1A1A1E6E6
      E6DADADADADADAB4B4B4D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC919191FF
      FFFFAAFFFFFFFFFFAAFFFFA7A7A7FFFFFFE7E7E7B4B4B4D8E9ECD8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9EC919191FFFFFFFFFFFFAAFFFFFFFFFF8D8D8DFFFF
      FFB4B4B4D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECB4B4B4A7
      A7A7A7A7A79A9A9A8E8E8E818181C1C1C1D8E9ECD8E9ECD8E9EC}
  end
  object btnCancelar: TBitBtn
    Left = 390
    Top = 235
    Width = 73
    Height = 25
    Hint = 'Cancelar altera'#231#227'o do registro'
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8808080B80000F800F8F800F8F800F8F800F8F800F8
      B80000B80000B80000B80000B80000F800F8F800F8F800F8F800F8F800F8B800
      00808080F800F8F800F8F800F8F800F8B80000B80000B80000B80000F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8B80000F800F8F800F8F800F8F800F8
      B80000B80000B80000F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8B80000F800F8F800F8F800F8F800F8B80000B80000F800F8B80000F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8B80000F800F8F800F8F800F8F800F8
      B80000F800F8F800F8F800F8B80000B80000F800F8F800F8F800F8F800F8B800
      00808080F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8B80000B80000B80000B80000808080F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8}
  end
  object BitBtn4: TBitBtn
    Left = 566
    Top = 235
    Width = 70
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = BitBtn4Click
    Glyph.Data = {
      EE030000424DEE03000000000000360000002800000012000000110000000100
      180000000000B8030000120B0000120B00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9EC8484848484848484848484
      84848484848484848484848484848484848484D8E9ECC6C6C6848484C6C6C6D8
      E9ECC6C6C6D8E9EC0000D8E9EC84848484848484848484848484848484848484
      8484848484848484848484848484FFFFFF848484FFFFFF848484FFFFFFD8E9EC
      0000D8E9ECA376007F5B007F5B007F5B004B4B4B4B4B4B848484848484848484
      FFFFFFFFFFFFFFFFFF7F5B007F5B007F5B00A37600D8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9EC7F5B00A37600A376004B4B4B4B4B4B848484FFFFFFFFFFFFFFFF
      FF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B
      00A37600A37600A376004B4B4BFFFFFFFFFFFFFFFFFFFFFFFF7F5B00D8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A3
      76004B4B4BFFFFFFFFFFFFFFFFFFFFFFFF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A376004B4B4BFFFFDF
      FFFF80F7EF70FFFF007F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9EC7F5B00A37600A37600A376004B4B4BFFFF80FFFF80FFFF80FFFF
      807F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B
      00A37600A37600A376004B4B4BFFFF80FFFF80FFFF80FFFF807F5B00D8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A3
      76004B4B4BFFFF00FFFF80FFFF80FFFFDF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9ECA376007F5B007F5B007F5B007F5B007F5B00
      7F5B007F5B007F5B00A37600D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9EC6F6F6F4B4B4B4B4B4B4B4B4B4B4B4B6F6F6FD8E9ECD8E9ECD8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC4B4B4B00
      DF0000DF0000DF0000DF004B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC6F6F6F4B4B4B4B4B4B4B4B4B
      4B4B4B6F6F6FD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000}
  end
  object btnProcurar: TBitBtn
    Left = 478
    Top = 235
    Width = 77
    Height = 25
    Hint = 'Procurar um registro'
    Caption = 'Procurar'
    TabOrder = 7
    OnClick = btnProcurarClick
    Glyph.Data = {
      22050000424D2205000000000000360000002800000014000000150000000100
      180000000000EC040000120B0000120B00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECA4A0A08080A0C0A0A0D8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
      E9ECD8E9EC80A0C04080C08080A0C0A0A0D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      EC80C0E040C0E04080C08080A0C0A0A0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      80C0E040C0E04080C08080A0C0A0A0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC80
      C0E040C0E04080C08080A0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC80C0
      E040C0E04080E0A4A0A0C0A0A0C0A080C0A080C0A080C0A080C0A0A0D8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC80C0E0
      D8E9ECC08080C0A080F0CAA6FFFFFFFFFFFFF0CAA6F0CAA6C0A0A0D8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC0A0A0C0
      A080F0CAA6F0CAA6FFFFFFFFFFFFFFFFFFFFFFFFF0CAA6C0A0A0D8E9ECD8E9EC
      D8E9ECD8E9EC800000800000804000800000800000D8E9ECC0A080F0CAA6F0CA
      A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CAA6C0A080D8E9ECD8E9EC804000C0
      400080400000A000004040C00000804000C00000C0A080F0CAA6F0CAA6F0CAA6
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A080D8E9ECC04000804000C0400000C0
      4000A00000A000804000804000804000C0A080F0CAA6F0CAA6F0CAA6FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC0A080D8E9ECC04000C06000C0400000A00080C0C0
      00A000004040C04000804000C0A0A0F0CAA6FFFFFFF0CAA6F0CAA6F0CAA6F0CA
      A6F0CAA6F0CAA6C0A080C04000C06000C0400000C04000A00080C0C0C0DCC000
      A000C06000C04000C0A0A0C0C0A0D8E9ECFFFFFFFFFFFFF0CAA6F0CAA6F0CAA6
      C0A080C0A0A0C06000C0400000C040C0DCC080C0C080A0C0C0DCC000A0000040
      40C04000804000C0A0A0C0A0A0F0CAA6FFFFFFF0CAA6F0CAA6C0A080C0A080D8
      E9ECC04000C0A000C0600000C04000FF0000FF0000A00080A0C0004040004040
      00404000A000C0A0A0C0A080C0A080C0A080C0A080C0A0A0D8E9ECD8E9ECC060
      00C0A000C06000C0A000C0A000C0A00000A00000404000FF0000404000C04000
      A00000A000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC0A000C06000
      C0A000C0A00000A00000A00000404000FF0080C0C000C04000FF0000C04000A0
      00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC0A000C0A00000
      A00000FF0000FF00FFFFFF80C0C000C04080C0C000C04000C040D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC06000C0A000C0A00000FF
      0000FF0000FF00FFFFFFFFFFFF00C04080A0C000A000D8E9ECD8E9ECD8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC06000C0A000C0A000FFFFFF
      FFFFFFC06000C06000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECC06000C06000C0A000C0
      6000C06000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC}
  end
  object btnAlterar: TBitBtn
    Left = 215
    Top = 236
    Width = 75
    Height = 25
    Caption = 'Alterar'
    Enabled = False
    TabOrder = 8
    OnClick = btnAlterarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
  end
  object HTTCEP: THTTPRIO
    WSDLLocation = 'http://www.byjg.com.br/xmlnuke-php/webservice.php/ws/cep?wsdl'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 360
  end
  object OpenPicture: TOpenPictureDialog
    Left = 314
    Top = 24
  end
end
