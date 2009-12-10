object frmConsultaVeiculos: TfrmConsultaVeiculos
  Left = 330
  Top = 188
  Width = 460
  Height = 392
  Caption = '@-RentCar - Consulta Veiculos '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object gbFiltros: TGroupBox
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
  object btnBuscar: TButton
    Left = 14
    Top = 99
    Width = 81
    Height = 21
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object DBGBVec: TDBGrid
    Left = 13
    Top = 128
    Width = 417
    Height = 215
    DataSource = dmRentCar.dsCadVeiculo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGBVecCellClick
  end
end
