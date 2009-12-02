unit ULocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ComCtrls, Grids, DBGrids, IdMessage,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  TfrmLocacao = class(TForm)
    btnCadastar: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    btnConsultarLoc: TButton;
    PageControl1: TPageControl;
    tsLocacao: TTabSheet;
    tsReserva: TTabSheet;
    lblCliente: TLabel;
    btnBuscar: TButton;
    gbLocacao: TGroupBox;
    lblTipoPg: TLabel;
    lblVlrPagar: TLabel;
    lblVeiculo: TLabel;
    Label1: TLabel;
    DBTAluguel: TDBText;
    DBCKAlu: TDBCheckBox;
    DBCBTpPg: TDBComboBox;
    DBEVlrAPagar: TDBEdit;
    DBLookupCBVeiculo: TDBLookupComboBox;
    DBImgVeiculo: TDBImage;
    Label2: TLabel;
    btnB: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBTVlr: TDBText;
    DBCBR: TDBCheckBox;
    DBLCBV: TDBLookupComboBox;
    DBImgV: TDBImage;
    btnSalvar: TButton;
    edtCliLoc: TEdit;
    edtCliRes: TEdit;
    SMTP: TIdSMTP;
    SSLSocket: TIdSSLIOHandlerSocket;
    MSG: TIdMessage;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBLCBVClick(Sender: TObject);
    procedure DBLookupCBVeiculoClick(Sender: TObject);
    procedure ConeccaoEmail;
    procedure EmailLocacao;
    procedure EmailReserva;
  private
    { Private declarations }
  public
     email, t : string;
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses UDMRentCar, URentCarPrincipal, UCadCliente, UBCliente,
  StrUtils, DB, DateUtils, URelVelAlugados, UContrato;

{$R *.dfm}

procedure TfrmLocacao.btnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmLocacao.btnCadastarClick(Sender: TObject);
begin
 dmRentCar.ZTAlugar.Insert;
end;


procedure TfrmLocacao.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTAlugar.Edit;
 dmRentCar.ZTGerVal.Edit;
end;

procedure TfrmLocacao.btnSalvarClick(Sender: TObject);
begin
  dmRentCar.ZTGerVal.Edit;
  dmRentCar.ZTGerVal.Post;

  if (frmRentCarPrincipal.veiculo = 'PFL') or (frmRentCarPrincipal.veiculo = 'PJL')  then
  Begin
    dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
    dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.Value := dmRentCar.ZQCliente.fieldbyname('Pes_id').AsInteger;
    dmRentCar.ZTAlugar.Post;
    if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmando a locação do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      EmailLocacao;
    end else
    Begin
     Application.CreateForm(TfrmContratoLocacao, frmContratoLocacao);
     frmContratoLocacao.ShowModal;
     frmContratoLocacao.Free;
   end;
  end else
    if (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PJR') then
    Begin
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.Value := dmRentCar.ZQCliente.fieldbyname('Pes_id').AsInteger;
      dmRentCar.ZTAlugar.Post;
      if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmar a reserva do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        EmailReserva;
      end;
    end;
end;

procedure TfrmLocacao.btnBuscarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
  frmConsultaClientes.ShowModal;
  frmConsultaClientes.Close;
end;

procedure TfrmLocacao.DBLCBVClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTCadVeiculo.Filtered := False;
  ZTCadVeiculo.Filter := 'Vel_Marca = '+ QuotedStr(DBLCBV.Text);
  //ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
 end;
end;

procedure TfrmLocacao.DBLookupCBVeiculoClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTCadVeiculo.Filtered := False;
  ZTCadVeiculo.Filter := 'Vel_Marca = '+ QuotedStr(DBLookupCBVeiculo.Text);
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
  DBEVlrAPagar.Text := dmRentCar.ZTGerValGerVal_ValAlu.AsString;
 end;
end;

procedure TfrmLocacao.ConeccaoEmail;
begin
 with SMTP do
   begin
      AuthenticationType := atLogin;
      Host := 'smtp.gmail.com';
      IOHandler := SSLSocket;
      Password := 'mangue3088';
      Port := 465;
      Username := 'arllmcomputacao@gmail.com'; //não esqueça o @gmail.com!!
   end;

   SSLSocket.SSLOptions.Method := sslvSSLv2;
   SSLSocket.SSLOptions.Mode := sslmClient;

end;

procedure TfrmLocacao.EmailLocacao;
var
 corpoMensagem : string;
begin
 ConeccaoEmail();

 corpoMensagem :=  '--------------------------------'+
                   '--------------------------------'+
                   '@-RentCar - Locadora de Veículos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Srº '+dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString+' informamos que a locação do veículo '+''+'foi realizada e computada no nosso sistema com sucesso';


   with MSG do
   begin
      Body.Add(corpoMensagem);
      From.Address := 'arllm_@hotmail.com'; //opcional
      From.Name := '@-RentCar'; //opcional
      Recipients.Add;
      Recipients.Items[0].Address := dmRentCar.ZQCliente.fieldbyname('Pes_Email').AsString;
      Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString),5); //opcional
      Subject := 'Confirmacao Locacao';
   end;

   try
      SMTP.Connect();
      SMTP.Send(MSG);
      SMTP.Disconnect;
   except
      ShowMessage('Falha no envio!');
      exit;
   end;
   ShowMessage('Mensagem enviada com sucesso!');
 end;

procedure TfrmLocacao.EmailReserva;
var
 corpoMensagem : string;
begin
 ConeccaoEmail();

 corpoMensagem :=  '--------------------------------'+
                   '--------------------------------'+
                   '@-RentCar - Locadora de Veículos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Srº '+dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString+' informamos que a foi feita a reserva do veículo '+''+'com sucesso, em breve informaremos quando o veículo estiver disponível';


   with MSG do
   begin
      Body.Add(corpoMensagem);
      From.Address := 'arllm_@hotmail.com'; //opcional
      From.Name := '@-RentCar'; //opcional
      Recipients.Add;
      Recipients.Items[0].Address := dmRentCar.ZQCliente.fieldbyname('Pes_Email').AsString;
      Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString),5); //opcional
      Subject := 'Confirmacao Reserva';
   end;

   try
      SMTP.Connect();
      SMTP.Send(MSG);
      SMTP.Disconnect;
   except
      ShowMessage('Falha no envio!');
      exit;
   end;
   ShowMessage('Mensagem enviada com sucesso!');
 end;

end.
