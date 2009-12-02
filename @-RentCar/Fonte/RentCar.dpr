program RentCar;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {frmCadClientes},
  UBCliente in 'UBCliente.pas' {frmConsultaClientes},
  UCadVeiculo in 'UCadVeiculo.pas' {frmCadVeiculos},
  UDMRentCar in 'UDMRentCar.pas' {dmRentCar: TDataModule},
  UGerVlrVeiculo in 'UGerVlrVeiculo.pas' {frmRentCarVlrVeiculos},
  UChamado in 'UChamado.pas' {frmRentCarAberturaChamado},
  URentCarPrincipal in 'URentCarPrincipal.pas' {frmRentCarPrincipal},
  cep in 'cep.pas',
  ULocacao in 'ULocacao.pas' {frmLocacao},
  URelVelDisp in 'URelVelDisp.pas' {frmRelVelDisp},
  URelVelAlugados in 'URelVelAlugados.pas' {frmRelVelAlugados},
  UContrato in 'UContrato.pas' {frmContratoLocacao},
  UAcesso in 'UAcesso.pas' {frmAcesso},
  UCadUsuario in 'UCadUsuario.pas' {frmCadUsuarios},
  MsgEditor in 'MsgEditor.pas' {frmMessageEditor},
  URelVelRes in 'URelVelRes.pas' {frmRelVelRes},
  UContraoPesJu in 'UContraoPesJu.pas' {frmContratoLocacaoPesJu},
  UPerfil in 'UPerfil.pas' {frmPerfil},
  UGerarPerfil in 'UGerarPerfil.pas' {frmGerarPerfil},
  UListChamados in 'UListChamados.pas' {frmListChamados};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
  Application.CreateForm(TfrmGerarPerfil, frmGerarPerfil);
  Application.CreateForm(TfrmAcesso, frmAcesso);
  Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
  Application.CreateForm(TdmRentCar, dmRentCar);
  Application.CreateForm(TfrmRelVelRes, frmRelVelRes);
  Application.CreateForm(TfrmContratoLocacaoPesJu, frmContratoLocacaoPesJu);
  Application.CreateForm(TfrmPerfil, frmPerfil);
  Application.CreateForm(TfrmListChamados, frmListChamados);
  Application.Run;
end.
