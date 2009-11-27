object frmRentCarTiposChamados: TfrmRentCarTiposChamados
  Left = 443
  Top = 305
  Width = 439
  Height = 318
  Caption = '@-RentCar- Tipos Solicita'#231#245'es'
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
  object DBListSolicitacoes: TDBListBox
    Left = 8
    Top = 61
    Width = 161
    Height = 217
    ItemHeight = 13
    TabOrder = 0
  end
  object DBListSolicitacoesChamados: TDBListBox
    Left = 248
    Top = 59
    Width = 161
    Height = 217
    ItemHeight = 13
    TabOrder = 1
  end
  object btnII: TButton
    Left = 181
    Top = 131
    Width = 49
    Height = 25
    Caption = '<'
    TabOrder = 2
  end
  object btnI: TButton
    Left = 181
    Top = 90
    Width = 49
    Height = 25
    Caption = '<<'
    TabOrder = 3
  end
  object btnIII: TButton
    Left = 182
    Top = 172
    Width = 49
    Height = 25
    Caption = '>>'
    TabOrder = 4
  end
  object btnIV: TButton
    Left = 183
    Top = 215
    Width = 49
    Height = 25
    Caption = '>'
    TabOrder = 5
  end
  object gbSolicitacao: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 42
    Caption = 'Solicita'#231#227'o'
    TabOrder = 6
    object DBESolicitacao: TDBEdit
      Left = 6
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object btnInserir: TButton
      Left = 206
      Top = 12
      Width = 50
      Height = 25
      Caption = 'Inserir'
      TabOrder = 1
    end
    object btnAlterar: TButton
      Left = 263
      Top = 12
      Width = 50
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
    end
    object btnExcluir: TButton
      Left = 322
      Top = 12
      Width = 50
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
end
