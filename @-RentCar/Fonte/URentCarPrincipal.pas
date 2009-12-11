unit URentCarPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, WinSkinData, StdCtrls, Buttons, pngimage,
  ExtCtrls;

type
  TfrmRentCarPrincipal = class(TForm)
    sbRentCar: TStatusBar;
    MenuRentCar: TMainMenu;
    Configuracoes: TMenuItem;
    Sair: TMenuItem;
    Administrativo1: TMenuItem;
    Usurios1: TMenuItem;
    Funcionarios1: TMenuItem;
    Relatorios: TMenuItem;
    LocVeiculos: TMenuItem;
    Chamados: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes: TMenuItem;
    PesFisica: TMenuItem;
    PesJuridica: TMenuItem;
    Veiculos: TMenuItem;
    AberturaChamados: TMenuItem;
    ChamadosEmEspera: TMenuItem;
    ChamadosFinalizados: TMenuItem;
    Reserva: TMenuItem;
    Locacao: TMenuItem;
    Fisica: TMenuItem;
    Juridica: TMenuItem;
    RelVeiculos: TMenuItem;
    Alugados: TMenuItem;
    Disponveis: TMenuItem;
    LocPesFis: TMenuItem;
    LocPesJu: TMenuItem;
    Reservados: TMenuItem;
    GerarPerfil1: TMenuItem;
    PFisica: TMenuItem;
    PJuridica: TMenuItem;
    ChPesFis: TMenuItem;
    ChPesJu: TMenuItem;
    Image1: TImage;
    Devolucao: TMenuItem;
    RelClientes: TMenuItem;
    RelCliPesFis: TMenuItem;
    RelCliPesJu: TMenuItem;
    Contratos: TMenuItem;
    ContratoLoc: TMenuItem;
    ContratoLocPesFis: TMenuItem;
    ContratoLocPesJu: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure FisicaClick(Sender: TObject);
    procedure JuridicaClick(Sender: TObject);
    procedure PesFisicaClick(Sender: TObject);
    procedure PesJuridicaClick(Sender: TObject);
    procedure VeiculosClick(Sender: TObject);
    procedure AlugadosClick(Sender: TObject);
    procedure DisponveisClick(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure LocPesFisClick(Sender: TObject);
    procedure LocPesJuClick(Sender: TObject);
    procedure ReservadosClick(Sender: TObject);
    procedure PFisicaClick(Sender: TObject);
    procedure PJuridicaClick(Sender: TObject);
    procedure ChPesFisClick(Sender: TObject);
    procedure ChPesJuClick(Sender: TObject);
    procedure ChamadosEmEsperaClick(Sender: TObject);
    procedure ChamadosFinalizadosClick(Sender: TObject);
    procedure DevolucaoClick(Sender: TObject);
    procedure RelCliPesFisClick(Sender: TObject);
    procedure RelCliPesJuClick(Sender: TObject);
    procedure ContratoLocPesFisClick(Sender: TObject);
    procedure ContratoLocPesJuClick(Sender: TObject);
  private
    { Private declarations }
  public
     tipo, veiculo, cli, perfil, chamado, contrato : string;
    { Public declarations }
  end;

var
  frmRentCarPrincipal: TfrmRentCarPrincipal;

implementation

uses UCadVeiculo, UDMRentCar, UCadCliente, ULocacao, UChamado, URelVelDisp,
  URelVelAlugados, UCadUsuario, URelVelRes, UGerarPerfil, UListChamados,
  URelCliPesFis, UContrato, UGerContratos, URelCliPesJu, UAcesso;

{$R *.dfm}

procedure TfrmRentCarPrincipal.FormShow(Sender: TObject);
begin
sbRentCar.Panels[0].Text := 'Usuario : '+ frmAcesso.edtLogin.Text;
sbRentCar.Panels[3].Text := DateToStr(date);
sbRentCar.Panels[2].Text := TimeToStr(now);
end;

procedure TfrmRentCarPrincipal.SairClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmRentCarPrincipal.FisicaClick(Sender: TObject);
begin
//chamada do formulário para a reserva de veículos - pessoa fisica
 //variavel que será usada para identificação na reserva do veículo
 veiculo := 'PFR';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTPessoa.Open;

 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsLocacao.Destroy;
 frmLocacao.tsDevolucao.Destroy;
 //o lookup irá carregar os dados referentes ao cadastro de pessoa fisica
 frmLocacao.DBLookupClienteRes.ListSource := dmRentCar.dsTPesFis;
 frmLocacao.DBLookupClienteRes.ListField := 'PesFis_Nome';
 frmLocacao.DBLookupClienteRes.KeyField := 'RentCar_Pessoa_Pes_id';
 frmLocacao.btnCadastar.Caption := 'Nova Reserva';
 frmLocacao.btnSalvar.Caption := 'Confirmar Reserva';
 frmLocacao.btnConsultarLoc.Enabled := False;
 frmLocacao.ShowModal;
 frmLocacao.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTGerVal.Close;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTPessoa.Close;


end;

procedure TfrmRentCarPrincipal.JuridicaClick(Sender: TObject);
begin
//chamada do formulário para a reserva de veículos - pessoa fisica
 //variavel que será usada para identificação na reserva do veículo
 veiculo := 'PJR';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 dmRentCar.ZTPesJu.Open;
 dmRentCar.ZTPessoa.Open;
 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsLocacao.Destroy;
 frmLocacao.tsDevolucao.Destroy;
// o lookup irá receber os dados do cadastro de pessoa juridica
 frmLocacao.DBLookupClienteRes.ListSource := dmRentCar.dsTPesJu;
 frmLocacao.DBLookupClienteRes.ListField := 'PesJu_NmFantasia';
 frmLocacao.DBLookupClienteRes.KeyField := 'RentCar_Pessoa_Pes_id';
 frmLocacao.btnCadastar.Caption := 'Nova Reserva';
 frmLocacao.btnSalvar.Caption := 'Confirmar Reserva';
 frmLocacao.btnConsultarLoc.Enabled := False;
 frmLocacao.ShowModal;
 frmLocacao.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTGerVal.Close;
 dmRentCar.ZTPesJu.Close;
 dmRentCar.ZTPessoa.Close;

end;

procedure TfrmRentCarPrincipal.PesFisicaClick(Sender: TObject);
begin
 tipo := 'PF';
 cli := 'cli';

 //rotina que carrega o formulário para o cadastro de clientes pessoa fisica
 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.Caption := '@-RentCar - Cadastro Clientes Pessoa Fisica';
 frmCadClientes.tsDadosPJ.Destroy;
 frmCadClientes.pgcClientes.ActivePage := frmCadClientes.tsDadosPF;
 frmCadClientes.ShowModal;
 frmCadClientes.Free;

end;

procedure TfrmRentCarPrincipal.PesJuridicaClick(Sender: TObject);
begin
 tipo := 'PJ';
 cli := 'cli';

  //rotina que carrega o formulário para o cadastro de clientes pessoa juridica
 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.Caption := '@-RentCar - Cadastro Clientes Pessoa Jurídica';
 frmCadClientes.tsDadosPF.Destroy;
 frmCadClientes.pgcClientes.ActivePage := frmCadClientes.tsDadosPJ;
 frmCadClientes.ShowModal;
 frmCadClientes.Free;

end;

procedure TfrmRentCarPrincipal.VeiculosClick(Sender: TObject);
begin
 //processoro para abrir a tabela necessária para o cadastro
 dmRentCar.ZTCadVeiculo.Open;
 //rotina que carrega o formulário para o cadastro de veiculos
 Application.CreateForm(TfrmCadVeiculos, frmCadVeiculos);
 frmCadVeiculos.ShowModal;
 frmCadVeiculos.Free;
  //fechando a tabela para não evitar que fique senddo carregada
 dmRentCar.ZTCadVeiculo.Close;
end;

procedure TfrmRentCarPrincipal.AlugadosClick(Sender: TObject);
begin
//rotina que executa a instrução sql para carregar o relatorio de veículos alugados
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select distinct rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img ');
    ZQAlugar.SQL.Add('from rentcar_veiculo ');
    ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Veiculo_Vel_id = rentcar_veiculo.Vel_id ');
    ZQAlugar.SQL.Add('and rentcar_veiculo.Vel_StatusLoc ="O" ');
    ZQAlugar.Open;

  if ZQAlugar.IsEmpty then
  Begin
    ShowMessage('Não Existem Veiculos Alugados');
  end else
  Begin
    Application.CreateForm(TfrmRelVelAlugados, frmRelVelAlugados);
    frmRelVelAlugados.QRVelAlugados.Preview;
    frmRelVelAlugados.Free;
    dmRentCar.ZQAlugar.Close;
  end;
  end;
end;

procedure TfrmRentCarPrincipal.DisponveisClick(Sender: TObject);
begin
//rotina que executa a instrução sql para carregar o relatorio de veículos disponíveis para locação
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select distinct rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img ');
    ZQAlugar.SQL.Add('from rentcar_veiculo ');
    ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Veiculo_Vel_id = rentcar_veiculo.Vel_id ');
    ZQAlugar.SQL.Add('and rentcar_veiculo.Vel_StatusLoc ="L" or rentcar_veiculo.Vel_StatusRes ="R"');
    ZQAlugar.Open;

  if ZQAlugar.IsEmpty then
  Begin
    ShowMessage('Não Existem Veiculos Disponíveis');
  end else
  Begin
    Application.CreateForm(TfrmRelVelDisp, frmRelVelDisp);
    frmRelVelDisp.QRVelDisp.Preview;
    frmRelVelDisp.Free;
    dmRentCar.ZQAlugar.Close;
  end;
  end;
end;

procedure TfrmRentCarPrincipal.Funcionarios1Click(Sender: TObject);
begin
//chamada do formulário para o cadastro de funcionario
 tipo := 'FUN';
 cli := 'FUN';

 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.Caption := '@-RentCar - Cadastro de Funcionários';
 frmCadClientes.tsDadosPJ.Destroy;
 frmCadClientes.pgcClientes.ActivePage := frmCadClientes.tsDadosPF;
 frmCadClientes.ShowModal;

  //fechar a tabela para evitar que fique sendo carregada na memória
 frmCadClientes.Free;
end;

procedure TfrmRentCarPrincipal.Usurios1Click(Sender: TObject);
begin
//chamada do formulário para o cadastro de usuários
  dmRentCar.ZTAcesso.Open;
  Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);
  frmCadUsuarios.ShowModal;
  frmCadUsuarios.Free;

 //fechar a tabela para evitar que fique sendo carregada na memória
  dmRentCar.ZTAcesso.Close;
