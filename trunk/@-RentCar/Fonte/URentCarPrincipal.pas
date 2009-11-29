unit URentCarPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, WinSkinData, StdCtrls, Buttons;

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
    procedure FormShow(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure FisicaClick(Sender: TObject);
    procedure JuridicaClick(Sender: TObject);
    procedure PesFisicaClick(Sender: TObject);
    procedure PesJuridicaClick(Sender: TObject);
    procedure VeiculosClick(Sender: TObject);
    procedure AberturaChamadosClick(Sender: TObject);
    procedure AlugadosClick(Sender: TObject);
    procedure DisponveisClick(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure LocPesFisClick(Sender: TObject);
    procedure LocPesJuClick(Sender: TObject);
    procedure ReservadosClick(Sender: TObject);
  private
    { Private declarations }
  public
     tipo : string;
     veiculo : string;
     cli : string; 
    { Public declarations }
  end;

var
  frmRentCarPrincipal: TfrmRentCarPrincipal;

implementation

uses UCadVeiculo, UDMRentCar, UCadCliente, ULocacao, UChamado, URelVelDisp,
  URelVelAlugados, UCadUsuario, URelVelRes;

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
 tipo := 'PF';
 veiculo := 'R';
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
 tipo := 'PJ';
 veiculo := 'R';
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

procedure TfrmRentCarPrincipal.AberturaChamadosClick(Sender: TObject);
begin
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTChamado.Open;
 Application.CreateForm(TfrmRentCarAberturaChamado, frmRentCarAberturaChamado);
 frmRentCarAberturaChamado.ShowModal;
 frmRentCarAberturaChamado.Free;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTChamado.Close;
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
    ShowMessage('N�o Existem Veiculos Alugados');
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
    ShowMessage('N�o Existem Veiculos Dispon�veis');
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
 cli := 'FU';
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
  tipo := 'PF';
  veiculo := 'L';
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
 tipo := 'PJ';
 veiculo := 'L';
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
    ShowMessage('N�o Existem Veiculos Alugados');
  end else
  Begin
    Application.CreateForm(TfrmRelVelRes, frmRelVelRes);
    frmRelVelRes.QRVelRes.Preview;
    frmRelVelRes.Free;
    dmRentCar.ZQAlugar.Close;
  end;
  end;

end;

end.
