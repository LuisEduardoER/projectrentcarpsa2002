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
  private
    { Private declarations }
  public
     tipo, veiculo, cli, perfil, chamado : string;
    { Public declarations }
  end;

var
  frmRentCarPrincipal: TfrmRentCarPrincipal;

implementation

uses UCadVeiculo, UDMRentCar, UCadCliente, ULocacao, UChamado, URelVelDisp,
  URelVelAlugados, UCadUsuario, URelVelRes, UGerarPerfil, UListChamados;

{$R *.dfm}

procedure TfrmRentCarPrincipal.FormShow(Sender: TObject);
begin
sbRentCar.Panels[1].Text := DateToStr(date);
sbRentCar.Panels[2].Text := TimeToStr(now);
end;

procedure TfrmRentCarPrincipal.SairClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmRentCarPrincipal.FisicaClick(Sender: TObject);
begin
 veiculo := 'PFR';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsLocacao.Destroy;
 frmLocacao.ShowModal;
 frmLocacao.Free;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTGerVal.Close;

end;

procedure TfrmRentCarPrincipal.JuridicaClick(Sender: TObject);
begin
 veiculo := 'PJR';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsLocacao.Destroy;
 frmLocacao.ShowModal;
 frmLocacao.Free;
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTGerVal.Close;
end;

procedure TfrmRentCarPrincipal.PesFisicaClick(Sender: TObject);
begin
 tipo := 'PF';
 cli := 'Cli';
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTPessoa.Open;
 dmRentCar.ZTEndereco.Open;
 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.tsDadosPJ.Destroy;
 frmCadClientes.ShowModal;
 frmCadClientes.Free;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTPessoa.Close;
 dmRentCar.ZTEndereco.Close;
end;

procedure TfrmRentCarPrincipal.PesJuridicaClick(Sender: TObject);
begin
 tipo := 'PJ';
 cli := 'Cli';
 dmRentCar.ZTPesJu.Open;
 dmRentCar.ZTPessoa.Open;
 dmRentCar.ZTEndereco.Open;
 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.tsDadosPF.Destroy;
 frmCadClientes.ShowModal;
 frmCadClientes.Free;
 dmRentCar.ZTPesJu.Close;
 dmRentCar.ZTPessoa.Close;
 dmRentCar.ZTEndereco.Close;
end;

procedure TfrmRentCarPrincipal.VeiculosClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Open;
 Application.CreateForm(TfrmCadVeiculos, frmCadVeiculos);
 frmCadVeiculos.ShowModal;
 frmCadVeiculos.Free;
 dmRentCar.ZTCadVeiculo.Close;
end;

procedure TfrmRentCarPrincipal.AlugadosClick(Sender: TObject);
begin
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img');
    ZQAlugar.SQL.Add('from rentcar_veiculo, rentcar_alugar');
    ZQAlugar.SQL.Add('where rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id');
    ZQAlugar.SQL.Add('and rentcar_alugar.Alu_Loc ="AL"');
        ShowMessage(ZQAlugar.SQL.Text);
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
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img');
    ZQAlugar.SQL.Add('from rentcar_veiculo, rentcar_alugar');
    ZQAlugar.SQL.Add('where rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id');
    ZQAlugar.SQL.Add('and rentcar_alugar.Alu_Reserva ="NR" and rentcar_alugar.Alu_Loc ="NAL"');
    ShowMessage(ZQAlugar.SQL.Text);
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
 tipo := 'FUN';
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTPessoa.Open;
 dmRentCar.ZTEndereco.Open;
 Application.CreateForm(TfrmCadClientes, frmCadClientes);
 frmCadClientes.tsDadosPJ.Destroy;
 frmCadClientes.ShowModal;
 frmCadClientes.Free;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTPessoa.Close;
 dmRentCar.ZTEndereco.Close;
end;

procedure TfrmRentCarPrincipal.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);
  frmCadUsuarios.ShowModal;
  frmCadUsuarios.Free;
end;

procedure TfrmRentCarPrincipal.LocPesFisClick(Sender: TObject);
begin
  veiculo := 'PFL';
  dmRentCar.ZTAlugar.Open;
  dmRentCar.ZTCadVeiculo.Open;
  dmRentCar.ZTGerVal.Open;
  Application.CreateForm(TfrmLocacao, frmLocacao);
  frmLocacao.tsReserva.Destroy;
  frmLocacao.ShowModal;
  frmLocacao.Free;
  dmRentCar.ZTCadVeiculo.Open;
  dmRentCar.ZTAlugar.Close;
  dmRentCar.ZTGerVal.Close;
end;

procedure TfrmRentCarPrincipal.LocPesJuClick(Sender: TObject);
begin
 veiculo := 'PJL';
 dmRentCar.ZTAlugar.Open;
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 Application.CreateForm(TfrmLocacao, frmLocacao);
 frmLocacao.tsReserva.Destroy;
 frmLocacao.ShowModal;
 frmLocacao.Free;
 dmRentCar.ZTAlugar.Close;
 dmRentCar.ZTCadVeiculo.Close;
 dmRentCar.ZTGerVal.Close;

end;

procedure TfrmRentCarPrincipal.ReservadosClick(Sender: TObject);
begin
  with dmRentCar do
  Begin
    ZQAlugar.Close;
    ZQAlugar.SQL.Clear;
    ZQAlugar.SQL.Add('Select rentcar_veiculo.Vel_Espec, rentcar_veiculo.Vel_Img');
    ZQAlugar.SQL.Add('from rentcar_veiculo, rentcar_alugar');
    ZQAlugar.SQL.Add('where rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id');
    ZQAlugar.SQL.Add('and rentcar_alugar.Alu_Reserva ="R"');
        ShowMessage(ZQAlugar.SQL.Text);
    ZQAlugar.Open;

  if ZQAlugar.IsEmpty then
  Begin
    ShowMessage('Não Existem Veiculos Alugados');
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
  perfil := 'F';
  Application.CreateForm(TfrmGerarPerfil, frmGerarPerfil);
  frmGerarPerfil.ShowModal;
  frmGerarPerfil.Free;
end;

procedure TfrmRentCarPrincipal.PJuridicaClick(Sender: TObject);
begin
  perfil := 'J';
  Application.CreateForm(TfrmGerarPerfil, frmGerarPerfil);
  frmGerarPerfil.ShowModal;
  frmGerarPerfil.Free;
end;

procedure TfrmRentCarPrincipal.ChPesFisClick(Sender: TObject);
begin
 chamado := 'F';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmRentCarAberturaChamado, frmRentCarAberturaChamado);
 frmRentCarAberturaChamado.ShowModal;
 frmRentCarAberturaChamado.Free;
 dmRentCar.ZTChamado.Close;
end;

procedure TfrmRentCarPrincipal.ChPesJuClick(Sender: TObject);
begin
 chamado := 'J';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmRentCarAberturaChamado, frmRentCarAberturaChamado);
 frmRentCarAberturaChamado.ShowModal;
 frmRentCarAberturaChamado.Free;
 dmRentCar.ZTChamado.Close;
end;

procedure TfrmRentCarPrincipal.ChamadosEmEsperaClick(Sender: TObject);
begin
 chamado := 'LE';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmListChamados, frmListChamados);
 frmListChamados.ShowModal;
 frmListChamados.Free;
 dmRentCar.ZTChamado.Close;
end;

procedure TfrmRentCarPrincipal.ChamadosFinalizadosClick(Sender: TObject);
begin
 chamado := 'LF';
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmListChamados, frmListChamados);
 frmListChamados.ShowModal;
 frmListChamados.Free;
 dmRentCar.ZTChamado.Close;
end;

end.