end;

procedure TfrmRentCarPrincipal.LocPesFisClick(Sender: TObject);
begin
//chamada do formulário para a locação de veículos - pessoa fisica
 //variavel que será usada para identificação na locação do veículo
  veiculo := 'PFL';
  dmRentCar.ZTAlugar.Open;
  dmRentCar.ZTCadVeiculo.Open;
  dmRentCar.ZTGerVal.Open;
  dmRentCar.ZTPesFis.Open;
  dmRentCar.ZTPessoa.Open;
  Application.CreateForm(TfrmLocacao, frmLocacao);
  frmLocacao.tsReserva.Destroy;
  frmLocacao.tsDevolucao.Destroy;
  // o lookup irá receber os dados do cadastro de pessoa fisica
  frmLocacao.DBLookupCliente.ListSource := dmRentCar.dsTPesFis;
  frmLocacao.DBLookupCliente.ListField := 'PesFis_Nome';
  frmLocacao.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
  frmLocacao.btnCadastar.Caption := 'Nova Locacao';
  frmLocacao.btnSalvar.Caption := 'Confirmar Locacao';
  frmLocacao.ShowModal;
  frmLocacao.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
  dmRentCar.ZTCadVeiculo.Open;
  dmRentCar.ZTAlugar.Close;
  dmRentCar.ZTGerVal.Close;
  dmRentCar.ZTPesFis.Close;
  dmRentCar.ZTPessoa.Close;  
