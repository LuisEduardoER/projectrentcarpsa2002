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
    gbLocacao: TGroupBox;
    lblTipoPg: TLabel;
    lblVlrPagar: TLabel;
    lblVeiculo: TLabel;
    Label1: TLabel;
    DBTAluguel: TDBText;
    DBCBTpPg: TDBComboBox;
    DBLookupCBVeiculo: TDBLookupComboBox;
    DBImgVeiculo: TDBImage;
    gbReserva: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBTVlr: TDBText;
    DBLCBV: TDBLookupComboBox;
    DBImgV: TDBImage;
    btnSalvar: TButton;
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
    gbDev: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    DBTVlrDev: TDBText;
    DBLookupVecDev: TDBLookupComboBox;
    DBImgDev: TDBImage;
    lblCliente: TLabel;
    DBLookupCliente: TDBLookupComboBox;
    DBLookupClienteRes: TDBLookupComboBox;
    Label2: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBLCBVClick(Sender: TObject);
    procedure DBLookupCBVeiculoClick(Sender: TObject);
    procedure ConeccaoEmail;
    procedure EmailLocacao;
    procedure EmailReserva;
    procedure tsDevolucaoShow(Sender: TObject);
    procedure DBLookupVecDevClick(Sender: TObject);
    procedure DBLookupClienteClick(Sender: TObject);
    procedure tsLocacaoShow(Sender: TObject);
    procedure tsReservaShow(Sender: TObject);
    procedure btnConsultarLocClick(Sender: TObject);
  private
    { Private declarations }
  public
     email: string;
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;
  opVec : string;
  
implementation

