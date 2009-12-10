object frmPerfil: TfrmPerfil
  Left = 353
  Top = 293
  Width = 487
  Height = 211
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
    Left = 154
    Top = 78
    Width = 311
    Height = 17
    DataField = 'Vel_Espec'
    DataSource = dsQFunctions
  end
  object Label1: TLabel
    Left = 154
    Top = 62
    Width = 72
    Height = 13
    Caption = 'Especifica'#231#245'es'
  end
  object DBNPerfil: TDBNavigator
    Left = 11
    Top = 147
    Width = 152
    Height = 25
    DataSource = dsQFunctions
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 0
  end
  object DBImgPerfil: TDBImage
    Left = 32
    Top = 36
    Width = 105
    Height = 105
    DataField = 'Vel_Img'
    DataSource = dsQFunctions
    Stretch = True
    TabOrder = 1
  end
  object ZQFunctions: TZQuery
    Connection = dmRentCar.ZRentCar
    CachedUpdates = False
    RequestLive = True
    SQL.Strings = (
      'select Vel_Img, Vel_Espec from rentcar_veiculo'
      
        'inner join rentcar_alugar on rentcar_veiculo.Vel_id = rentcar_al' +
        'ugar.RentCar_Veiculo_Vel_id '
      
        'inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_alu' +
        'gar.RentCar_Pessoa_Pes_id '
      
        'inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_i' +
        'd = rentcar_pessoa.Pes_id')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 200
    object ZQFunctionsVel_Img: TBlobField
      FieldName = 'Vel_Img'
    end
    object ZQFunctionsVel_Espec: TStringField
      FieldName = 'Vel_Espec'
      Size = 60
    end
  end
  object dsQFunctions: TDataSource
    DataSet = ZQFunctions
    Left = 232
  end
end
