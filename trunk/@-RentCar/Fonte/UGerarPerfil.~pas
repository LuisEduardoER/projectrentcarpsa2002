unit UGerarPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmGerarPerfil = class(TForm)
    gbFiltros: TGroupBox;
    btnGerarPerfil: TButton;
    edtCliRes: TEdit;
    btnB: TButton;
    Label1: TLabel;
    procedure btnBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarPerfil: TfrmGerarPerfil;

implementation

uses UBCliente;

{$R *.dfm}

procedure TfrmGerarPerfil.btnBClick(Sender: TObject);
begin
 Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
 frmConsultaClientes.ShowModal;
 frmConsultaClientes.Free;
end;

end.