end;

procedure TfrmRentCarPrincipal.LocPesJuClick(Sender: TObject);
begin
//chamada do formulário para a locação de veículos - pessoa fisica
 //variavel que será usada para identificação na locação do veículo

 veiculo := 'PJL';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 dmRentCar.ZTPesJu.Open;
 dmRentCar.ZTPessoa.Open;
 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsReserva.Destroy;
 frmLocacao.tsDevolucao.Destroy;
 //o lookup irá receber os dados do cadastro de pessoa juridica
 frmLocacao.DBLookupCliente.ListSource := dmRentCar.dsTPesJu;
 frmLocacao.DBLookupCliente.ListField := 'PesJu_NmFantasia';
 frmLocacao.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
 frmLocacao.btnCadastar.Caption := 'Nova Locacao';
 frmLocacao.btnSalvar.Caption := 'Confirmar Locacao';
 frmLocacao.ShowModal;
 frmLocacao.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTGerVal.Close;
 dmRentCar.ZTPesJu.Close;
 dmRentCar.ZTPessoa.Close;

end;

procedure TfrmRentCarPrincipal.ReservadosClick(Sender: TObject);
begin
//rotina que executa a instrução sql para carregar o relatorio de veículos reservados
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select distinct rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img ');
    ZQAlugar.SQL.Add('from rentcar_veiculo ');
    ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Veiculo_Vel_id = rentcar_veiculo.Vel_id ');
    ZQAlugar.SQL.Add('and rentcar_veiculo.Vel_StatusRes="R" and rentcar_alugar.DataReserva <> ""');
    ZQAlugar.Open;

  if ZQAlugar.IsEmpty then
  Begin
    ShowMessage('Não Existem Veiculos Reservados');
  end else
  Begin
    Application.CreateForm(TfrmRelVelRes, frmRelVelRes);
    frmRelVelRes.QRVelRes.Preview;
    frmRelVelRes.Free;
    dmRentCar.ZQAlugar.Close;
  end;
  end;

