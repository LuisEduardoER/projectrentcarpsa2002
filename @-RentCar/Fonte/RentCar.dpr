program RentCar;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {frmCadClientes},
  UBCliente in 'UBCliente.pas' {frmConsultaClientes},
  UCadVeiculo in 'UCadVeiculo.pas' {frmCadVeiculos},
  UDMRentCar in 'UDMRentCar.pas' {dmRentCar: TDataModule},
  UGerVlrVeiculo in 'UGerVlrVeiculo.pas' {frmRentCarVlrVeiculos},
  UChamado in 'UChamado.pas' {frmRentCarAberturaChamado},
  UTiposChamados in 'UTiposChamados.pas' {frmRentCarTiposChamados},
  URentCarPrincipal in 'URentCarPrincipal.pas' {frmRentCarPrincipal},
  cep in 'cep.pas',
  ULocacao in 'ULocacao.pas' {frmLocacao},
  URelVelDisp in 'URelVelDisp.pas' {frmRelVelDisp},
  URelVelAlugados in 'URelVelAlugados.pas' {frmRelVelAlugados},
  UContrato in 'UContrato.pas' {frmContratoLocacao},
  UAcesso in 'UAcesso.pas' {frmAcesso},
  UCadUsuario in 'UCadUsuario.pas' {frmCadUsuarios},
  MsgEditor in 'MsgEditor.pas' {frmMessageEditor},
  UListContato in 'UListContato.pas' {frmListContatos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
  Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
  Application.CreateForm(TfrmAcesso, frmAcesso);
  Application.CreateForm(TdmRentCar, dmRentCar);
  Application.Run;
end.
