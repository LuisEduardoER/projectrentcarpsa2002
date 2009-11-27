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
    ZTCadVeiculoVel_Espec: TMemoField;
    ZTCadVeiculoVel_Modelo: TStringField;
    ZTCadVeiculoVel_Img: TBlobField;
    ZTCadVeiculoVel_Marca: TStringField;
    ZTPessoaPes_id: TLargeintField;
    ZTPessoaRentCar_Enderecos_End_Id: TLargeintField;
    ZTPessoaPes_Nome: TStringField;
    ZTPessoaPes_TelRes: TStringField;
    ZTPessoaPes_Cel: TStringField;
    ZTPessoaPes_TelOp: TStringField;
    ZTPesFisPesFis_id: TLargeintField;
    ZTPesFisRentCar_Pessoa_Pes_id: TLargeintField;
    ZTPesFisPesFis_RG: TStringField;
    ZTPesFisPesFis_CPF: TStringField;
    ZTPesFisPesFis_Sexo: TStringField;
    ZTPesFisPesFis_Tipo: TStringField;
    ZTGerValGerVal_id: TLargeintField;
    ZTGerValRentCar_Veiculo_Vel_id: TLargeintField;
    ZTGerValGerVal_ValAlu: TLargeintField;
    ZTGerValGerVal_ValAPag: TLargeintField;
    ZTGerValGerVal_TipoPag: TStringField;
    ZTPesFisPesFis_EstCivil: TStringField;
    ZTPessoaPes_Email: TStringField;
    ZTPesFisPesFis_CNH: TStringField;
    ZTPesFisPesFis_Validade: TDateField;
    ZTPesJuPesJu_id: TLargeintField;
    ZTPesJuRentCar_Pessoa_Pes_id: TLargeintField;
    ZTPesJuPesJu_CNPJ: TStringField;
    ZTPesJuPesJu_NmFantasia: TStringField;
    ZTPesJuPesJu_RazaoSocial: TStringField;
    ZTEndereco: TZTable;
    dsTEndereco: TDataSource;
    ZTEnderecoEnd_Id: TLargeintField;
    ZTEnderecoEnd_Cidade: TStringField;
    ZTEnderecoEnd_Endereco: TStringField;
    ZTEnderecoEnd_Bairro: TStringField;
    ZTEnderecoEnd_Estado: TStringField;
    ZTEnderecoEnd_CEP: TStringField;
    ZQCliente: TZQuery;
    dsQCliente: TDataSource;
    ZTChamadoCh_id: TLargeintField;
    ZTChamadoRentCar_PesFis_PesFis_id: TLargeintField;
    ZTChamadoCh_TipoCh: TStringField;
    ZTChamadoCh_DescCh: TMemoField;
    ZTChamadoCh_Protocol: TLargeintField;
    ZTChamadoCh_HoraCh: TTimeField;
    ZTChamadoCh_DataCh: TDateField;
    ZTAlugar: TZTable;
    ZTAlugarAlu_id: TLargeintField;
    ZTAlugarRentCar_PesFis_PesFis_id: TLargeintField;
    ZTAlugarRentCar_Ger_Valores_GerVal_id: TLargeintField;
    ZTAlugarRentCar_Veiculo_Vel_id: TLargeintField;
    dsTAlugar: TDataSource;
    dsQAlugar: TDataSource;
    ZQAlugar: TZQuery;
    ZQAlugarVel_Espec: TMemoField;
    ZQAlugarVel_Img: TBlobField;
    ZTAlugarAlu_Reserva: TStringField;
    ZQFunctions: TZQuery;
    dsQFunctions: TDataSource;
    ZTEnderecoEnd_Num: TLargeintField;
    ZTAcesso: TZTable;
    dsAcesso: TDataSource;
    ZTAcessoAc_id: TLargeintField;
    ZTAcessoRentCar_PesFis_PesFis_id: TLargeintField;
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