end;

procedure TfrmRentCarPrincipal.PFisicaClick(Sender: TObject);
begin
//chamada do formulário para a geração do perfil dos veiuculos
//mais locados e reservados de determinado cliente pessoa fisica
 //variavel que será usada para identificação na geração do perfil
  perfil := 'F';
  dmRentCar.ZTPesFis.Open;
  Application.CreateForm(TfrmGerarPerfil, frmGerarPerfil);
  frmGerarPerfil.DBLookupCliente.ListSource := dmRentCar.dsTPesFis;
  frmGerarPerfil.DBLookupCliente.ListField := 'PesFis_Nome';
  frmGerarPerfil.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
  frmGerarPerfil.ShowModal;
  frmGerarPerfil.Free;
  
 //fechar a tabela para evitar que fique sendo carregada na memória
  dmRentCar.ZTPesFis.Close;
end;

procedure TfrmRentCarPrincipal.PJuridicaClick(Sender: TObject);
begin
//chamada do formulário para a geração do perfil dos veiuculos
//mais locados e reservados de determinado cliente pessoa juridica
 //variavel que será usada para identificação na geração do perfil
  perfil := 'J';
  dmRentCar.ZTPesJu.Open;
  Application.CreateForm(TfrmGerarPerfil, frmGerarPerfil);
  frmGerarPerfil.DBLookupCliente.ListSource := dmRentCar.dsTPesJu;
  frmGerarPerfil.DBLookupCliente.ListField := 'PesJu_NmFantasia';
  frmGerarPerfil.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
  frmGerarPerfil.ShowModal;
  frmGerarPerfil.Free;
  
   //fechar a tabela para evitar que fique sendo carregada na memória
  dmRentCar.ZTPesJu.Close;
