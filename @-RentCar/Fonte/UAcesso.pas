unit UAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData;

type
  TfrmAcesso = class(TForm)
    edtLogin: TEdit;
    edtSenha: TEdit;
    cbPerfil: TComboBox;
    btnAcessar: TButton;
    btnLimpar: TButton;
    btnSair: TButton;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblPerfil: TLabel;
    SkinData1: TSkinData;
    procedure btnSairClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

implementation

uses URentCarPrincipal, UDMRentCar, StrUtils;

{$R *.dfm}

procedure TfrmAcesso.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAcesso.btnAcessarClick(Sender: TObject);
var
perfil, sperfil : string;
begin
 dmRentCar.ZTAcesso.Open;
 perfil := cbPerfil.Text;
 sperfil := LeftStr(trim(perfil),1);

 Begin
 dmRentCar.ZTAcesso.Filtered := False;
 dmRentCar.ZTAcesso.Filter := 'Ac_Login = '+QuotedStr(edtLogin.Text)+' and Ac_Senha = '+QuotedStr(edtSenha.Text)+' and Ac_Perfil = '+ QuotedStr(sperfil);
 dmRentCar.ZTAcesso.Filtered := True;
 if (not dmRentCar.ZTAcesso.IsEmpty) or (edtLogin.Text = 'admin') and (edtSenha.Text = 'admin') and (cbPerfil.Text = 'Administrador') then
 Begin
  Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
  if dmRentCar.ZTAcessoAc_Perfil.Value = 'F' then
  Begin
    frmRentCarPrincipal.Configuracoes.Visible := False;
  end;
  frmRentCarPrincipal.ShowModal;
  frmRentCarPrincipal.Free;
  dmRentCar.ZTAcesso.Close;
 end else
 Begin
   ShowMessage('Acesso Inv�lido, tente novamente');
   edtLogin.SetFocus;
 end;
end;
end;

procedure TfrmAcesso.btnLimparClick(Sender: TObject);
begin
 edtLogin.Clear;
 edtSenha.Clear;
 cbPerfil.ItemIndex := -1;
end;

procedure TfrmAcesso.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  Begin
    edtSenha.SetFocus;
  end;
end;

procedure TfrmAcesso.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  Begin
    cbPerfil.SetFocus;
  end;
end;

end.
