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
    procedure FormShow(Sender: TObject);
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
 dmRentCar.ZTAcesso.Filtered := False;
 dmRentCar.ZTAcesso.Filter := 'Ac_Login = '+QuotedStr(edtLogin.Text)+' and Ac_Senha = '+QuotedStr(edtSenha.Text)+' and Ac_Perfil ='+ QuotedStr(sperfil);
 dmRentCar.ZTAcesso.Filtered := True;
 if not dmRentCar.ZTAcesso.IsEmpty then
 Begin
  Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
  frmRentCarPrincipal.ShowModal;
  frmRentCarPrincipal.Free;
 end else
 Begin
   ShowMessage('Acesso Inválido, tente novamente');
 end;
end;

procedure TfrmAcesso.FormShow(Sender: TObject);
begin
 cbPerfil.MaxLength:= 1;
end;

end.