uses UDMRentCar, URentCarPrincipal, UCadCliente, UBCliente,
  StrUtils, DB, DateUtils, URelVelAlugados, UContrato, UContraoPesJu,
  UGerVlrVeiculo, UConsulLoc;

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
   gbLocacao.Enabled := True;
  end else
  if (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PJR')  then
  Begin
    gbReserva.Enabled := True;
  end;
   btnCadastar.Enabled := False;
   btnSalvar.Enabled := True;
end;


procedure TfrmLocacao.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTAlugar.Edit;
 dmRentCar.ZTGerVal.Edit;
 btnSalvar.Enabled := True;
end;

procedure TfrmLocacao.btnSalvarClick(Sender: TObject);
begin
  dmRentCar.ZTGerVal.Edit;
  dmRentCar.ZTGerVal.Post;

  if (frmRentCarPrincipal.veiculo = 'PFL') or (frmRentCarPrincipal.veiculo = 'PJL')  then
  Begin
    if DBLookupCliente.Text = '' then
    Begin
      ShowMessage('Escolha o cliente');
    end else
    if DBLookupCBVeiculo.Text = '' then
    Begin
      ShowMessage('Escolha o veiculo');
    end else
    Begin
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarPerInicialLoc.Value := DateLocI.Date;
      dmRentCar.ZTAlugarPerFinalLoc.Value := DateLocF.Date;
      dmRentCar.ZTAlugar.Post;
      dmRentCar.ZTCadVeiculo.Filtered := False;
      dmRentCar.ZTCadVeiculo.Filter := 'Vel_id = '+QuotedStr(dmRentCar.ZTAlugarRentCar_Veiculo_Vel_id.AsString);
      dmRentCar.ZTCadVeiculo.Filtered := True;

      dmRentCar.ZTCadVeiculo.Edit;
      dmRentCar.ZTCadVeiculoVel_StatusLoc.Value := 'O';
      dmRentCar.ZTCadVeiculo.Post;
      ShowMessage('Locação confirmada com sucesso');
      btnCadastar.Enabled := True;
      btnSalvar.Enabled := False;

      if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmando a locação do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        EmailLocacao;
      end;
      if (frmRentCarPrincipal.veiculo = 'PFL') then
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
        ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id  ');
        ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
        ZQAlugar.SQL.Add('where PesFis_Nome = "'+DBLookupCliente.Text+'"');
        ZQAlugar.Open;
      end;
      if dmRentCar.ZQAlugar.IsEmpty then
      Begin
        ShowMessage('Não existem dados de locação para o cliente escolhido');
      end else
      if Application.MessageBox('Deseja gerar o contrato de Locação?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        Application.CreateForm(TfrmContratoLocacao,frmContratoLocacao);
        frmContratoLocacao.QRVelContrLoc.Preview;
        frmContratoLocacao.Free;
      end;
      end else
      if (frmRentCarPrincipal.veiculo = 'PJL') then
      Begin
        With dmRentCar do
        Begin
          ZQAlugar.Close;
          ZQAlugar.SQL.Clear;
          ZQAlugar.SQL.Add('select PesJU_NmFantasia, PesJu_RazaoSocial, PesJu_CNPJ, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
          ZQAlugar.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
          ZQAlugar.SQL.Add('from rentcar_pessoa ');
          ZQAlugar.SQL.Add('inner join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
          ZQAlugar.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
          ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id  ');
          ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
          ZQAlugar.SQL.Add('where PesJu_NmFantasia = "'+DBLookupCliente.Text+'"');
          ZQAlugar.Open;
        end;

        if dmRentCar.ZQAlugar.IsEmpty then
        Begin
          ShowMessage('Não existem dados de locação para o cliente escolhido');
        end else
        if Application.MessageBox('Deseja gerar o contrato de Locação?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
        Begin
          Application.CreateForm(TfrmContratoLocacaoPesJu,frmContratoLocacaoPesJu);
          frmContratoLocacaoPesJu.QRVelContrLocPesJu.Preview;
          frmContratoLocacaoPesJu.Free;
         end;
      end;
    end;
    end else
    if (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PJR') then
    Begin
      if DBLookupClienteRes.Text = '' then
      Begin
        ShowMessage('Escolha o cliente');
      end else
      Begin
        dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
        dmRentCar.ZTAlugarDataReserva.Value := DateReserva.Date;
        dmRentCar.ZTAlugar.Post;
        dmRentCar.ZTCadVeiculo.Edit;
        dmRentCar.ZTCadVeiculoVel_StatusRes.Value := 'R';
        dmRentCar.ZTCadVeiculo.Post;
        ShowMessage('Reserva confirmada com sucesso');
        btnCadastar.Enabled := True;
        btnSalvar.Enabled := False;
      if Application.MessageBox('Deseja enviar um e-mail para o cliente confirmar a reserva do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
      Begin
        EmailReserva;
      end;
      end;
    end else
    if (frmRentCarPrincipal.veiculo = 'D') then
    Begin
      dmRentCar.ZTAlugar.Edit;
      dmRentCar.ZTAlugar.Post;
      dmRentCar.ZTCadVeiculo.Edit;
      dmRentCar.ZTCadVeiculoVel_StatusLoc.Value := 'L';
      dmRentCar.ZTCadVeiculo.Post;
      dmRentCar.ZTCadVeiculo.Refresh;
      tsDevolucao.OnShow(Self);
      ShowMessage('Devolucao confirmada com sucesso');
    end;
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
  if ZTGerVal.IsEmpty then
  Begin
    ShowMessage('Ainda não foi cadastrado o valor do aluguel desse veículo');
  end else
  Begin
  ZTGerValGerVal_ValAPag.Value := dmRentCar.ZTGerValGerVal_ValAlu.Value;
  end;
 end;
end;

procedure TfrmLocacao.DBLookupCBVeiculoClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
  if ZTGerVal.IsEmpty then
  Begin
    ShowMessage('Ainda não foi cadastrado o valor do aluguel desse veículo');
    dmRentCar.ZTCadVeiculo.Open;
    dmRentCar.ZTGerVal.Open;
    Application.CreateForm(TfrmRentCarVlrVeiculos, frmRentCarVlrVeiculos);
    dmRentCar.ZTGerVal.Filtered := False;
    dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
    dmRentCar.ZTGerVal.Filtered := True;
    dmRentCar.ZTGerVal.Refresh;
    if dmRentCar.ZTGerVal.IsEmpty then
    Begin
      dmRentCar.ZTGerVal.Insert;
    end else
    Begin
       dmRentCar.ZTGerVal.Edit;
      frmRentCarVlrVeiculos.btnCadastrar.Enabled := False;
    end;
     frmRentCarVlrVeiculos.ShowModal;
     frmRentCarVlrVeiculos.Free;
     dmRentCar.ZTGerVal.Close;
  end else
  Begin
  ZTGerValGerVal_ValAPag.Value := dmRentCar.ZTGerValGerVal_ValAlu.Value;
  end;
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
 corpoMensagem, mensagem : string;
begin
 ConeccaoEmail();

  if frmRentCarPrincipal.veiculo = 'PFL' then
  Begin
   mensagem := 'Srº '+dmRentCar.ZTPesFisPesFis_Nome.AsString+' informamos que a locação do veículo '+dmRentCar.ZTCadVeiculoVel_Espec.AsString+' foi realizada e computada no nosso sistema com sucesso';
 end else
  if frmRentCarPrincipal.veiculo = 'PJL' then
  Begin
    mensagem := 'Srº '+dmRentCar.ZTPesJuPesJu_NmFantasia.AsString+' informamos que a locação do veículo '+dmRentCar.ZTCadVeiculoVel_Espec.AsString+' foi realizada e computada no nosso sistema com sucesso';
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
      if frmRentCarPrincipal.veiculo = 'PFL' then
      Begin
        Recipients.Items[0].Address := dmRentCar.ZTPessoaPes_Email.AsString;
        Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZTPesFisPesFis_Nome.AsString),5); //opcional
      end else
      if frmRentCarPrincipal.veiculo = 'PJL' then
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

procedure TfrmLocacao.EmailReserva;
var
 corpoMensagem, mensagem: string;
begin
 ConeccaoEmail();

 if frmRentCarPrincipal.veiculo = 'PFR' then
 Begin
  mensagem := 'Srº '+dmRentCar.ZTPesFisPesFis_Nome.AsString+' informamos que a foi feita a reserva do veículo '+ dmRentCar.ZTCadVeiculoVel_Espec.AsString +' com sucesso, em breve informaremos quando o veículo estiver disponível';
 end else
 if frmRentCarPrincipal.veiculo = 'PJR' then
 Begin
  mensagem := 'Srº '+dmRentCar.ZTPesJuPesJu_NmFantasia.AsString+' informamos que a foi feita a reserva do veículo '+dmRentCar.ZTCadVeiculoVel_Espec.AsString+' com sucesso, em breve informaremos quando o veículo estiver disponível';
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
      if frmRentCarPrincipal.veiculo = 'PFR' then
      Begin
        Recipients.Items[0].Address := dmRentCar.ZTPessoaPes_Email.AsString;
        Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZTPesFisPesFis_Nome.AsString),5); //opcional
      end else
      if frmRentCarPrincipal.veiculo = 'PJR' then
      Begin
        Recipients.Items[0].Address := dmRentCar.ZTPessoaPes_Email.AsString;
        Recipients.Items[0].Name := LeftStr(trim(dmRentCar.ZTPesJuPesJu_NmFantasia.AsString),5); //opcional
      end;
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
   dmRentCar.ZTAlugar.Open;
   dmRentCar.ZTGerVal.Open;
   opVec := 'D';
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
 dmRentCar.ZTCadVeiculo.Filtered := False;
 dmRentCar.ZTCadVeiculo.Filter := 'Vel_id = '+QuotedStr(dmRentCar.ZTAlugarRentCar_Veiculo_Vel_id.AsString);
 dmRentCar.ZTCadVeiculo.Filtered := True;
 if not dmRentCar.ZTCadVeiculo.IsEmpty then
  Begin
    btnSalvar.Enabled := True;
  end;

end;

procedure TfrmLocacao.DBLookupClienteClick(Sender: TObject);
begin
 dmRentCar.ZTPessoa.Filtered := False;
 dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZTPesFisRentCar_Pessoa_Pes_id.AsString);
 dmRentCar.ZTPessoa.Filtered := True;
end;

procedure TfrmLocacao.tsLocacaoShow(Sender: TObject);
begin
 opVec := 'L';
end;

procedure TfrmLocacao.tsReservaShow(Sender: TObject);
begin
opVec := 'R';
end;

procedure TfrmLocacao.btnConsultarLocClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultarLocacoes, frmConsultarLocacoes);
  if frmRentCarPrincipal.veiculo = 'PFL' then
  Begin
    frmConsultarLocacoes.DBLookupCliente.ListSource := dmRentCar.dsTPesFis;
    frmConsultarLocacoes.DBLookupCliente.ListField := 'PesFis_Nome';
    frmConsultarLocacoes.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';
  end else
  if frmRentCarPrincipal.veiculo = 'PFL' then
  Begin
    frmConsultarLocacoes.DBLookupCliente.ListSource := dmRentCar.dsTPesJu;
    frmConsultarLocacoes.DBLookupCliente.ListField := 'PesJu_NmFantasia';
    frmConsultarLocacoes.DBLookupCliente.KeyField := 'RentCar_Pessoa_Pes_id';

  end;
  frmConsultarLocacoes.ShowModal;
  frmConsultarLocacoes.Free;
end;

end.
