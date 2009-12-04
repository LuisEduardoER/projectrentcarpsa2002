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
    pgGerLovResDev: TPageControl;
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
    DBCBTpPg: TDBComboBox;
    DBLookupCBVeiculo: TDBLookupComboBox;
    DBImgVeiculo: TDBImage;
    Label2: TLabel;
    btnB: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBTVlr: TDBText;
    DBLCBV: TDBLookupComboBox;
    DBImgV: TDBImage;
    btnSalvar: TButton;
    edtCliLoc: TEdit;
    edtCliRes: TEdit;
    SMTP: TIdSMTP;
    SSLSocket: TIdSSLIOHandlerSocket;
    MSG: TIdMessage;
    DBTVlrAPag: TDBText;
    DateReserva: TDateTimePicker;
    DateLocI: TDateTimePicker;
    DateLocF: TDateTimePicker;
    lblPerLoc: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tsDevolucao: TTabSheet;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    DBTVlrDev: TDBText;
    DBLookupVecDev: TDBLookupComboBox;
    DBImgDev: TDBImage;
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
    procedure tsDevolucaoShow(Sender: TObject);
    procedure DBLookupVecDevClick(Sender: TObject);
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
  StrUtils, DB, DateUtils, URelVelAlugados, UContrato, UContraoPesJu;

{$R *.dfm}

procedure TfrmLocacao.btnSairClick(Sender: TObject);
begin
 Close;
 dmRentCar.ZTCadVeiculo.Filtered := False;
end;

procedure TfrmLocacao.btnCadastarClick(Sender: TObject);
begin
  dmRentCar.ZTAlugar.Insert;
  if (frmRentCarPrincipal.veiculo = 'PFL') or (frmRentCarPrincipal.veiculo = 'PJL')  then
  Begin
   dmRentCar.ZTCadVeiculo.Filtered := False;
   dmRentCar.ZTCadVeiculo.Filter := 'Vel_StatusLoc = '+QuotedStr('L');
   dmRentCar.ZTCadVeiculo.Filtered := True;
  end;
  btnSalvar.Enabled := True;
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
    dmRentCar.ZTAlugarPerInicialLoc.Value := DateLocI.Date;
    dmRentCar.ZTAlugarPerFinalLoc.Value := DateLocF.Date;
    dmRentCar.ZTAlugar.Post;
    dmRentCar.ZTCadVeiculo.Edit;
    dmRentCar.ZTCadVeiculoVel_StatusLoc.Value := 'O';
    dmRentCar.ZTCadVeiculo.Post;
    if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmando a loca��o do ve�culo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      EmailLocacao;
    end;// else
    //Begin
     if (frmRentCarPrincipal.veiculo = 'PFL') then
     Begin
     Application.CreateForm(TfrmContratoLocacao, frmContratoLocacao);
     frmContratoLocacao.QRVelContrLoc.Preview;
     frmContratoLocacao.Free;
     end else
     if (frmRentCarPrincipal.veiculo = 'PJL') then
     Begin
     Application.CreateForm(TfrmContratoLocacaoPesJu, frmContratoLocacaoPesJu);
     frmContratoLocacaoPesJu.QRVelContrLocPesJu.Preview;
     frmContratoLocacaoPesJu.Free;
     end;
   //end;
  end else
    if (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PJR') then
    Begin
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.Value := dmRentCar.ZQCliente.fieldbyname('Pes_id').AsInteger;
      dmRentCar.ZTAlugarDataReserva.Value := DateReserva.Date;
      dmRentCar.ZTAlugar.Post;
      dmRentCar.ZTCadVeiculo.Edit;
      dmRentCar.ZTCadVeiculoVel_StatusRes.Value := 'R';
      dmRentCar.ZTCadVeiculo.Post;
      if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmar a reserva do ve�culo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        EmailReserva;
      end;
    end else
    Begin
      //dmRentCar.ZTAlugar.Edit;
      dmRentCar.ZTAlugar.Post;
      //dmRentCar.ZTCadVeiculo.Edit;
      dmRentCar.ZTCadVeiculoVel_StatusLoc.Value := 'L';
      dmRentCar.ZTCadVeiculo.Post;
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
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
  ZTGerValGerVal_ValAPag.Value := dmRentCar.ZTGerValGerVal_ValAlu.Value;
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
      Username := 'arllmcomputacao@gmail.com'; //n�o esque�a o @gmail.com!!
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
                   '@-RentCar - Locadora de Ve�culos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Sr� '+dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString+' informamos que a loca��o do ve�culo '+''+'foi realizada e computada no nosso sistema com sucesso';


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
                   '@-RentCar - Locadora de Ve�culos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Sr� '+dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString+' informamos que a foi feita a reserva do ve�culo '+''+'com sucesso, em breve informaremos quando o ve�culo estiver dispon�vel';


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

procedure TfrmLocacao.tsDevolucaoShow(Sender: TObject);
begin
   dmRentCar.ZTCadVeiculo.Filtered := False;
   dmRentCar.ZTCadVeiculo.Filter := 'Vel_StatusLoc = '+QuotedStr('O');
   dmRentCar.ZTCadVeiculo.Filtered := True;
   dmRentCar.ZTCadVeiculo.Open;
   dmRentCar.ZTGerVal.Filtered := False;
   dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
   dmRentCar.ZTGerVal.Filtered := True;
end;

procedure TfrmLocacao.DBLookupVecDevClick(Sender: TObject);
begin
 dmRentCar.ZTPessoa.Filtered := False;
 dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.AsString);
 dmRentCar.ZTPessoa.Filtered := True;
 dmRentCar.ZTCadVeiculo.Filtered := False;
 dmRentCar.ZTCadVeiculo.Filter := 'Vel_id = '+QuotedStr(dmRentCar.ZTAlugarRentCar_Veiculo_Vel_id.AsString);
 dmRentCar.ZTCadVeiculo.Filtered := True;
  dmRentCar.ZTAlugar.Edit;
  dmRentCar.ZTCadVeiculo.Edit;

end;

end.
