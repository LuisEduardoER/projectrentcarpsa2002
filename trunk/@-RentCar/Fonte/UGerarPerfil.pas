unit UGerarPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmGerarPerfil = class(TForm)
    gbFiltros: TGroupBox;
    btnGerarPerfil: TButton;
    edtCli: TEdit;
    btnB: TButton;
    Label1: TLabel;
    pbPerfil: TProgressBar;
    procedure btnBClick(Sender: TObject);
    procedure btnGerarPerfilClick(Sender: TObject);
  private
    { Private declarations }
  public
     perfil : string;
    { Public declarations }
  end;

var
  frmGerarPerfil: TfrmGerarPerfil;

implementation

uses UBCliente, UPerfil;

{$R *.dfm}

procedure TfrmGerarPerfil.btnBClick(Sender: TObject);
begin
 Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
 frmConsultaClientes.ShowModal;
 frmConsultaClientes.Free;
end;

procedure TfrmGerarPerfil.btnGerarPerfilClick(Sender: TObject);
var
   i:integer;
begin
  if edtCli.Text = '' then
  Begin
    ShowMessage('Escolha o Cliente');
  end else
  Begin
   pbPerfil.Max:= 5000;
   for i:= 1 to 5000 do
   Begin
      pbPerfil.Position:=i;
   end;
   close;
   Application.CreateForm(TfrmPerfil,frmPerfil);
   frmPerfil.ShowModal;
   frmPerfil.Free;
  end;
end;

end.