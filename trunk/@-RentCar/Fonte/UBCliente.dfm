object frmConsultaClientes: TfrmConsultaClientes
  Left = 316
  Top = 237
  Width = 479
  Height = 397
  Caption = '@-RentCar - Consulta Clientes'
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
  object DBGrid1: TDBGrid
    Left = 14
    Top = 125
    Width = 427
    Height = 215
    DataSource = dmRentCar.dsQCliente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object gbFiltros: TGroupBox
    Left = 13
    Top = 8
    Width = 425
    Height = 77
    TabOrder = 1
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
      Height = 17
      Caption = 'CPF/CNPJ'
      TabOrder = 1
      OnClick = ckCPFCNPJClick
    end
    object edtNome: TEdit
      Left = 85
      Top = 14
      Width = 329
      Height = 21
      TabOrder = 2
    end
    object mkCPFCNPJ: TMaskEdit
      Left = 85
      Top = 45
      Width = 85
      Height = 21
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '   .   .   -  '
    end
  end
  object btnBuscar: TButton
    Left = 14
    Top = 93
    Width = 81
    Height = 21
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
end
