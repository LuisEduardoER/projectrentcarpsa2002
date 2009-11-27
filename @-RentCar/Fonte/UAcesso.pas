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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

implementation

uses URentCarPrincipal, UDMRentCar;

{$R *.dfm}

procedure TfrmAcesso.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAcesso.btnAcessarClick(Sender: TObject);
begin
 dmRentCar.ZTAcesso.Open;
 dmRentCar.ZTAcesso.Filtered := False;
 dmRentCar.ZTAcesso.Filter := 'Ac_Login = '+QuotedStr(edtLogin.Text)+' and Ac_Senha = '+QuotedStr(edtSenha.Text)+' and Ac_Perfil = '+ QuotedStr(cbPerfil.Text);
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

end.
