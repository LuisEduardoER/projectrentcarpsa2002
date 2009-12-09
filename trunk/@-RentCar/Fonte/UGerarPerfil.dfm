object frmGerarPerfil: TfrmGerarPerfil
  Left = 392
  Top = 319
  Width = 397
  Height = 160
  Caption = '@-RentCar - Gerar Perfil'
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
  object gbFiltros: TGroupBox
    Left = 24
    Top = 8
    Width = 330
    Height = 54
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object btnB: TButton
      Left = 245
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 0
      OnClick = btnBClick
    end
    object DBLookupCliente: TDBLookupComboBox
      Left = 6
      Top = 24
      Width = 227
      Height = 21
      DataField = 'RentCar_Pessoa_Pes_id'
      TabOrder = 1
    end
  end
  object btnGerarPerfil: TButton
    Left = 109
    Top = 70
    Width = 131
    Height = 22
    Caption = 'Gerar Perfil'
    TabOrder = 1
    OnClick = btnGerarPerfilClick
  end
  object pbPerfil: TProgressBar
    Left = 3
    Top = 104
    Width = 385
    Height = 17
    Step = 1
    TabOrder = 2
  end
end
