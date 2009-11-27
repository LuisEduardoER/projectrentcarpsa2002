unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, ComCtrls, Grids, DBGrids,
  WinSkinData, InvokeRegistry, Rio, SOAPHTTPClient;

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
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    btnConsultar: TButton;
    btnSair: TButton;
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
    btnCadastar: TButton;
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
    DBCBEstado: TDBComboBox;
    DBENumero: TDBEdit;
    lblNumero: TLabel;
    lblResCPF: TLabel;
    lblResCNPJ: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    function ValidEmail(email: string): boolean;
    procedure btnCadastarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    function sBreakApart(BaseString, BreakString: string; StringList: TStringList): TStringList;
    function CPF(num: string): boolean;
    procedure DBENomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBECPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBERGKeyPress(Sender: TObject; var Key: Char);
    procedure DBCBEstCivilKeyPress(Sender: TObject; var Key: Char);
    procedure DBECNHKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBENmFantKeyPress(Sender: TObject; var Key: Char);
    procedure DBERzSocialKeyPress(Sender: TObject; var Key: Char);
    function confereCPF(cpf:string):string ;
    function confereCNPJ(cnpj:string):string;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
 atom_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':','\', '/', '"', '.', '[', ']', #127];  quoted_string_chars = [#0..#255] - ['"', #13, '\'];  letters = ['A'..'Z', 'a'..'z'];  letters_digits = ['0'..'9', 'A'..'Z', 'a'..'z'];  subdomain_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];

type
 States = (STATE_BEGIN, STATE_ATOM, STATE_QTEXT, STATE_QCHAR, STATE_QUOTE, STATE_LOCAL_PERIOD, STATE_EXPECTING_SUBDOMAIN, STATE_SUBDOMAIN, STATE_HYPHEN);

var
  frmCadClientes: TfrmCadClientes;

implementation

uses UBCliente, UDMRentCar, UCadVeiculo, URentCarPrincipal, DB, cep;

{$R *.dfm}

procedure TfrmCadClientes.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCadClientes.btnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
  frmConsultaClientes.ShowModal;
  frmConsultaClientes.Free;
end;

//Rotina para inserir um Cliente no Banco
procedure TfrmCadClientes.btnSalvarClick(Sender: TObject);
Var
cnpj,cpf:string;
begin
  //Comando para inserir o Endere�o do Cliente
  dmRentCar.ZTEndereco.Post;
  //Comando para o cliente receber o c�digo do endere�o
  dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.Value := dmRentCar.ZTEnderecoEnd_Id.Value;
  //Chamada da fun��o para verifica a validade ou n�o do e-mail
  if ValidEmail(DBEmail.Text) then
  Begin
   //Comando para inserir um Cliente no Banco
   dmRentCar.ZTPessoa.Post;
   //Caso o cadastro seja para Cliente Pessoa Fisica
   if frmRentCarPrincipal.tipo = 'PF' then
   Begin
    dmRentCar.ZTPesFisRentCar_Pessoa_Pes_id.Value := dmRentCar.ZTPessoaPes_id.Value;
    dmRentCar.ZTPesFisPesFis_Validade.Value :=  DateValidade.Date;
    if frmRentCarPrincipal.tipo = 'FU' then
    Begin
      dmRentCar.ZTPesFisPesFis_Tipo.Value := 'F';
    end else
    Begin
      dmRentCar.ZTPesFisPesFis_Tipo.Value := 'C';
    end;
       cpf := DBECPF.Text;
       lblResCPF.Caption := confereCPF(cpf);
    if lblResCPF.Caption <> 'CPF Invalido' then
    Begin
      dmRentCar.ZTPesFis.Post;
    end else
    Begin
      DBECPF.SetFocus;
    end;
   end else
   //Caso o cadastro seja para Cliente Pessoa Juridica
   if frmRentCarPrincipal.tipo = 'PJ' then
   Begin
    cpf:= DBECPF.Text;
    lblResCNPJ.Caption := confereCNPJ(cnpj);
    if lblResCPF.Caption <> 'CNPJ Inv�lido' then
    Begin
    dmRentCar.ZTPesJuRentCar_Pessoa_Pes_id.Value := dmRentCar.ZTPessoaPes_id.Value;
    dmRentCar.ZTPesJu.Post;
    end else
    Begin
      DBECNPJ.SetFocus;
    end;
  end else
  Begin
     ShowMessage('E-mail invalido');
  end;
  end;


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

procedure TfrmCadClientes.btnCadastarClick(Sender: TObject);
begin
 dmRentCar.ZTEndereco.Insert;
 dmRentCar.ZTPessoa.Insert;

 if frmRentCarPrincipal.tipo = 'PF' then
 Begin
   dmRentCar.ZTPesFis.Insert;
 end else
 if frmRentCarPrincipal.tipo = 'PJ' then
  Begin
   dmRentCar.ZTPesJu.Insert;
  end;
end;

procedure TfrmCadClientes.btnBuscarClick(Sender: TObject);
var
ObjSoap : CEPServicePort;
Num, texto : string;
t: TStringList;
ListBox: TListBox;
begin
 ObjSoap:=HTTCEP as CEPServicePort;

 Num:= DBECEP.Text;

 texto := (ObjSoap.obterLogradouroAuth(Num, 'Alan','123456'));

 ListBox := TListBox.CreateParented(Self.Handle);

 t := TStringList.create;
 ListBox.Items.Assign(sBreakApart(texto, ', ', t));
 DBEndereco.Text := ListBox.Items.Strings[0];
 DBEBairro.Text := ListBox.Items.Strings[1];
 DBECidade.Text := ListBox.Items.Strings[2];
 DBCBEstado.Text := ListBox.Items.Strings[3];
 t.free;

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
  if key = #13 then
    Begin
      DBECPF.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBECPFKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Begin
      messagebox(Application.Handle, Pchar ('O CPF ' +DBECPF.Text+ ' n�o existe, deseja continuar assim mesmo?'), 'Aten��o', MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
      DBECPF.SetFocus;
      DBERG.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBERGKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
      DBCBEstCivil.SetFocus;
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
  if key = #13 then
    Begin
      DateValidade.SetFocus;
    end;
end;

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTEndereco.Edit;
 dmRentCar.ZTPessoa.Edit;
 if frmRentCarPrincipal.tipo = 'PF' then
 Begin
   dmRentCar.ZTPesFis.Edit;
 end else
 Begin
   dmRentCar.ZTPesJu.Edit;
 end;
end;

procedure TfrmCadClientes.DBENmFantKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Begin
      DBERzSocial.SetFocus;
    end;
end;

procedure TfrmCadClientes.DBERzSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
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

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
 dmRentCar.ZTPessoa.Delete;
 dmRentCar.ZTPesFis.Delete;
end;

procedure TfrmCadClientes.btnLimparClick(Sender: TObject);
begin
  dmRentCar.ZTPessoa.ClearFields;
   if frmRentCarPrincipal.tipo = 'PF' then
 Begin
   dmRentCar.ZTPesFis.ClearFields;
 end else
 if frmRentCarPrincipal.tipo = 'PJ' then
  Begin
   dmRentCar.ZTPesJu.ClearFields;
  end;
end;

end.
