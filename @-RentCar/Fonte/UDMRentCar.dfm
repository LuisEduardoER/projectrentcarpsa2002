object dmRentCar: TdmRentCar
  OldCreateOrder = False
  Left = 200
  Top = 169
  Height = 326
  Width = 284
  object ZRentCar: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'localhost'
    Port = 0
    Database = '@RentCar'
    User = 'root'
    AutoCommit = False
    ReadOnly = True
    TransactIsolationLevel = tiNone
    Connected = True
    SQLHourGlass = False
    Left = 22
    Top = 8
  end
  object ZTCadVeiculo: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_veiculo'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 80
    Top = 8
    object ZTCadVeiculoVel_id: TLargeintField
      FieldName = 'Vel_id'
      Visible = False
    end
    object ZTCadVeiculoVel_Placa: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'Vel_Placa'
      EditMask = 'LLL-9999;1;_'
      Size = 8
    end
    object ZTCadVeiculoVel_Cor: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'Vel_Cor'
      Size = 10
    end
    object ZTCadVeiculoVel_Ano: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'Vel_Ano'
    end
    object ZTCadVeiculoVel_Espec: TMemoField
      DisplayLabel = 'Espec'
      FieldName = 'Vel_Espec'
      Visible = False
      BlobType = ftMemo
    end
    object ZTCadVeiculoVel_Modelo: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'Vel_Modelo'
      Size = 10
    end
    object ZTCadVeiculoVel_Img: TBlobField
      FieldName = 'Vel_Img'
      Visible = False
    end
    object ZTCadVeiculoVel_Marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'Vel_Marca'
    end
  end
  object ZTChamado: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_chamado'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 128
    Top = 8
    object ZTChamadoCh_id: TLargeintField
      FieldName = 'Ch_id'
    end
    object ZTChamadoRentCar_PesFis_PesFis_id: TLargeintField
      FieldName = 'RentCar_PesFis_PesFis_id'
      Required = True
    end
    object ZTChamadoCh_TipoCh: TStringField
      FieldName = 'Ch_TipoCh'
      Size = 15
    end
    object ZTChamadoCh_DescCh: TMemoField
      FieldName = 'Ch_DescCh'
      BlobType = ftMemo
    end
    object ZTChamadoCh_Protocol: TLargeintField
      FieldName = 'Ch_Protocol'
    end
    object ZTChamadoCh_HoraCh: TTimeField
      FieldName = 'Ch_HoraCh'
    end
    object ZTChamadoCh_DataCh: TDateField
      FieldName = 'Ch_DataCh'
    end
  end
  object ZTPessoa: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_pessoa'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 192
    Top = 8
    object ZTPessoaPes_id: TLargeintField
      DisplayLabel = 'Id'
      FieldName = 'Pes_id'
      Visible = False
    end
    object ZTPessoaRentCar_Enderecos_End_Id: TLargeintField
      FieldName = 'RentCar_Enderecos_End_Id'
      Required = True
      Visible = False
    end
    object ZTPessoaPes_Nome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'Pes_Nome'
      Size = 100
    end
    object ZTPessoaPes_TelRes: TStringField
      DisplayLabel = 'TelRes'
      FieldName = 'Pes_TelRes'
      EditMask = '!\(999\)0000-0000;1;_'
      Size = 15
    end
    object ZTPessoaPes_Cel: TStringField
      DisplayLabel = 'TelCel'
      FieldName = 'Pes_Cel'
      EditMask = '!\(999\)0000-0000;1;_'
      Size = 15
    end
    object ZTPessoaPes_TelOp: TStringField
      DisplayLabel = 'TelOp'
      FieldName = 'Pes_TelOp'
      EditMask = '!\(999\)0000-0000;1;_'
      Size = 15
    end
    object ZTPessoaPes_Email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'Pes_Email'
      Size = 30
    end
  end
  object dsCadVeiculo: TDataSource
    DataSet = ZTCadVeiculo
    Left = 88
    Top = 24
  end
  object dsTChamado: TDataSource
    Left = 144
    Top = 24
  end
  object dsTPessoa: TDataSource
    DataSet = ZTPessoa
    Left = 208
    Top = 24
  end
  object ZTPesFis: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_pesfis'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 8
    Top = 88
    object ZTPesFisPesFis_id: TLargeintField
      FieldName = 'PesFis_id'
    end
    object ZTPesFisRentCar_Pessoa_Pes_id: TLargeintField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Required = True
    end
    object ZTPesFisPesFis_RG: TStringField
      FieldName = 'PesFis_RG'
      Size = 15
    end
    object ZTPesFisPesFis_CPF: TStringField
      FieldName = 'PesFis_CPF'
      Size = 15
    end
    object ZTPesFisPesFis_Sexo: TStringField
      FieldName = 'PesFis_Sexo'
      Size = 1
    end
    object ZTPesFisPesFis_Tipo: TStringField
      FieldName = 'PesFis_Tipo'
      Size = 1
    end
    object ZTPesFisPesFis_EstCivil: TStringField
      FieldName = 'PesFis_EstCivil'
      Size = 1
    end
    object ZTPesFisPesFis_CNH: TStringField
      FieldName = 'PesFis_CNH'
    end
    object ZTPesFisPesFis_Validade: TDateField
      FieldName = 'PesFis_Validade'
    end
  end
  object dsTPesFis: TDataSource
    DataSet = ZTPesFis
    Left = 24
    Top = 104
  end
  object ZTPesJu: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_pesju'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 72
    Top = 88
    object ZTPesJuPesJu_id: TLargeintField
      FieldName = 'PesJu_id'
    end
    object ZTPesJuRentCar_Pessoa_Pes_id: TLargeintField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Required = True
    end
    object ZTPesJuPesJu_CNPJ: TStringField
      FieldName = 'PesJu_CNPJ'
    end
    object ZTPesJuPesJu_NmFantasia: TStringField
      FieldName = 'PesJu_NmFantasia'
      Size = 30
    end
    object ZTPesJuPesJu_RazaoSocial: TStringField
      FieldName = 'PesJu_RazaoSocial'
    end
  end
  object dsTPesJu: TDataSource
    DataSet = ZTPesJu
    Left = 88
    Top = 104
  end
  object ZTGerVal: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_ger_valores'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 136
    Top = 88
    object ZTGerValGerVal_id: TLargeintField
      FieldName = 'GerVal_id'
    end
    object ZTGerValRentCar_Veiculo_Vel_id: TLargeintField
      FieldName = 'RentCar_Veiculo_Vel_id'
      Required = True
    end
    object ZTGerValGerVal_ValAlu: TLargeintField
      FieldName = 'GerVal_ValAlu'
      DisplayFormat = '0.00'
    end
    object ZTGerValGerVal_ValAPag: TLargeintField
      FieldName = 'GerVal_ValAPag'
    end
    object ZTGerValGerVal_TipoPag: TStringField
      FieldName = 'GerVal_TipoPag'
      Size = 1
    end
  end
  object dsTGerVal: TDataSource
    DataSet = ZTGerVal
    Left = 152
    Top = 104
  end
  object ZTEndereco: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_enderecos'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 200
    Top = 88
    object ZTEnderecoEnd_Id: TLargeintField
      FieldName = 'End_Id'
    end
    object ZTEnderecoEnd_Cidade: TStringField
      FieldName = 'End_Cidade'
      Size = 30
    end
    object ZTEnderecoEnd_Endereco: TStringField
      FieldName = 'End_Endereco'
      Size = 50
    end
    object ZTEnderecoEnd_Bairro: TStringField
      FieldName = 'End_Bairro'
    end
    object ZTEnderecoEnd_Estado: TStringField
      FieldName = 'End_Estado'
      Size = 2
    end
    object ZTEnderecoEnd_CEP: TStringField
      FieldName = 'End_CEP'
      Size = 15
    end
    object ZTEnderecoEnd_Num: TLargeintField
      FieldName = 'End_Num'
    end
  end
  object dsTEndereco: TDataSource
    DataSet = ZTEndereco
    Left = 216
    Top = 104
  end
  object ZQCliente: TZQuery
    Connection = ZRentCar
    CachedUpdates = False
    RequestLive = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 16
    Top = 168
  end
  object dsQCliente: TDataSource
    DataSet = ZQCliente
    Left = 32
    Top = 200
  end
  object ZTAlugar: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_alugar'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 88
    Top = 168
    object ZTAlugarAlu_id: TLargeintField
      FieldName = 'Alu_id'
    end
    object ZTAlugarRentCar_PesFis_PesFis_id: TLargeintField
      FieldName = 'RentCar_PesFis_PesFis_id'
      Required = True
    end
    object ZTAlugarRentCar_Ger_Valores_GerVal_id: TLargeintField
      FieldName = 'RentCar_Ger_Valores_GerVal_id'
      Required = True
    end
    object ZTAlugarRentCar_Veiculo_Vel_id: TLargeintField
      FieldName = 'RentCar_Veiculo_Vel_id'
      Required = True
    end
    object ZTAlugarAlu_Reserva: TStringField
      FieldName = 'Alu_Reserva'
      Size = 1
    end
  end
  object dsTAlugar: TDataSource
    DataSet = ZTAlugar
    Left = 104
    Top = 184
  end
  object dsQAlugar: TDataSource
    DataSet = ZQAlugar
    Left = 176
    Top = 200
  end
  object ZQAlugar: TZQuery
    Connection = ZRentCar
    CachedUpdates = False
    RequestLive = False
    SQL.Strings = (
      'Select rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img'
      'from rentcar_veiculo, rentcar_alugar'
      
        'where rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Ve' +
        'l_id')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 160
    Top = 168
    object ZQAlugarVel_Espec: TMemoField
      FieldName = 'Vel_Espec'
      BlobType = ftMemo
    end
    object ZQAlugarVel_Img: TBlobField
      FieldName = 'Vel_Img'
    end
  end
  object ZQFunctions: TZQuery
    Connection = ZRentCar
    CachedUpdates = False
    RequestLive = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 216
    Top = 168
  end
  object dsQFunctions: TDataSource
    DataSet = ZQFunctions
    Left = 232
    Top = 200
  end
end
