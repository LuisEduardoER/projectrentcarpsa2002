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

uses URentCarPrincipal;

{$R *.dfm}

procedure TfrmAcesso.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAcesso.btnAcessarClick(Sender: TObject);
begin
 Application.CreateForm(TfrmRentCarPrincipal, frmRentCarPrincipal);
 frmRentCarPrincipal.ShowModal;
 frmRentCarPrincipal.Free;
end;

end.
