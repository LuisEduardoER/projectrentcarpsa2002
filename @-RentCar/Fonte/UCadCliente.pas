unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, ComCtrls, Grids, DBGrids,
  WinSkinData, InvokeRegistry, Rio, SOAPHTTPClient, Buttons, ExtDlgs;

type
  TfrmCadClientes = class(TForm)
    pgcClientes: TPageControl;
    tsDadosPF: TTabSheet;
    DBENome: TDBEdit;
    DBECPF: TDBEdit;
    DBERG: TDBEdit;
    dbrgSexo: TDBRadioGroup;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblRG: TLabel;
    DBGClientes: TDBGrid;
    DBECNH: TDBEdit;
    lblCNH: TLabel;
    DateValidade: TDateTimePicker;
    lblValidade: TLabel;
    DBCBEstCivil: TDBComboBox;
    Label1: TLabel;
    tsDadosPJ: TTabSheet;
    Label2: TLabel;
    DBENmFant: TDBEdit;
    Label3: TLabel;
    DBECNPJ: TDBEdit;
    DBERzSocial: TDBEdit;
    Label5: TLabel;
    tsEndereco: TTabSheet;
    tsContato: TTabSheet;
    lblCEP: TLabel;
    DBECEP: TDBEdit;
    lblTelefone: TLabel;
    DBTelRes: TDBEdit;
    lblCelular: TLabel;
    DBCel: TDBEdit;
    DBEmail: TDBEdit;
    lblEmail: TLabel;
    DBTelOp: TDBEdit;
    lblTelOp: TLabel;
    btnBuscar: TButton;
    HTTCEP: THTTPRIO;
    gbEndereco: TGroupBox;
    lblEndereco: TLabel;
    DBEndereco: TDBEdit;
    lblBairro: TLabel;
    DBEBairro: TDBEdit;
    lblCidade: TLabel;
    DBECidade: TDBEdit;
    lblEstado: TLabel;
    DBENumero: TDBEdit;
    lblNumero: TLabel;
    lblResCPFCNPJ: TLabel;
    lblResCNPJ: TLabel;
    DBCBEstado: TDBComboBox;
    lblStatusCad: TLabel;
    DBImgCli: TDBImage;
    OpenPicture: TOpenPictureDialog;
    btnCapImg: TButton;
    btnCadastrar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    BitBtn4: TBitBtn;
    btnProcurar: TBitBtn;
    btnAlterar: TBitBtn;
    DateNascimento: TDateTimePicker;
    Label4: TLabel;
    function ValidEmail(email: string): boolean;
    procedure btnBuscarClick(Sender: TObject);
    function sBreakApart(BaseString, BreakString: string; StringList: TStringList): TStringList;
    function CPF(num: string): boolean;
    procedure DBENomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBERGKeyPress(Sender: TObject; var Key: Char);
    procedure DBCBEstCivilKeyPress(Sender: TObject; var Key: Char);
    procedure DBECNHKeyPress(Sender: TObject; var Key: Char);
    procedure DBENmFantKeyPress(Sender: TObject; var Key: Char);
    procedure DBERzSocialKeyPress(Sender: TObject; var Key: Char);
    function confereCPF(cpf:string):string ;
    function confereCNPJ(cnpj:string):string;
    procedure FormShow(Sender: TObject);
    procedure DBTelResKeyPress(Sender: TObject; var Key: Char);
    procedure DBTelOpKeyPress(Sender: TObject; var Key: Char);
    procedure DBCelKeyPress(Sender: TObject; var Key: Char);
    procedure CadPF;
    procedure CadPJ;
    procedure DBGClientesCellClick(Column: TColumn);
    procedure DBECEPKeyPress(Sender: TObject; var Key: Char);
    procedure DBECPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBECNPJKeyPress(Sender: TObject; var Key: Char);
    procedure DBECPFExit(Sender: TObject);
    procedure DBEmailExit(Sender: TObject);
    procedure DBECNHExit(Sender: TObject);
    procedure DBECNPJExit(Sender: TObject);
    procedure DBTelResExit(Sender: TObject);
    procedure DBTelOpExit(Sender: TObject);
    procedure DBCelExit(Sender: TObject);
    procedure btnCapImgClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DateNascimentoExit(Sender: TObject);
    procedure DateNascimentoKeyPress(Sender: TObject; var Key: Char);



  private
    { Private declarations }
  public
    estado, op : string;
    { Public declarations }
  end;

const
 atom_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':','\', '/', '"', '.', '[', ']', #127];  quoted_string_chars = [#0..#255] - ['"', #13, '\'];  letters = ['A'..'Z', 'a'..'z'];  letters_digits = ['0'..'9', 'A'..'Z', 'a'..'z'];  subdomain_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];

