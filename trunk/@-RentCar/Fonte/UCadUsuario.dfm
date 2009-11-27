object frmCadUsuarios: TfrmCadUsuarios
  Left = 261
  Top = 177
  Width = 363
  Height = 232
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
  object DBLookupCBPessoa: TDBLookupComboBox
    Left = 10
    Top = 32
    Width = 253
    Height = 21
    KeyField = 'Pes_id'
    ListField = 'Pes_nome'
    ListSource = dmRentCar.dsQFunctions
    TabOrder = 0
    OnClick = DBLookupCBPessoaClick
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
  object btnCadastar: TButton
    Left = 9
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastarClick
  end
  object btnSalvar: TButton
    Left = 96
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnAlterar: TButton
    Left = 183
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnSair: TButton
    Left = 274
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
    OnClick = btnSairClick
  end
  object cbPerfil: TComboBox
    Left = 8
    Top = 128
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'Administrador'
      'Cliente')
  end
end
