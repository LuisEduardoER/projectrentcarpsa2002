object frmCadUsuarios: TfrmCadUsuarios
  Left = 200
  Top = 172
  Width = 411
  Height = 326
  Caption = '@-RentCar - Cadastro Usu'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
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
    Width = 385
    Height = 21
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 10
    Top = 124
    Width = 121
    Height = 113
    ItemHeight = 13
    Items.Strings = (
      'Administrador'
      'Funcion'#225'rio')
    TabOrder = 1
  end
  object DBESenha: TDBEdit
    Left = 10
    Top = 73
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object DBListBox1: TDBListBox
    Left = 201
    Top = 123
    Width = 121
    Height = 113
    ItemHeight = 13
    TabOrder = 3
  end
  object btnCadastar: TButton
    Left = 11
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
  end
  object btnSalvar: TButton
    Left = 98
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
  end
  object btnAlterar: TButton
    Left = 185
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 6
  end
  object btnSair: TButton
    Left = 276
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
    OnClick = btnSairClick
  end
  object btnAdd: TButton
    Left = 140
    Top = 144
    Width = 49
    Height = 25
    Caption = '>>'
    TabOrder = 8
  end
  object btnRet: TButton
    Left = 140
    Top = 192
    Width = 49
    Height = 25
    Caption = '<<'
    TabOrder = 9
  end
end