end;

procedure TfrmRentCarPrincipal.ChPesFisClick(Sender: TObject);
begin
//chamada do formulário para a abertura dos chamados - pessoa fisica
 //variavel que será usada para identificação na abertura dos chamados
 chamado := 'F';
 dmRentCar.ZTChamado.Open;
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTPessoa.Open;
 Application.CreateForm(TfrmRentCarAberturaChamado, frmRentCarAberturaChamado);
 //o lookup irá receber os dados do cadastro de pessoa fisica
 frmRentCarAberturaChamado.DBLookupCliente.ListSource := dmRentCar.dsTPesFis;
 frmRentCarAberturaChamado.DBLookupCliente.ListField := 'PesFis_Nome';
 frmRentCarAberturaChamado.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
 frmRentCarAberturaChamado.ShowModal;
 frmRentCarAberturaChamado.Free;
 
 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
 dmRentCar.ZTChamado.Close;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTPessoa.Close;
end;

procedure TfrmRentCarPrincipal.ChPesJuClick(Sender: TObject);
begin
//chamada do formulário para a abertura de chamados - pessoa juridica
 //variavel que será usada para identificação na abertura do chamado
 chamado := 'J';
 dmRentCar.ZTChamado.Open;
 dmRentCar.ZTPesJu.Open;
 dmRentCar.ZTPessoa.Open;
 Application.CreateForm(TfrmRentCarAberturaChamado, frmRentCarAberturaChamado);
//o lookup irá receber os dados do cadastro de pessoa juridica
 frmRentCarAberturaChamado.DBLookupCliente.ListSource := dmRentCar.dsTPesJu;
 frmRentCarAberturaChamado.DBLookupCliente.ListField := 'PesJu_NmFantasia';
 frmRentCarAberturaChamado.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
 frmRentCarAberturaChamado.ShowModal;
 frmRentCarAberturaChamado.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
 dmRentCar.ZTChamado.Close;
 dmRentCar.ZTPesJu.Open;
 dmRentCar.ZTPessoa.Open;

end;

procedure TfrmRentCarPrincipal.ChamadosEmEsperaClick(Sender: TObject);
begin
//chamada do formulário com a listagem dos chamados em espera
 //variavel que será usada para identificação na listagem dos chamados
 chamado := 'LE';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmListChamados, frmListChamados);
 frmListChamados.ShowModal;
 frmListChamados.Free;
 
  //fechar a tabela para evitar que fique sendo carregada na memória
 dmRentCar.ZTChamado.Close;
end;

procedure TfrmRentCarPrincipal.ChamadosFinalizadosClick(Sender: TObject);
begin
//chamada do formulário com a listagem dos chamados finalizados
 //variavel que será usada para identificação na listagem dos chamados
 chamado := 'LF';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmListChamados, frmListChamados);
 frmListChamados.ShowModal;
 frmListChamados.Free;

 //fechar a tabela para evitar que fique sendo carregada na memória
 dmRentCar.ZTChamado.Close;
end;

procedure TfrmRentCarPrincipal.DevolucaoClick(Sender: TObject);
begin
 veiculo := 'D';
//chamada do formulário para a devolucao do veículo
  dmRentCar.ZTAlugar.Open;
  dmRentCar.ZTGerVal.Open;
  Application.CreateForm(TfrmLocacao, frmLocacao);
  frmLocacao.tsReserva.Destroy;
  frmLocacao.tsLocacao.Destroy;
  frmLocacao.btnCadastar.Enabled := False;
  frmLocacao.btnAlterar.Enabled := False;
  frmLocacao.btnSalvar.Caption := 'Confirmar Devolucao';
  frmLocacao.ShowModal;
  frmLocacao.Free;

 //fechar as tabelas para evitar que fiquem sendo carregadas na memória
  dmRentCar.ZTAlugar.Close;
  dmRentCar.ZTGerVal.Close;  
