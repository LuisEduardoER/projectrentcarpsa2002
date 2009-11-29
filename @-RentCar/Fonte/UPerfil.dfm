object frmPerfil: TfrmPerfil
  Left = 270
  Top = 203
  Width = 568
  Height = 258
  Caption = '@-RentCar - Perfil'
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
  object DBTEspec: TDBText
    Left = 186
    Top = 126
    Width = 65
    Height = 17
  end
  object DBTNome: TDBText
    Left = 186
    Top = 78
    Width = 65
    Height = 17
  end
  object lblNome: TLabel
    Left = 186
    Top = 62
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label1: TLabel
    Left = 186
    Top = 110
    Width = 72
    Height = 13
    Caption = 'Especifica'#231#245'es'
  end
  object DBImgPerfil: TDBImage
    Left = 25
    Top = 44
    Width = 152
    Height = 133
    TabOrder = 0
  end
  object DBNPerfil: TDBNavigator
    Left = 25
    Top = 183
    Width = 152
    Height = 25
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 1
  end
end
