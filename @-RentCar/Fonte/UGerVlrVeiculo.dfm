object frmRentCarVlrVeiculos: TfrmRentCarVlrVeiculos
  Left = 454
  Top = 300
  Width = 303
  Height = 162
  Caption = '@-RentCar - Valores Ve'#237'culos'
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
  object DBTMarca: TDBText
    Left = 208
    Top = 16
    Width = 65
    Height = 17
    DataField = 'Vel_Marca'
    DataSource = dmRentCar.dsCadVeiculo
  end
  object DBTModelo: TDBText
    Left = 64
    Top = 16
    Width = 65
    Height = 17
    DataField = 'Vel_Modelo'
    DataSource = dmRentCar.dsCadVeiculo
  end
  object lblModelo: TLabel
    Left = 16
    Top = 16
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object lblMarca: TLabel
    Left = 168
    Top = 16
    Width = 30
    Height = 13
    Caption = 'Marca'
  end
  object lblVlr: TLabel
    Left = 90
    Top = 45
    Width = 62
    Height = 13
    Caption = 'Valor Aluguel'
  end
  object DBEVlrVeiculo: TDBEdit
    Left = 91
    Top = 60
    Width = 83
    Height = 21
    DataField = 'GerVal_ValAlu'
    DataSource = dmRentCar.dsTGerVal
    TabOrder = 0
  end
  object btnAlterar: TButton
    Left = 99
    Top = 96
    Width = 70
    Height = 25
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object btnCadastrar: TButton
    Left = 19
    Top = 96
    Width = 70
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastrarClick
  end
  object btnSair: TButton
    Left = 181
    Top = 96
    Width = 70
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
end
