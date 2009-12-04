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
    ZTCadVeiculoVel_id: TLargeintField;
    ZTCadVeiculoVel_Placa: TStringField;
    ZTCadVeiculoVel_Cor: TStringField;
    ZTCadVeiculoVel_Ano: TIntegerField;
    ZTCadVeiculoVel_Modelo: TStringField;
    ZTCadVeiculoVel_Img: TBlobField;
    ZTCadVeiculoVel_Marca: TStringField;
    ZTPessoaPes_id: TLargeintField;
    ZTPessoaRentCar_Enderecos_End_Id: TLargeintField;
    ZTPessoaPes_TelRes: TStringField;
    ZTPessoaPes_Cel: TStringField;
    ZTPessoaPes_TelOp: TStringField;
    ZTPesFisPesFis_id: TLargeintField;
    ZTPesFisRentCar_Pessoa_Pes_id: TLargeintField;
    ZTPesFisPesFis_RG: TStringField;
    ZTPesFisPesFis_CPF: TStringField;
    ZTPesFisPesFis_Tipo: TStringField;
    ZTPessoaPes_Email: TStringField;
    ZTPesFisPesFis_CNH: TStringField;
    ZTPesFisPesFis_Validade: TDateField;
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
    ZTAcessoAc_id: TLargeintField;
    ZTAcessoRentCar_PesFis_PesFis_id: TLargeintField;
    ZTAcessoAc_Login: TStringField;
    ZTAcessoAc_Senha: TIntegerField;
    ZTAcessoAc_Perfil: TStringField;
    ZTPesFisPesFis_Login: TStringField;
    ZTPesFisPesFis_Senha: TStringField;
    ZTPesFisPesFis_Nome: TStringField;
    ZTCadVeiculoVel_Espec: TStringField;
    ZTAlugarAlu_id: TIntegerField;
    ZTAlugarRentCar_Pessoa_Pes_id: TIntegerField;
    ZTAlugarRentCar_Ger_Valores_GerVal_id: TIntegerField;
    ZTAlugarRentCar_Veiculo_Vel_id: TIntegerField;
    ZTChamadoCh_id: TLargeintField;
    ZTChamadoRentCar_Pessoa_Pes_id: TLargeintField;
    ZTChamadoCh_TipoCh: TStringField;
    ZTChamadoCh_DescCh: TMemoField;
    ZTChamadoCh_Protocol: TLargeintField;
    ZTChamadoCh_HoraCh: TTimeField;
    ZTChamadoCh_DataCh: TDateField;
    ZTChamadoCh_Status: TStringField;
    ZTGerValGerVal_id: TIntegerField;
    ZTGerValRentCar_Veiculo_Vel_id: TIntegerField;
    ZTGerValGerVal_ValAlu: TLargeintField;
    ZTGerValGerVal_ValAPag: TLargeintField;
    ZTPesFisPesFis_Sexo: TStringField;
    ZTPesFisPesFis_EstCivil: TStringField;
    ZTAlugarPerInicialLoc: TDateField;
    ZTAlugarPerFinalLoc: TDateField;
    ZTAlugarDataReserva: TDateField;
    ZTGerValGerVal_TipoPag: TStringField;
    ZTPesJuPesJu_id: TIntegerField;
    ZTPesJuRentCar_Pessoa_Pes_id: TIntegerField;
    ZTPesJuPesJu_CNPJ: TStringField;
    ZTPesJuPesJu_NmFantasia: TStringField;
    ZTPesJuPesJu_RazaoSocial: TStringField;
    ZTCadVeiculoVel_StatusLoc: TStringField;
    ZTCadVeiculoVel_StatusRes: TStringField;
    ZTEnderecoEnd_Id: TIntegerField;
    ZTEnderecoEnd_Cidade: TStringField;
    ZTEnderecoEnd_Endereco: TStringField;
    ZTEnderecoEnd_Bairro: TStringField;
    ZTEnderecoEnd_Estado: TStringField;
    ZTEnderecoEnd_CEP: TStringField;
    ZTEnderecoEnd_Num: TIntegerField;
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
