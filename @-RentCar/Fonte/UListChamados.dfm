object frmListChamados: TfrmListChamados
  Left = 275
  Top = 183
  Width = 528
  Height = 449
  Caption = '@-RentCar - Listagem de Chamados'
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
  object DBGListChamados: TDBGrid
    Left = 10
    Top = 90
    Width = 503
    Height = 289
    DataSource = dmRentCar.dsQFunctions
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGListChamadosCellClick
  end
  object gbFiltros: TGroupBox
    Left = 10
    Top = 7
    Width = 503
    Height = 43
    TabOrder = 1
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
  object btnBuscar: TButton
    Left = 11
    Top = 59
    Width = 90
    Height = 21
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 384
    Width = 505
    Height = 25
    DataSource = dmRentCar.dsQFunctions
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 3
  end
end