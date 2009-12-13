unit UDMRentCar;

interface

uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset;

type
  TdmRentCar = class(TDataModule)
    ZRentCar: TZConnection;
    ZTCadVeiculo: TZTable;
    ZTChamado: TZTable;
    ZTPessoa: TZTable;
    dsCadVeiculo: TDataSource;
    dsTChamado: TDataSource;
    dsTPessoa: TDataSource;
    ZTPesFis: TZTable;
    dsTPesFis: TDataSource;
    ZTPesJu: TZTable;
    dsTPesJu: TDataSource;
    ZTGerVal: TZTable;
    dsTGerVal: TDataSource;
    ZTEndereco: TZTable;
    dsTEndereco: TDataSource;
    ZQCliente: TZQuery;
    dsQCliente: TDataSource;
    ZTAlugar: TZTable;
    dsTAlugar: TDataSource;
    dsQAlugar: TDataSource;
    ZQAlugar: TZQuery;
    ZQFunctions: TZQuery;
    dsQFunctions: TDataSource;
    ZTAcesso: TZTable;
    dsAcesso: TDataSource;
    ZTPesJuPesJu_id: TIntegerField;
    ZTPesJuRentCar_Pessoa_Pes_id: TIntegerField;
    ZTPesJuPesJu_CNPJ: TStringField;
    ZTPesJuPesJu_NmFantasia: TStringField;
    ZTPesJuPesJu_RazaoSocial: TStringField;
    ZTEnderecoEnd_Id: TIntegerField;
    ZTEnderecoEnd_Cidade: TStringField;
    ZTEnderecoEnd_Endereco: TStringField;
    ZTEnderecoEnd_Bairro: TStringField;
    ZTEnderecoEnd_Estado: TStringField;
    ZTEnderecoEnd_CEP: TStringField;
    ZTEnderecoEnd_Num: TIntegerField;
    ZTPessoaPes_id: TIntegerField;
    ZTPessoaRentCar_Enderecos_End_Id: TIntegerField;
    ZTPessoaPes_TelRes: TStringField;
    ZTPessoaPes_Cel: TStringField;
    ZTPessoaPes_TelOp: TStringField;
    ZTPessoaPes_Email: TStringField;
    ZTCadVeiculoVel_id: TIntegerField;
    ZTCadVeiculoVel_Placa: TStringField;
    ZTCadVeiculoVel_Cor: TStringField;
    ZTCadVeiculoVel_Ano: TIntegerField;
    ZTCadVeiculoVel_Espec: TStringField;
    ZTCadVeiculoVel_Modelo: TStringField;
    ZTCadVeiculoVel_Img: TBlobField;
    ZTCadVeiculoVel_Marca: TStringField;
    ZTCadVeiculoVel_StatusLoc: TStringField;
    ZTCadVeiculoVel_StatusRes: TStringField;
    ZTChamadoCh_id: TIntegerField;
    ZTChamadoRentCar_Pessoa_Pes_id: TIntegerField;
    ZTChamadoCh_TipoCh: TStringField;
    ZTChamadoCh_Protocol: TIntegerField;
    ZTChamadoCh_HoraCh: TTimeField;
    ZTChamadoCh_DataCh: TDateField;
    ZTChamadoCh_Status: TStringField;
    ZTPesFisPesFis_id: TIntegerField;
    ZTPesFisRentCar_Pessoa_Pes_id: TIntegerField;
    ZTPesFisPesFis_RG: TStringField;
    ZTPesFisPesFis_CPF: TStringField;
    ZTPesFisPesFis_Sexo: TStringField;
    ZTPesFisPesFis_Tipo: TStringField;
    ZTPesFisPesFis_EstCivil: TStringField;
    ZTPesFisPesFis_CNH: TStringField;
    ZTPesFisPesFis_Validade: TDateField;
    ZTPesFisPesFis_Login: TStringField;
    ZTPesFisPesFis_Senha: TStringField;
    ZTPesFisPesFis_Nome: TStringField;
    ZTAcessoAc_id: TIntegerField;
    ZTAcessoRentCar_PesFis_PesFis_id: TIntegerField;
    ZTAcessoAc_Login: TStringField;
    ZTAcessoAc_Senha: TIntegerField;
    ZTAcessoAc_Perfil: TStringField;
    ZTChamadoCh_DescCh: TMemoField;
    ZTAcessorios: TZTable;
    dsTAcessorios: TDataSource;
    ZTTipoAcessorios: TZTable;
    dsTTipoAcessorios: TDataSource;
    ZTAcessoriosAcessorio_id: TIntegerField;
    ZTAcessoriosRentCar_TipoAcessorios_TipoAcessorio_Id: TIntegerField;
    ZTAcessoriosRentCar_Veiculo_Vel_id: TIntegerField;
    ZTPesFisPesFis_DtNascimento: TDateField;
    ZTAlugarAlu_id: TIntegerField;
    ZTAlugarRentCar_Pessoa_Pes_id: TIntegerField;
    ZTAlugarRentCar_TabelaPrecos_GerVal_id: TIntegerField;
    ZTAlugarRentCar_Veiculo_Vel_id: TIntegerField;
    ZTAlugarAlu_PerInicialLoc: TDateField;
    ZTAlugarAlu_PerFinalLoc: TDateField;
    ZTAlugarAlu_DataReserva: TDateField;
    ZTTipoAcessoriosTipoAcessorio_Id: TIntegerField;
    ZTTipoAcessoriosAcessrio: TIntegerField;
    ZTPessoaPes_Img: TBlobField;
    ZTPesJuRentCar_PesFis_PesFis_id: TIntegerField;
    ZTGerValGerVal_id: TIntegerField;
    ZTGerValRentCar_Veiculo_Vel_id: TIntegerField;
    ZTGerValGerVal_ValAluDiaria: TFloatField;
    ZTGerValGerVal_ValAluMensal: TFloatField;
    ZTGerValGerVal_TipoPg: TStringField;
    ZTAlugarAlu_VlrTotalAPg: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRentCar: TdmRentCar;

implementation

{$R *.dfm}

end.
