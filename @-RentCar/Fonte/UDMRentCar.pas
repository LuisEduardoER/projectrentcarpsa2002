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
    ZTAlugarAlu_id: TIntegerField;
    ZTAlugarRentCar_Pessoa_Pes_id: TIntegerField;
    ZTAlugarRentCar_Ger_Valores_GerVal_id: TIntegerField;
    ZTAlugarRentCar_Veiculo_Vel_id: TIntegerField;
    ZTGerValGerVal_id: TIntegerField;
    ZTGerValRentCar_Veiculo_Vel_id: TIntegerField;
    ZTGerValGerVal_ValAlu: TLargeintField;
    ZTGerValGerVal_ValAPag: TLargeintField;
    ZTAlugarPerInicialLoc: TDateField;
    ZTAlugarPerFinalLoc: TDateField;
    ZTAlugarDataReserva: TDateField;
    ZTGerValGerVal_TipoPag: TStringField;
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
    ZTChamadoCh_DescCh: TMemoField;
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
