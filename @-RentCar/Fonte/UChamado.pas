unit UChamado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, ExtCtrls, IdMessage,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, Buttons;

type
  TfrmRentCarAberturaChamado = class(TForm)
    gbCliente: TGroupBox;
    lblNome: TLabel;
    gbAberturaChamados: TGroupBox;
    lblSolicitacao: TLabel;
    DataChamado: TDateTimePicker;
    lblData: TLabel;
    lblDesc: TLabel;
    lblProtocol: TLabel;
    DBTProtocol: TDBText;
    DBTHora: TDBText;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBCBSolic: TDBComboBox;
    DBLookupCliente: TDBLookupComboBox;
    SSLSocket: TIdSSLIOHandlerSocket;
    SMTP: TIdSMTP;
    MSG: TIdMessage;
    DBMDesc: TDBMemo;
    btnCadastrar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    BitBtn4: TBitBtn;
    procedure DBLookupClienteClick(Sender: TObject);
    procedure emailProtocolo;
    procedure conexaoEmail;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
     chamado : string;
    { Public declarations }
  end;

var
  frmRentCarAberturaChamado: TfrmRentCarAberturaChamado;

implementation

uses UDMRentCar, ULocacao, URentCarPrincipal, DB, StrUtils;

{$R *.dfm}

procedure TfrmRentCarAberturaChamado.DBLookupClienteClick(Sender: TObject);
begin
 dmRentCar.ZTPessoa.Filtered := False;
 dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZTPesFisRentCar_Pessoa_Pes_id.AsString);
 dmRentCar.ZTPessoa.Filtered := True;
end;

procedure TfrmRentCarAberturaChamado.emailProtocolo;
var
 corpoMensagem, mensagem : string;
begin
  conexaoEmail();

  if frmRentCarPrincipal.chamado = 'F' then
  Begin
   mensagem := 'Srº '+dmRentCar.ZTPesFisPesFis_Nome.AsString+' estamos enviado o numero do protocolo '+dmRentCar.ZTChamadoCh_Protocol.AsString+' do tipo de chamado '+dmRentCar.ZTChamadoCh_TipoCh.AsString +' com a seguinte descrição '+dmRentCar.ZTChamadoCh_DescCh.Value;
 end else
  if frmRentCarPrincipal.chamado = 'J' then
  Begin
   mensagem := 'Srº '+dmRentCar.ZTPesJuPesJu_NmFantasia.AsString+' estamos enviado o numero do protocolo '+dmRentCar.ZTChamadoCh_Protocol.AsString+' do tipo de chamado '+dmRentCar.ZTChamadoCh_TipoCh.AsString +' com a seguinte descrição '+dmRentCar.ZTChamadoCh_DescCh.Value;
  end;

 corpoMensagem :=  '--------------------------------'+
                   '--------------------------------'+
                   '@-RentCar - Locadora de Veículos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   mensagem;


   with MSG do
   begin
      Body.Add(corpoMensagem);
      From.Address := 'arllm_@hotmail.com'; //opcional
      From.Name := '@-RentCar'; //opcional
      Recipients.Add;
      if frmRentCarPrincipal.chamado = 'F' then
      Begin
        Recipients.Items[0].Address := dmRentCar.ZTPessoaPes_Email.AsString;
        Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZTPesFisPesFis_Nome.AsString),5); //opcional
      end else
      if frmRentCarPrincipal.chamado = 'J' then
      Begin
        Recipients.Items[0].Address := dmRentCar.ZTPessoaPes_Email.AsString;
        Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZTPesJuPesJu_NmFantasia.AsString),5); //opcional
      end;
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
procedure TfrmRentCarAberturaChamado.conexaoEmail;
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

procedure TfrmRentCarAberturaChamado.btnCadastrarClick(Sender: TObject);
begin
gbAberturaChamados.Enabled := True;
 gbCliente.Enabled := True;
 btnCadastrar.Enabled := False;
 dmRentCar.ZTChamado.Insert;
 DBTHora.Caption := TimeToStr(Time);

end;

procedure TfrmRentCarAberturaChamado.btnSalvarClick(Sender: TObject);
Var
Rand : integer;
protocol : string;
begin
  Randomize;
  //protocol := '';
   repeat
    Rand :=Random(10);       //será sorteado os números de 0 a 9
    if AnsiPos(IntToStr(Rand),protocol)=0 then         //somente se o número for diferente do já escolhido
      protocol := protocol + IntToStr(Rand);
    until(Length(protocol)= 10); //quantos números diferentes você desejar obter.

dmRentCar.ZTChamadoCh_HoraCh.Value := Now;
dmRentCar.ZTChamadoCh_DataCh.Value := DataChamado.Date;
dmRentCar.ZTChamadoCh_Protocol.Value := protocol;
dmRentCar.ZTChamado.Post;
ShowMessage('Chamado Registrado com Sucesso!! Será Enviado um e-mail para o usuário de registro de chamado');
emailProtocolo;
btnCadastrar.Enabled := True;
btnSalvar.Enabled := False;

end;

procedure TfrmRentCarAberturaChamado.btnCancelarClick(Sender: TObject);
begin
 dmRentCar.ZTChamado.Cancel;

end;

procedure TfrmRentCarAberturaChamado.BitBtn4Click(Sender: TObject);
begin
 close;
end;

end.
