object frmCadVeiculos: TfrmCadVeiculos
  Left = 249
  Top = 234
  Width = 896
  Height = 371
  Caption = '@-RentCar - Cadastro de Ve'#237'culos'
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
  object gbCadVeiculo: TGroupBox
    Left = 10
    Top = 16
    Width = 455
    Height = 275
    Caption = 'Ve'#237'culos'
    TabOrder = 0
    object lblModelo: TLabel
      Left = 17
      Top = 27
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object lblAno: TLabel
      Left = 157
      Top = 25
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object lblMarca: TLabel
      Left = 16
      Top = 67
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object lblCor: TLabel
      Left = 155
      Top = 67
      Width = 16
      Height = 13
      Caption = 'Cor'
    end
    object lblPlaca: TLabel
      Left = 16
      Top = 111
      Width = 27
      Height = 13
      Caption = 'Placa'
    end
    object lblEspec: TLabel
      Left = 15
      Top = 155
      Width = 72
      Height = 13
      Caption = 'Especifica'#231#245'es'
    end
    object lblVlrVeiculos: TLabel
      Left = 295
      Top = 256
      Width = 156
      Height = 13
      Caption = 'Gerenciar Valores Ve'#237'culos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = lblVlrVeiculosClick
    end
    object DBEPlaca: TDBEdit
      Left = 16
      Top = 125
      Width = 71
      Height = 21
      DataField = 'Vel_Placa'
      DataSource = dmRentCar.dsCadVeiculo
      TabOrder = 0
    end
    object DBECor: TDBEdit
      Left = 155
      Top = 80
      Width = 98
      Height = 21
      DataField = 'Vel_Cor'
      DataSource = dmRentCar.dsCadVeiculo
      TabOrder = 1
      OnKeyPress = DBECorKeyPress
    end
    object DBEModelo: TDBEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      DataField = 'Vel_Modelo'
      DataSource = dmRentCar.dsCadVeiculo
      TabOrder = 2
      OnKeyPress = DBEModeloKeyPress
    end
    object DBEMarca: TDBEdit
      Left = 16
      Top = 83
      Width = 121
      Height = 21
      DataField = 'Vel_Marca'
      DataSource = dmRentCar.dsCadVeiculo
      TabOrder = 3
      OnKeyPress = DBEMarcaKeyPress
    end
    object DBREspec: TDBRichEdit
      Left = 14
      Top = 170
      Width = 273
      Height = 89
      DataField = 'Vel_Espec'
      DataSource = dmRentCar.dsCadVeiculo
      Enabled = False
      TabOrder = 4
    end
    object btnCarregar: TButton
      Left = 334
      Top = 144
      Width = 108
      Height = 25
      Caption = 'Carregar Foto'
      TabOrder = 5
      OnClick = btnCarregarClick
    end
    object DBImgVeic: TDBImage
      Left = 336
      Top = 32
      Width = 105
      Height = 105
      DataField = 'Vel_Img'
      DataSource = dmRentCar.dsCadVeiculo
      Stretch = True
      TabOrder = 6
    end
    object DateAno: TDateTimePicker
      Left = 156
      Top = 40
      Width = 49
      Height = 21
      Date = 40149.664795277780000000
      Format = 'yyyy'
      Time = 40149.664795277780000000
      DateMode = dmUpDown
      TabOrder = 7
      OnKeyPress = DateAnoKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 472
    Top = 22
    Width = 409
    Height = 264
    DataSource = dmRentCar.dsCadVeiculo
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnSalvar: TButton
    Left = 91
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnAlterar: TButton
    Left = 168
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 246
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object btnLimpar: TButton
    Left = 321
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btnLimparClick
  end
  object btnConsultar: TButton
    Left = 395
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Consultar'
    TabOrder = 6
    OnClick = btnConsultarClick
  end
  object btnSair: TButton
    Left = 469
    Top = 304
    Width = 71
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
    OnClick = btnSairClick
  end
  object btnCadastrar: TButton
    Left = 11
    Top = 304
    Width = 70
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 8
    OnClick = btnCadastrarClick
  end
  object OpenPicture: TOpenPictureDialog
    InitialDir = 
      'C:\Documents and Settings\Alan\Meus documentos\Alain\Projetos\@-' +
      'rentcar\@-RentCar\Imagens'
    Left = 314
    Top = 24
  end
end