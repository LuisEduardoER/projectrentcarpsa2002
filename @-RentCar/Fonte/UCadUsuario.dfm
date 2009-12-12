object frmCadUsuarios: TfrmCadUsuarios
  Left = 405
  Top = 244
  Width = 364
  Height = 260
  Caption = '@-RentCar - Cadastro Usu'#225'rios'
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
  object btnCadastar: TButton
    Left = 9
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 0
    OnClick = btnCadastarClick
  end
  object btnSalvar: TButton
    Left = 96
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnAlterar: TButton
    Left = 183
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnSair: TButton
    Left = 274
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
  object gbUsuarios: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 177
    Enabled = False
    TabOrder = 4
    object lblAdicionarPerfil: TLabel
      Left = 11
      Top = 108
      Width = 87
      Height = 13
      Caption = 'Adicionar Perfil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 10
      Top = 59
      Width = 37
      Height = 13
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPessoa: TLabel
      Left = 10
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Pessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBRGPerfil: TDBRadioGroup
      Left = 11
      Top = 120
      Width = 185
      Height = 33
      Columns = 2
      DataField = 'Ac_Perfil'
      DataSource = dmRentCar.dsAcesso
      Items.Strings = (
        'Administrador'
        'Funcionario')
      TabOrder = 0
      Values.Strings = (
        'A'
        'F')
    end
    object DBESenha: TDBEdit
      Left = 10
      Top = 73
      Width = 145
      Height = 21
      DataField = 'Ac_Senha'
      DataSource = dmRentCar.dsAcesso
      TabOrder = 1
    end
    object DBLookupCBPessoa: TDBLookupComboBox
      Left = 10
      Top = 32
      Width = 253
      Height = 21
      DataField = 'RentCar_PesFis_PesFis_id'
      DataSource = dmRentCar.dsAcesso
      KeyField = 'Pes_id'
      ListField = 'PesFis_nome'
      ListSource = dmRentCar.dsQFunctions
      TabOrder = 2
      OnClick = DBLookupCBPessoaClick
    end
  end
end
