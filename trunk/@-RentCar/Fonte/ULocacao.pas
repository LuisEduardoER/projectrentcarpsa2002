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
    DBCheckBox1: TDBCheckBox;
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

uses UDMRentCar, URentCarPrincipal, MsgEditor, UCadCliente, UBCliente,
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

  if frmRentCarPrincipal.veiculo = 'L' then
  Begin
    dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
    dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.Value := dmRentCar.ZQCliente.fieldbyname('Pes_id').AsInteger;
    dmRentCar.ZTAlugar.Post;
    if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmando a locação do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      EmailLocacao;
    end else
    Begin
      With dmRentCar do
      Begin
        ZQAlugar.Close;
        ZQAlugar.SQL.Clear;
        ZQAlugar.SQL.Add('select PesFis_Nome, PesFis_EstCivil, PesFis_RG, PesFis_CPF, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
        ZQAlugar.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
        ZQAlugar.SQL.Add('from rentcar_pessoa ');
        ZQAlugar.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
        ZQAlugar.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
        ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_PesFis_PesFis_id = rentcar_pesfis.PesFis_id ');
        ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
        ZQAlugar.SQL.Add('where PesFis_Nome = "'+edtCliLoc.Text+'"');
        ZQAlugar.Open;

        if ZQAlugar.IsEmpty then
        Begin
          ShowMessage('Não Existem Veiculos Alugados');
        end else
        Begin
          Application.CreateForm(TfrmContratoLocacao, frmContratoLocacao);
          frmContratoLocacao.QRVelContrLoc.Preview;
          frmContratoLocacao.Free;
          dmRentCar.ZQAlugar.Close;
        end;
      end;
   end;
  end else
    if frmRentCarPrincipal.veiculo = 'R' then
    Begin
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarRentCar_Pessoa_Pes_id.Value := dmRentCar.ZQCliente.fieldbyname('Pes_id').AsInteger;
      dmRentCar.ZTAlugar.Post;
      if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmar a reserva do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        EmailReserva;
      end else
      Begin
        With dmRentCar do
        Begin
          ZQCliente.SQL.Add('select PesFis_Nome, PesFis_EstCivil, PesFis_RG, PesFis_CPF, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
          ZQCliente.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
          ZQCliente.SQL.Add('from rentcar_pessoa ');
          ZQCliente.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
          ZQCliente.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
          ZQCliente.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_PesFis_PesFis_id = rentcar_pesfis.PesFis_id ');
          ZQCliente.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
          ZQCliente.SQL.Add('where PesFis_Nome = "'+edtCliRes.Text+'"');
        end;
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
