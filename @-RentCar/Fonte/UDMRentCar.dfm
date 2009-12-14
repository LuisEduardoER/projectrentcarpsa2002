object dmRentCar: TdmRentCar
  OldCreateOrder = False
  Left = 200
  Top = 169
  Height = 389
  Width = 397
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
    object ZTCadVeiculoVel_id: TIntegerField
      FieldName = 'Vel_id'
      Visible = False
    end
    object ZTCadVeiculoVel_Placa: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'Vel_Placa'
      EditMask = 'LLL\-9999;1;_'
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
    object ZTCadVeiculoVel_Espec: TStringField
      DisplayLabel = 'Espec'
      FieldName = 'Vel_Espec'
      Size = 60
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
    object ZTCadVeiculoVel_StatusLoc: TStringField
      FieldName = 'Vel_StatusLoc'
      Visible = False
      Size = 1
    end
    object ZTCadVeiculoVel_StatusRes: TStringField
      FieldName = 'Vel_StatusRes'
      Visible = False
      Size = 1
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
    object ZTChamadoCh_id: TIntegerField
      FieldName = 'Ch_id'
      Visible = False
    end
    object ZTChamadoRentCar_Pessoa_Pes_id: TIntegerField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Visible = False
    end
    object ZTChamadoCh_TipoCh: TStringField
      DisplayLabel = 'TipoChamado'
      FieldName = 'Ch_TipoCh'
      Size = 30
    end
    object ZTChamadoCh_Protocol: TIntegerField
      DisplayLabel = 'Protocolo'
      FieldName = 'Ch_Protocol'
    end
    object ZTChamadoCh_HoraCh: TTimeField
      DisplayLabel = 'HoraChamado'
      FieldName = 'Ch_HoraCh'
    end
    object ZTChamadoCh_DataCh: TDateField
      DisplayLabel = 'DataChamado'
      FieldName = 'Ch_DataCh'
    end
    object ZTChamadoCh_Status: TStringField
      FieldName = 'Ch_Status'
      Visible = False
      Size = 1
    end
    object ZTChamadoCh_DescCh: TMemoField
      FieldName = 'Ch_DescCh'
      BlobType = ftMemo
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
    object ZTPessoaPes_id: TIntegerField
      FieldName = 'Pes_id'
      Visible = False
    end
    object ZTPessoaRentCar_Enderecos_End_Id: TIntegerField
      FieldName = 'RentCar_Enderecos_End_Id'
      Visible = False
    end
    object ZTPessoaPes_TelRes: TStringField
      DisplayLabel = 'TelRes.'
      FieldName = 'Pes_TelRes'
      EditMask = '(99)9999-9999;0;'
      Size = 15
    end
    object ZTPessoaPes_Cel: TStringField
      DisplayLabel = 'Cel.'
      FieldName = 'Pes_Cel'
      EditMask = '(99)9999-9999;0;'
      Size = 15
    end
    object ZTPessoaPes_TelOp: TStringField
      DisplayLabel = 'TelOp.'
      FieldName = 'Pes_TelOp'
      EditMask = '(99)9999-9999;0;'
      Size = 15
    end
    object ZTPessoaPes_Email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'Pes_Email'
      Size = 30
    end
    object ZTPessoaPes_Img: TBlobField
      FieldName = 'Pes_Img'
    end
  end
  object dsCadVeiculo: TDataSource
    DataSet = ZTCadVeiculo
    Left = 88
    Top = 24
  end
  object dsTChamado: TDataSource
    DataSet = ZTChamado
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
    object ZTPesFisPesFis_id: TIntegerField
      FieldName = 'PesFis_id'
      Visible = False
    end
    object ZTPesFisRentCar_Pessoa_Pes_id: TIntegerField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Visible = False
    end
    object ZTPesFisPesFis_RG: TStringField
      DisplayLabel = 'RG'
      FieldName = 'PesFis_RG'
      Size = 15
    end
    object ZTPesFisPesFis_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'PesFis_CPF'
      Size = 15
    end
    object ZTPesFisPesFis_Sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'PesFis_Sexo'
      Size = 15
    end
    object ZTPesFisPesFis_Tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'PesFis_Tipo'
      Visible = False
      Size = 1
    end
    object ZTPesFisPesFis_EstCivil: TStringField
      DisplayLabel = 'Est.Civil'
      FieldName = 'PesFis_EstCivil'
      Size = 15
    end
    object ZTPesFisPesFis_CNH: TStringField
      DisplayLabel = 'CNH'
      FieldName = 'PesFis_CNH'
    end
    object ZTPesFisPesFis_Validade: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'PesFis_Validade'
      Visible = False
    end
    object ZTPesFisPesFis_Login: TStringField
      FieldName = 'PesFis_Login'
      Visible = False
      Size = 15
    end
    object ZTPesFisPesFis_Senha: TStringField
      FieldName = 'PesFis_Senha'
      Visible = False
      Size = 10
    end
    object ZTPesFisPesFis_Nome: TStringField
      FieldName = 'PesFis_Nome'
      Size = 255
    end
    object ZTPesFisPesFis_DtNascimento: TDateField
      FieldName = 'PesFis_DtNascimento'
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
    object ZTPesJuPesJu_id: TIntegerField
      FieldName = 'PesJu_id'
      Visible = False
    end
    object ZTPesJuRentCar_Pessoa_Pes_id: TIntegerField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Visible = False
    end
    object ZTPesJuPesJu_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'PesJu_CNPJ'
    end
    object ZTPesJuPesJu_NmFantasia: TStringField
      DisplayLabel = 'Nm.Fantasia'
      FieldName = 'PesJu_NmFantasia'
      Size = 30
    end
    object ZTPesJuPesJu_RazaoSocial: TStringField
      DisplayLabel = 'RazaoSocial'
      FieldName = 'PesJu_RazaoSocial'
    end
    object ZTPesJuRentCar_PesFis_PesFis_id: TIntegerField
      FieldName = 'RentCar_PesFis_PesFis_id'
      Required = True
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
    TableName = 'rentcar_tabelaprecos'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 136
    Top = 88
    object ZTGerValGerVal_id: TIntegerField
      FieldName = 'GerVal_id'
    end
    object ZTGerValRentCar_Veiculo_Vel_id: TIntegerField
      FieldName = 'RentCar_Veiculo_Vel_id'
      Required = True
    end
    object ZTGerValGerVal_ValAluDiaria: TFloatField
      FieldName = 'GerVal_ValAluDiaria'
      currency = True
    end
    object ZTGerValGerVal_ValAluMensal: TFloatField
      FieldName = 'GerVal_ValAluMensal'
      currency = True
    end
    object ZTGerValGerVal_TipoPg: TStringField
      FieldName = 'GerVal_TipoPg'
      Size = 15
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
    object ZTEnderecoEnd_Id: TIntegerField
      FieldName = 'End_Id'
      Visible = False
    end
    object ZTEnderecoEnd_Cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'End_Cidade'
      Size = 30
    end
    object ZTEnderecoEnd_Endereco: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'End_Endereco'
      Size = 50
    end
    object ZTEnderecoEnd_Bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'End_Bairro'
    end
    object ZTEnderecoEnd_Estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'End_Estado'
      Size = 2
    end
    object ZTEnderecoEnd_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'End_CEP'
      Size = 15
    end
    object ZTEnderecoEnd_Num: TIntegerField
      DisplayLabel = 'Num'
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
    RequestLive = True
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
    object ZTAlugarAlu_id: TIntegerField
      FieldName = 'Alu_id'
    end
    object ZTAlugarRentCar_Pessoa_Pes_id: TIntegerField
      FieldName = 'RentCar_Pessoa_Pes_id'
      Required = True
    end
    object ZTAlugarRentCar_TabelaPrecos_GerVal_id: TIntegerField
      FieldName = 'RentCar_TabelaPrecos_GerVal_id'
      Required = True
    end
    object ZTAlugarRentCar_Veiculo_Vel_id: TIntegerField
      FieldName = 'RentCar_Veiculo_Vel_id'
      Required = True
    end
    object ZTAlugarAlu_PerInicialLoc: TDateField
      FieldName = 'Alu_PerInicialLoc'
    end
    object ZTAlugarAlu_PerFinalLoc: TDateField
      FieldName = 'Alu_PerFinalLoc'
    end
    object ZTAlugarAlu_DataReserva: TDateField
      FieldName = 'Alu_DataReserva'
    end
    object ZTAlugarAlu_VlrTotalAPg: TFloatField
      FieldName = 'Alu_VlrTotalAPg'
      currency = True
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
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 160
    Top = 168
  end
  object ZQFunctions: TZQuery
    Connection = ZRentCar
    CachedUpdates = False
    RequestLive = True
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
  object ZTAcesso: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_acesso'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 264
    Top = 88
    object ZTAcessoAc_id: TIntegerField
      FieldName = 'Ac_id'
    end
    object ZTAcessoRentCar_PesFis_PesFis_id: TIntegerField
      FieldName = 'RentCar_PesFis_PesFis_id'
    end
    object ZTAcessoAc_Login: TStringField
      FieldName = 'Ac_Login'
      Size = 15
    end
    object ZTAcessoAc_Senha: TIntegerField
      FieldName = 'Ac_Senha'
    end
    object ZTAcessoAc_Perfil: TStringField
      FieldName = 'Ac_Perfil'
      Size = 1
    end
  end
  object dsAcesso: TDataSource
    DataSet = ZTAcesso
    Left = 280
    Top = 104
  end
  object ZTAcessorios: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_acessorio'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 272
    Top = 8
    object ZTAcessoriosAcessorio_id: TIntegerField
      FieldName = 'Acessorio_id'
    end
    object ZTAcessoriosRentCar_TipoAcessorios_TipoAcessorio_Id: TIntegerField
      FieldName = 'RentCar_TipoAcessorios_TipoAcessorio_Id'
      Required = True
    end
    object ZTAcessoriosRentCar_Veiculo_Vel_id: TIntegerField
      FieldName = 'RentCar_Veiculo_Vel_id'
      Required = True
    end
  end
  object dsTAcessorios: TDataSource
    DataSet = ZTAcessorios
    Left = 288
    Top = 24
  end
  object ZTTipoAcessorios: TZTable
    Connection = ZRentCar
    CachedUpdates = False
    ReadOnly = False
    TableName = 'rentcar_tipoacessorios'
    ShowRecordTypes = [usUnmodified, usModified, usInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 280
    Top = 168
    object ZTTipoAcessoriosTipoAcessorio_Id: TIntegerField
      FieldName = 'TipoAcessorio_Id'
    end
    object ZTTipoAcessoriosAcessrio: TStringField
      FieldName = 'Acess'#243'rio'
      Size = 50
    end
  end
  object dsTTipoAcessorios: TDataSource
    DataSet = ZTTipoAcessorios
    Left = 296
    Top = 184
  end
end