type
 States = (STATE_BEGIN, STATE_ATOM, STATE_QTEXT, STATE_QCHAR, STATE_QUOTE, STATE_LOCAL_PERIOD, STATE_EXPECTING_SUBDOMAIN, STATE_SUBDOMAIN, STATE_HYPHEN);

var
  frmCadClientes: TfrmCadClientes;

implementation

uses UDMRentCar, UCadVeiculo, URentCarPrincipal, DB, cep, UConsultas,
  UCapImage, DateUtils;

{$R *.dfm}

//Rotina para inserir um Cliente no Banco
function valida_new_cnh(cnh: String): Boolean;
var
Soma, Conta, Dv, Digito, i: Integer;
CnhN: String;
NumerosIguais: Boolean;
begin
  Result := False;
  NumerosIguais := True;

  CnhN := FormatFloat('00000000000', StrToFloat(trim(cnh)));
  Soma := 0;

  {Validando se todos o n�meros s�o iguais}
  for i := 1 to length(CnhN) - 1 do
  if CnhN[1] <> CnhN[i] then
  NumerosIguais := False;

  if NumerosIguais then
  Exit;

  for i := 1 to length(CnhN) - 2 do
  Soma := Soma + (StrtoInt(CnhN[i]) * (i + 1));

  Conta := (Soma div 11) * 11;
  if (Soma - Conta) < 2 then
  Dv := 0
  else
  Dv := 11 - (Soma - Conta);

  Digito := StrToInt(CnhN[10]);

  if Digito = Dv then
  Result := True;
  end;

//Fu���o que verifica se o e-mail digitado pelo usu�rio � ou n�o v�lido
function TfrmCadClientes.ValidEmail(email: string): boolean;
var
State: States;
i, n, subdomains: integer;
c: char;
begin
  State := STATE_BEGIN;
  n := Length(email);
  i := 1;
  subdomains := 1;
  while (i <= n) do begin
    c := email[i];
  case State of
    STATE_BEGIN:
    if c in atom_chars then
      State := STATE_ATOM
    else if c = '"' then
      State := STATE_QTEXT
    else
      break;
      STATE_ATOM:
    if c = '@' then
      State := STATE_EXPECTING_SUBDOMAIN
    else if c = '.' then
      State := STATE_LOCAL_PERIOD
    else if not (c in atom_chars) then
      break;
      STATE_QTEXT:
    if c = '\' then
      State := STATE_QCHAR
    else if c = '"' then
      State := STATE_QUOTE
    else if not (c in quoted_string_chars) then
      break;
      STATE_QCHAR:
      State := STATE_QTEXT;
      STATE_QUOTE:
    if c = '@' then
      State := STATE_EXPECTING_SUBDOMAIN
    else if c = '.' then
      State := STATE_LOCAL_PERIOD
    else
      break;
      STATE_LOCAL_PERIOD:
    if c in atom_chars then
      State := STATE_ATOM
    else if c = '"' then
      State := STATE_QTEXT
    else
      break;
      STATE_EXPECTING_SUBDOMAIN:
    if c in letters then
      State := STATE_SUBDOMAIN
    else
      break;
      STATE_SUBDOMAIN:
    if c = '.' then begin
      inc(subdomains);
      State := STATE_EXPECTING_SUBDOMAIN
    end else if c = '-' then
      State := STATE_HYPHEN
    else if not (c in letters_digits) then
      break;
      STATE_HYPHEN:
    if c in letters_digits then
      State := STATE_SUBDOMAIN
    else if c <> '-' then
      break;
    end;
      inc(i);
    end;
    if i <= n then
      Result := False
    else
      Result := (State = STATE_SUBDOMAIN) and (subdomains >= 2);
end;

//rotina para efetuar cadastro
procedure TfrmCadClientes.btnBuscarClick(Sender: TObject);
var
ObjSoap : CEPServicePort;
Num, texto: string;
t: TStringList;
ListBox: TListBox;
begin
  ObjSoap:=HTTCEP as CEPServicePort;

  Num:= DBECEP.Text;
  texto := (ObjSoap.obterLogradouroAuth(Num, 'Alan','123456'));

  if (texto = 'Cep '+Num+' n�o encontrado') then
  Begin
     application.messagebox(PChar('Cep '+Num+' n�o foi encontrado'),'Aviso',48);
  end else
  if (texto = 'CEP n�o est� no formato 00000-000 ou 00000000') then
  Begin
    application.messagebox('CEP n�o est� no formato 00000-000 ou 00000000','Aviso',48);
  end else
  Begin
  ListBox := TListBox.CreateParented(Self.Handle);
  t := TStringList.create;
  ListBox.Items.Assign(sBreakApart(texto, ', ', t));
  DBEndereco.Text := ListBox.Items.Strings[0];
  DBEBairro.Text := ListBox.Items.Strings[1];
  DBECidade.Text := ListBox.Items.Strings[2];
  estado := ListBox.Items.Strings[3];
  dmRentCar.ZTEnderecoEnd_Estado.Value := estado;
  t.free;
  gbEndereco.Enabled := True;
  end;
