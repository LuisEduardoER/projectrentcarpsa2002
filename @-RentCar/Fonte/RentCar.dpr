program RentCar;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {frmCadClientes},
  UCadVeiculo in 'UCadVeiculo.pas' {frmCadVeiculos},
  UDMRentCar in 'UDMRentCar.pas' {dmRentCar: TDataModule},
  UGerVlrVeiculo in 'UGerVlrVeiculo.pas' {frmRentCarVlrVeiculos},
  UChamado in 'UChamado.pas' {frmRentCarAberturaChamado},
  URentCarPrincipal in 'URentCarPrincipal.pas' {frmRentCarPrincipal},
  cep in 'cep.pas',
  ULocacao in 'ULocacao.pas' {frmLocacao},
  URelVelAlugados in 'URelVelAlugados.pas' {frmRelVel},
  UContrato in 'UContrato.pas' {frmContratoLocacao},
  UAcesso in 'UAcesso.pas' {frmAcesso},
  UCadUsuario in 'UCadUsuario.pas' {frmCadUsuarios},
  UPerfil in 'UPerfil.pas' {frmPerfil},
  URelCliPesFis in 'URelCliPesFis.pas' {frmRelCliPesFis},
  URelCliPesJu in 'URelCliPesJu.pas' {frmRelCliPesJu},
  UCadAcessorios in 'UCadAcessorios.pas' {frmAcessorios},
  UConsultas in 'UConsultas.pas' {frmConsultas},
  UGerar in 'UGerar.pas' {frmGerar},
  UCapImage in 'UCapImage.pas' {frmCapImage};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAcesso, frmAcesso);
  Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
  Application.CreateForm(TdmRentCar, dmRentCar);
  Application.Run;
end.