end;                         

procedure TfrmRentCarPrincipal.RelCliPesFisClick(Sender: TObject);
begin
//rotina que executa a instrução sql para carregar o relatorio de clientes pessoa fisica
  with dmRentCar do
  Begin
    ZQCliente.Close;
    ZQCliente.SQL.Clear;
    ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_Id,rentcar_pesfis.PesFis_nome,rentcar_pessoa.pes_TelOP, rentcar_pessoa.pes_TelRes,rentcar_pessoa.pes_Cel,rentcar_pessoa.pes_Email, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF');
    ZQCliente.SQL.Add('from rentcar_pessoa');
    ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
    ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id and rentcar_pesfis.PesFis_Tipo = "C"');
    ZQCliente.Open;

  if ZQCliente.IsEmpty then
  Begin
    ShowMessage('Não Existem Clientes Pessoa Fisica Cadastrados');
  end else
  Begin
    Application.CreateForm(TfrmRelCliPesFis, frmRelCliPesFis);
    frmRelCliPesFis.QRCliPesFis.Preview;
    frmRelCliPesFis.Free;
    dmRentCar.ZQCliente.Close;
  end;
  end;

end;

procedure TfrmRentCarPrincipal.RelCliPesJuClick(Sender: TObject);
begin
//rotina que executa a instrução sql para carregar o relatorio de clientes pessoa juridica
 with dmRentCar do
 Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pesju.PesJu_NmFantasia,rentcar_pesju.PesJu_RazaoSocial, rentcar_pesju.PesJu_CNPJ, rentcar_pessoa.pes_TelRes, rentcar_pessoa.pes_TelOP, rentcar_pessoa.pes_Cel, rentcar_pessoa.pes_Email');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesju.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
  end;

   if dmRentCar.ZQCliente.IsEmpty then
  Begin
    ShowMessage('Não Existem Clientes Pessoa Jurídica Cadastrados');
  end else
  Begin
    Application.CreateForm(TfrmRelCliPesJu, frmRelCliPesJu);
    frmRelCliPesJu.QRCliPesJu.Preview;
    frmRelCliPesJu.Free;
    dmRentCar.ZQCliente.Close;
  end;

end;

procedure TfrmRentCarPrincipal.ContratoLocPesFisClick(Sender: TObject);
begin
//chamada do formulário para a geração do contrato de locacao
//do cliente pessoa fisica
 //variavel que será usada para identificação na geração do contrato
  contrato := 'ContLocPesFis';
  dmRentCar.ZTPesFis.Open;
  Application.CreateForm(TfrmGerContratos, frmGerContratos);
  frmGerContratos.DBLookupCliente.ListSource := dmRentCar.dsTPesFis;
  frmGerContratos.DBLookupCliente.ListField := 'PesFis_Nome';
  frmGerContratos.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
  frmGerContratos.ShowModal;
  frmGerContratos.Free;
  
   //fechar a tabela para evitar que fique sendo carregada na memória
  dmRentCar.ZTPesFis.Close;
end;

procedure TfrmRentCarPrincipal.ContratoLocPesJuClick(Sender: TObject);
begin
//chamada do formulário para a geração do contrato de locacao
//do cliente pessoa juridica
 //variavel que será usada para identificação na geração do contrato
contrato := 'ContLocPesJu';
 dmRentCar.ZTPesJu.Open;
 Application.CreateForm(TfrmGerContratos, frmGerContratos);
 frmGerContratos.DBLookupCliente.ListSource := dmRentCar.dsTPesJu;
 frmGerContratos.DBLookupCliente.ListField := 'PesJu_NmFantasia';
 frmGerContratos.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
 frmGerContratos.ShowModal;
 frmGerContratos.Free;
 
  //fechar a tabela para evitar que fique sendo carregada na memória
 dmRentCar.ZTPesJu.Close;
end;

end.