end;

function TfrmCadClientes.sBreakApart(BaseString, BreakString: string;
  StringList: TStringList): TStringList;
var
EndOfCurrentString: byte;
begin
  repeat
    EndOfCurrentString := Pos(BreakString, BaseString);
  if EndOfCurrentString = 0 then
    StringList.add(BaseString)
  else
    StringList.add(Copy(BaseString, 1, EndOfCurrentString - 1));
    BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);

  until EndOfCurrentString = 0;
    result := StringList;
end;

function TfrmCadClientes.CPF(num: string): boolean;
var
  n1,n2,n3,n5,n6,n7,n9,n10,n11: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  n1:=StrToInt(num[1]); {1}
  n2:=StrToInt(num[2]); {2}
  n3:=StrToInt(num[3]); {3}
  n5:=StrToInt(num[5]); {4}
  n6:=StrToInt(num[6]); {5}
  n7:=StrToInt(num[7]); {6}
  n9:=StrToInt(num[9]); {7}
  n10:=StrToInt(num[10]); {8}
  n11:=StrToInt(num[11]); {9}
  d1:=n11*2+n10*3+n9*4+n7*5+n6*6+n5*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
  if d1>=10 then
    d1:=0;
    d2:=d1*2+n11*3+n10*4+n9*5+n7*6+n6*7+n5*8+n3*9+n2*10+n1*11;
    d2:=11-(d2 mod 11);
  if d2>=10 then
    d2:=0;
    calculado:=inttostr(d1)+inttostr(d2);
    digitado:=num[13]+num[14];
  if (calculado=digitado) then
    cpf:=true
  else
    cpf:=false;
end;

procedure TfrmCadClientes.DBENomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

  if key = #13 then
    Begin
      DBECPF.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBERGKeyPress(Sender: TObject; var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
   Begin
    Key := #0;
   end;

   if key = #13 then
    Begin
      DateNascimento.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBCBEstCivilKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
    Begin
      DBECNH.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBECNHKeyPress(Sender: TObject; var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
  Begin
   Key := #0;
  end;

  if key = #13 then
    Begin
      DateValidade.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBENmFantKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

  if key = #13 then
    Begin
      DBERzSocial.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBERzSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

  if key = #13 then
    Begin
      DBECNPJ.SetFocus;
    end;
end;


function TfrmCadClientes.confereCPF(cpf: string): string;
var vet:array[1..11]of integer;
tot,i,j,r1,r2:integer;
begin
  j:=10;
  tot:=0;
  for i:=1 to 11 do
    vet[i]:=strtoint(copy(cpf,i,1));
  for i:=1 to 9 do
  begin
    tot:=tot+(vet[i]*j);
    j:=j-1;
  end;
    tot:= tot mod 11;
  if (tot<2) then
    r1:=0
  else
    r1:=11-tot;
    j:=11;
    tot:=0;
  for i:=1 to 10 do
  begin
    tot:=tot+(vet[i]*j);
    j:=j-1;
  end;
    tot:= tot mod 11;
  if (tot<2) then
    r2:=0
  else
    r2:=11-tot;
  if (r1=vet[10]) and (r2=vet[11]) then
    result:='CPF V�lido'
  else
    result:='CPF Invalido';
end;

function TfrmCadClientes.confereCNPJ(cnpj: string): string;
var a,b:array[1..14]of integer;
resto,resto1,dgt1,dgt2,tot,i,j:integer;
begin
  j:=5;
  tot:=0;
  for i:=1 to 14 do
  begin
    a[i]:=strtoint(copy(cnpj,i,1));
    b[i]:=strtoint(copy(cnpj,i,1));
  end;
  for i:=1 to 4 do
  begin
    a[i]:=(a[i]*j);
    j:=(j-1);
  end;
  j:=9;
  for i:=5 to 12 do
  begin
    a[i]:=a[i]*j;
    j:=j-1;
  end;
  for i:=1 to 12 do
    tot:=(tot+a[i]);
    resto:=(tot mod 11);
  if (resto<2) then
    dgt1:=0
  else
    dgt1:=11-resto;
    j:=6;
  for i:=1 to 5 do
  begin
    b[i]:=(b[i]*j);
    j:=(j-1);
  end;
    j:=9;
  for i:=6 to 13 do
  begin
    b[i]:=(b[i]*j);
    j:=(j-1);
  end;
    tot:=0;
  for i:=1 to 13 do
    tot:=tot+b[i];
    resto1:=tot mod 11;
  if (resto1<2) then
    dgt2:=0
  else
    dgt2:=(11-resto1);
  if (dgt1=a[13]) and (dgt2=b[14]) then
    result:='CNPJ V�lido'
  else
    result:='CNPJ Invalido';
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
 with dmRentCar do
 Begin
    if frmRentCarPrincipal.tipo = 'PF' then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_Id, rentcar_pesfis.PesFis_nome as Nome, rentcar_pesfis.pesfis_Sexo as Sexo, rentcar_pessoa.pes_TelRes as TelRes, rentcar_pesfis.pesfis_RG as RG, rentcar_pesfis.pesfis_CPF as CPF');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id and rentcar_pesfis.PesFis_Tipo = "C"');
      ZQCliente.Open;
      ZQCliente.FieldByName('Pes_Id').DisplayLabel := 'Codigo';
    end else
    if frmRentCarPrincipal.tipo = 'PJ' then
     Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_Id, rentcar_pesju.PesJu_NmFantasia as NmFantasia, rentcar_pesju.PesJu_CNPJ as CNPJ, rentcar_pessoa.pes_TelRes as TelRes, rentcar_pessoa.pes_TelOP as TelOP, rentcar_pessoa.pes_Cel as CEL');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesju.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
      ZQCliente.FieldByName('Pes_Id').DisplayLabel := 'Codigo';
     end else
     if frmRentCarPrincipal.tipo = 'FUN' then
     Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_Id,rentcar_pesfis.PesFis_nome as Nome, rentcar_pesfis.pesfis_Sexo as Sexo, rentcar_pessoa.pes_TelRes as TelRes, rentcar_pesfis.pesfis_RG as RG, rentcar_pesfis.pesfis_CPF as CPF');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pesfis.PesFis_Tipo = "F"');
      ZQCliente.Open;
      ZQCliente.FieldByName('Pes_Id').DisplayLabel := 'Codigo';
     end;
     ZQCliente.Open;
  end;
end;

procedure TfrmCadClientes.DBTelResKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    Begin
      DBTelOp.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBTelOpKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
    Begin
      DBCel.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBCelKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Begin
      DBEmail.SetFocus;
    end;
end;

procedure TfrmCadClientes.CadPF;
begin
  if (DBENome.Text = '') then
  Begin
    ShowMessage('Nome � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPF;
    DBENome.SetFocus;
  end else
  if (DBECPF.Text = '') or (DBECPF.MaxLength < 11) then
  Begin
    ShowMessage('CPF � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPF;
    DBECPF.SetFocus;
   end else
  if (DBERG.Text = '') then
  Begin
    ShowMessage('RG � um campo obrigat�rio');
     pgcClientes.ActivePage := tsDadosPF;
     DBERG.SetFocus;
   end else
  if (dbrgSexo.ItemIndex = -1) then
  Begin
    ShowMessage('Sexo � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPF;
  end else
  if (DBECNH.Text = '') or (DBECNH.MaxLength < 11) then
  Begin
    ShowMessage('CNH � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPF;
    DBECNH.SetFocus;
  end else
  if (DBECEP.Text = '') then
  Begin
    ShowMessage('CEP � um campo obrigat�rio');
    pgcClientes.ActivePage := tsEndereco;
    DBECEP.SetFocus;
  end else
  if (DBENumero.Text = '') then
  Begin
    ShowMessage('Numero � um campo obrigat�rio');
    pgcClientes.ActivePage := tsEndereco;
    DBENumero.SetFocus;
  end else
  if (DBTelRes.Text = '') or (DBTelOp.Text = '') or (DBCel.Text = '') or (DBEmail.Text = '')  then
  Begin
    ShowMessage('Preencha pelo menos um tipo de contato');
    pgcClientes.ActivePage := tsContato;
  end else
  Begin
    Begin
     dmRentCar.ZTEndereco.Post;
     dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.Value := dmRentCar.ZTEnderecoEnd_Id.Value;
     dmRentCar.ZTPessoa.Post;
     dmRentCar.ZTPesFisRentCar_Pessoa_Pes_id.Value := dmRentCar.ZTPessoaPes_id.Value;
     dmRentCar.ZTPesFisPesFis_DtNascimento.Value := DateNascimento.Date;
     dmRentCar.ZTPesFisPesFis_Validade.Value :=  DateValidade.Date;
    if frmRentCarPrincipal.cli = 'FUN' then
    Begin
      dmRentCar.ZTPesFisPesFis_Tipo.Value := 'F';
    end else
    if frmRentCarPrincipal.cli = 'cli' then
    Begin
      dmRentCar.ZTPesFisPesFis_Tipo.Value := 'C';
    end;

    if op = 'C' then
    Begin
      dmRentCar.ZQFunctions.Close;
      dmRentCar.ZQFunctions.SQL.Clear;
      dmRentCar.ZQFunctions.SQL.Add('select PesFis_CPF from rentcar_pesfis');
      dmRentCar.ZQFunctions.SQL.Add('where PesFis_CPF = "'+DBECPF.Text+'"');
      dmRentCar.ZQFunctions.Open;
    if not dmRentCar.ZQFunctions.IsEmpty then
    Begin
      ShowMessage('CPF j� cadastrado no sistema');
      pgcClientes.ActivePage := tsDadosPF;
      DBECPF.SetFocus;
      dmRentCar.ZTPessoa.Edit;
      dmRentCar.ZTEndereco.Edit;
    end else
    Begin
      dmRentCar.ZTPesFis.Post;
      btnCadastrar.Enabled := True;
    end;
    end else
    Begin
      dmRentCar.ZTPesFis.Post;
    end;
      lblStatusCad.Visible := True;
      lblStatusCad.Caption := 'Cadastro Realizado com Sucesso...';
      btnCadastrar.Enabled := True;
      btnSalvar.Enabled := False;
      btnAlterar.Enabled := True;
      btnExcluir.Enabled := True;
      dmRentCar.ZQCliente.Refresh;
      gbEndereco.Enabled := False;
      tsDadosPF.Enabled := False;
      tsEndereco.Enabled := False;
      tsContato.Enabled := False;
      pgcClientes.ActivePage := tsDadosPF;
    end;
  end;
end;

procedure TfrmCadClientes.CadPJ;
begin
  if (DBENmFant.Text = '') then
  Begin
    ShowMessage('Nome Fantasia � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPJ;
    DBENmFant.SetFocus;
  end else
  if (DBERzSocial.Text = '') then
  Begin
    ShowMessage('Raz�o Social � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPJ;
    DBERzSocial.Text;
  end else
  if (DBECNPJ.Text = '') or (DBECNPJ.MaxLength < 14) then
  Begin
    ShowMessage('CNPJ � um campo obrigat�rio');
    pgcClientes.ActivePage := tsDadosPJ;
    DBECNPJ.SetFocus;
  end else
  if (DBECEP.Text = '') then
  Begin
    ShowMessage('CEP � um campo obrigat�rio');
    pgcClientes.ActivePage := tsEndereco;
    DBECEP.SetFocus;
  end else
  if (DBENumero.Text = '') then
  Begin
    ShowMessage('Numero � um campo obrigat�rio');
    pgcClientes.ActivePage := tsEndereco;
    DBENumero.SetFocus;
  end else
  if (DBTelRes.Text = '') or (DBTelOp.Text = '') or (DBCel.Text = '') or (DBEmail.Text = '')  then
  Begin
    ShowMessage('Preencha pelo menos um tipo de contato');
    pgcClientes.ActivePage := tsContato;
  end else
  Begin
    Begin
      dmRentCar.ZTEndereco.Post;
      dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.Value := dmRentCar.ZTEnderecoEnd_Id.Value;
      dmRentCar.ZTPessoa.Post;
      dmRentCar.ZTPesJuRentCar_Pessoa_Pes_id.Value := dmRentCar.ZTPessoaPes_id.Value;
      dmRentCar.ZTPesJuRentCar_PesFis_PesFis_id.Value := 0;
      if op = 'C' then
      Begin
        dmRentCar.ZQFunctions.Close;
        dmRentCar.ZQFunctions.SQL.Clear;
        dmRentCar.ZQFunctions.SQL.Add('select PesJu_CNPJ from rentcar_pesju');
        dmRentCar.ZQFunctions.SQL.Add('where PesJu_CNPJ = "'+DBECNPJ.Text+'"');
        dmRentCar.ZQFunctions.Open;
      if not dmRentCar.ZQFunctions.IsEmpty then
      Begin
        ShowMessage('CNPJ j� cadastrado no sistema');
        pgcClientes.ActivePage := tsDadosPJ;
        DBECNPJ.SetFocus;
        dmRentCar.ZTEndereco.Edit;
        dmRentCar.ZTEndereco.Edit;
      end else
      Begin
        dmRentCar.ZTPesJu.Post;

      end;
      end else
      Begin
        dmRentCar.ZTPesJu.Post;
      end;
      btnCadastrar.Enabled := True;
      btnSalvar.Enabled := False;
      btnAlterar.Enabled := True;
      btnExcluir.Enabled := True;
      lblStatusCad.Visible := True;
      lblStatusCad.Caption := 'Cadastro Realizado com Sucesso...';
      gbEndereco.Enabled := False;
      dmRentCar.ZQCliente.Refresh;
      tsDadosPJ.Enabled := False;
      tsEndereco.Enabled := False;
      tsContato.Enabled := False;
      pgcClientes.ActivePage := tsDadosPJ;
    end;
    end;
end;

procedure TfrmCadClientes.DBGClientesCellClick(Column: TColumn);
begin
 if not dmRentCar.ZQCliente.IsEmpty then
 Begin
  btnExcluir.Enabled := True;
  btnAlterar.Enabled := True;
   if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN') then
   Begin
    dmRentCar.ZTPesFis.Open;
    dmRentCar.ZTPessoa.Open;
    dmRentCar.ZTEndereco.Open;
    dmRentCar.ZTAcesso.Open;

    dmRentCar.ZTPessoa.Filtered := False;
    dmRentCar.ZTPessoa.Filter := 'Pes_Id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
    dmRentCar.ZTPessoa.Filtered := True;

    dmRentCar.ZTPesFis.Filtered := False;
    dmRentCar.ZTPesFis.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
    dmRentCar.ZTPesFis.Filtered := True;

    dmRentCar.ZTEndereco.Filtered := False;
    dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
    dmRentCar.ZTEndereco.Filtered := True;

    dmRentCar.ZTAcesso.Filtered := False;
    dmRentCar.ZTAcesso.Filter := 'RentCar_PesFis_PesFis_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
    dmRentCar.ZTAcesso.Filtered := True;
    DateValidade.Date := dmRentCar.ZTPesFisPesFis_Validade.Value;
    DateNascimento.Date := dmRentCar.ZTPesFisPesFis_DtNascimento.Value;
   end else
   if frmRentCarPrincipal.tipo = 'PJ' then
   Begin
    dmRentCar.ZTPesJu.Open;
    dmRentCar.ZTPessoa.Open;
    dmRentCar.ZTEndereco.Open;

    dmRentCar.ZTPessoa.Filtered := False;
    dmRentCar.ZTPessoa.Filter := 'Pes_Id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
    dmRentCar.ZTPessoa.Filtered := True;
    dmRentCar.ZTPesJu.Filtered := False;
    dmRentCar.ZTPesJu.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
    dmRentCar.ZTPesJu.Filtered := True;
    dmRentCar.ZTEndereco.Filtered := False;
    dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
    dmRentCar.ZTEndereco.Filtered := True;
   end;
end else
 Begin
   ShowMessage('N�o existe(m) dado(s) para sere(m) excluido');
 end;
end;

procedure TfrmCadClientes.DBECEPKeyPress(Sender: TObject; var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
   Key := #0;

end;

procedure TfrmCadClientes.DBECPFKeyPress(Sender: TObject; var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
  Begin
   Key := #0;
  end;

 if key = #13 then
  Begin
    DBERG.SetFocus;
  end;
end;

procedure TfrmCadClientes.DBECNPJKeyPress(Sender: TObject; var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
   Key := #0;
end;


procedure TfrmCadClientes.DBECPFExit(Sender: TObject);
var
cpf : string;
begin
   if Length(DBECPF.Text) < 11 then
   Begin
     application.messagebox('O campo CPF deve ter no m�nimo 11 numeros','Aviso',48);
     DBECPF.SetFocus;
   end else
   Begin
   cpf := DBECPF.Text;
   lblResCPFCNPJ.Caption := confereCPF(cpf);
   if lblResCPFCNPJ.Caption <> 'CPF V�lido' then
    Begin
     ShowMessage('CPF Inv�lido, digite outro');
     DBECPF.SetFocus;
    end;
   end;
end;

procedure TfrmCadClientes.DBEmailExit(Sender: TObject);
begin
  if ValidEmail(DBEmail.Text) then
  Begin
    btnSalvar.Enabled := True;
  end else
  Begin
    DBEmail.SetFocus;
    btnSalvar.Enabled := False;
  end;
end;

procedure TfrmCadClientes.DBECNHExit(Sender: TObject);
begin
  if (valida_new_cnh(DBECNH.Text) = False) then
  Begin
   application.messagebox('CNH Inexistente','Aviso',48);
   DBECNH.SetFocus; 
  end;
end;

procedure TfrmCadClientes.DBECNPJExit(Sender: TObject);
Var
cnpj : string;
begin
   if Length(DBECNPJ.Text) < 14 then
   Begin
     application.messagebox('O campo CNPJ deve ter no minino 11 n�meros','Aviso',48);
     DBECNPJ.SetFocus;
   end else
   Begin
    cnpj := DBECNPJ.Text;
    lblResCNPJ.Caption := confereCNPJ(cnpj);
    if lblResCNPJ.Caption <> 'CNPJ V�lido' then
    Begin
     application.messagebox('CNPJ Inv�lido, digite outro','Aviso',48);
     DBECNPJ.SetFocus;
    end;
   end;
end;


procedure TfrmCadClientes.DBTelResExit(Sender: TObject);
begin
if pos(' ',DBTelRes.Text) > 0 Then
begin 
 showmessage('Campo com espa�o(s) em branco digite novamente');
 DBTelRes.SetFocus;
 end;
end;

procedure TfrmCadClientes.DBTelOpExit(Sender: TObject);
begin
if pos(' ',DBTelOp.Text) > 0 Then 
begin 
 showmessage('Campo com espa�o(s) em branco digite novamente');
 DBTelOp.SetFocus;
 end;
end;

procedure TfrmCadClientes.DBCelExit(Sender: TObject);
begin
if pos(' ',DBCel.Text) > 0 Then 
begin 
 showmessage('Campo com espa�o(s) em branco digite novamente');
 DBCel.SetFocus;
 end;
end;

procedure TfrmCadClientes.btnCapImgClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCapImage, frmCapImage);
  frmCapImage.ShowModal;
  frmCapImage.Free;
end;

procedure TfrmCadClientes.btnCadastrarClick(Sender: TObject);
begin
 op := 'C';
 dmRentCar.ZTPessoa.Open;
 dmRentCar.ZTEndereco.Open;
 dmRentCar.ZTEndereco.Insert;
 dmRentCar.ZTPessoa.Insert;
 

 if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN') then
 Begin
   dmRentCar.ZTPesFis.Open;
   dmRentCar.ZTPesFis.Insert;
   tsDadosPF.Enabled := True;
   tsEndereco.Enabled := True;
   tsContato.Enabled := True;
 end else
 if frmRentCarPrincipal.tipo = 'PJ' then
  Begin
   dmRentCar.ZTPesJu.Open;
   dmRentCar.ZTPesJu.Insert;
   tsDadosPJ.Enabled := True;
   tsEndereco.Enabled := True;
   tsContato.Enabled := True;
  end;
 lblStatusCad.Visible := True;
 lblStatusCad.Caption := 'Cadastrando....';
 btnSalvar.Enabled := True;
 btnCadastrar.Enabled := False;
 btnAlterar.Enabled := False;

end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
begin
 //caso seja o cadastro de pessoa fisica ou funcionario
  if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN')  then
  Begin
   CadPF;
  end else
  // caso seja cadastro de pessoa juridica
  if frmRentCarPrincipal.tipo = 'PJ' then
  Begin
    CadPJ;
  end;

end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
{ dmRentCar.ZTPessoa.Open;
 dmRentCar.ZTPesFis.Open;
 dmRentCar.ZTEndereco.Open;
}

 dmRentCar.ZTAcesso.Open;

 if dmRentCar.ZTPessoa.IsEmpty then
 Begin
   ShowMessage('Selecione o cliente que ser� excluido');
 end else
 Begin
 if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN') then
 Begin
  dmRentCar.ZTPessoa.Filtered := False;
  dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
  dmRentCar.ZTPessoa.Filtered := True;

  dmRentCar.ZTPesFis.Filtered := False;
  dmRentCar.ZTPesFis.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTPesFis.Filtered := True;

  dmRentCar.ZTEndereco.Filtered := False;
  dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
  dmRentCar.ZTEndereco.Filtered := True;

  dmRentCar.ZTAlugar.Filtered := False;
  dmRentCar.ZTAlugar.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTAlugar.Filtered := True;

  dmRentCar.ZTChamado.Filtered := False;
  dmRentCar.ZTChamado.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTChamado.Filtered := True;

  dmRentCar.ZTAcesso.Filtered := False;
  dmRentCar.ZTAcesso.Filter := 'RentCar_PesFis_PesFis_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTAcesso.Filtered := True;

  dmRentCar.ZTPessoa.Delete;
  dmRentCar.ZTPesFis.Delete;
  dmRentCar.ZTEndereco.Delete;

  if not dmRentCar.ZTAlugar.IsEmpty then
  Begin
    dmRentCar.ZTAlugar.Delete;
  end else
  if not dmRentCar.ZTChamado.IsEmpty then
  Begin
    dmRentCar.ZTChamado.Delete;
  end else
  if not dmRentCar.ZTAcesso.IsEmpty then
  Begin
    dmRentCar.ZTAcesso.Delete;
  end;
 end else
 if (frmRentCarPrincipal.tipo = 'PF') then
 Begin
  dmRentCar.ZTPessoa.Filtered := False;
  dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
  dmRentCar.ZTPessoa.Filtered := True;

  dmRentCar.ZTPesJu.Filtered := False;
  dmRentCar.ZTPesJu.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTPesJu.Filtered := True;

  dmRentCar.ZTEndereco.Filtered := False;
  dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
  dmRentCar.ZTEndereco.Filtered := True;

  dmRentCar.ZTAlugar.Filtered := False;
  dmRentCar.ZTAlugar.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTAlugar.Filtered := True;

  dmRentCar.ZTChamado.Filtered := False;
  dmRentCar.ZTChamado.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
  dmRentCar.ZTChamado.Filtered := True;

  dmRentCar.ZTPessoa.Delete;
  dmRentCar.ZTPesJu.Delete;
  dmRentCar.ZTEndereco.Delete;

  if not dmRentCar.ZTAlugar.IsEmpty then
  Begin
    dmRentCar.ZTAlugar.Delete;
  end else
  if not dmRentCar.ZTChamado.IsEmpty then
  Begin
    dmRentCar.ZTChamado.Delete;
  end;
 end;
  dmRentCar.ZQCliente.Refresh;
 end;
end;

procedure TfrmCadClientes.btnProcurarClick(Sender: TObject);
begin
 Application.CreateForm(TfrmConsultas, frmConsultas);
 frmConsultas.tsConsultLoc.Destroy;
 frmConsultas.tsConsultVeiculos.Destroy;
 frmConsultas.tsListagemChamados.Destroy;
 frmConsultas.ShowModal;
 frmConsultas.Free;
end;

procedure TfrmCadClientes.BitBtn4Click(Sender: TObject);
begin
 close;
 dmRentCar.ZTPessoa.Filtered := False;
 dmRentCar.ZTPesJu.Filtered := False;
 dmRentCar.ZTPesFis.Filtered := False;
 dmRentCar.ZTEndereco.Filtered := False;
 dmRentCar.ZTPessoa.Close;
 dmRentCar.ZTPesJu.Close;
 dmRentCar.ZTPesFis.Close;
 dmRentCar.ZTEndereco.Close;
end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin

 dmRentCar.ZTPessoa.Cancel;
 // caso seja cadastro pessoa fisica ou funcionario
 if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN')  then
 Begin
   dmRentCar.ZTEndereco.Cancel;
   dmRentCar.ZTPesFis.Cancel;
 end else
 //caso seja cadastro de pessoa juridica
 if frmRentCarPrincipal.tipo = 'PJ' then
  Begin
   dmRentCar.ZTEndereco.Cancel;
   dmRentCar.ZTPesJu.Cancel;
  end;
end;

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTEndereco.Edit;
 dmRentCar.ZTPessoa.Edit;
 //caso seja cadastro de pessoa fisica ou funcionario
 if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN') then
 Begin
   if dmRentCar.ZTPesFis.IsEmpty then
   Begin
    ShowMessage('N�o existe(m) cliente(s) para ser(m) alterado(s)');
   end else
   Begin
    op := 'A';
     //rotina de altera��o de cadastro
    lblStatusCad.Visible := True;
    lblStatusCad.Caption := 'Alterando Cadastro...';
    dmRentCar.ZTPesFis.Edit;
    btnSalvar.Enabled := True;
    tsDadosPF.Enabled := True;
    tsEndereco.Enabled := True;
    tsContato.Enabled := True;
   end;
 end else
 //caso seja pessoa juridica
 Begin
   if dmRentCar.ZTPesJu.IsEmpty then
   Begin
    ShowMessage('N�o existe(m) cliente(s) para ser(m) alterado(s)');
   end else
   Begin
     op := 'A';
     //rotina de altera��o de cadastro
     lblStatusCad.Visible := True;
     lblStatusCad.Caption := 'Alterando Cadastro...';
     dmRentCar.ZTPesJu.Edit;
     btnSalvar.Enabled := True;
     tsDadosPJ.Enabled := True;
     tsEndereco.Enabled := True;
     tsContato.Enabled := True;
   end;
 end;

end;

procedure TfrmCadClientes.DateNascimentoExit(Sender: TObject);
Var
dias : integer;
begin
  dias := YearsBetween(DateNascimento.date, Now);

   if (dias < 18) then
   Begin
     application.messagebox('A idade permitida � maior de 18 anos','Aviso',48);
     DateNascimento.SetFocus;
   end;
end;

procedure TfrmCadClientes.DateNascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
   Begin
    Key := #0;
   end;

   if key = #13 then
    Begin
      dbrgSexo.SetFocus;
    end;
end;

end.
