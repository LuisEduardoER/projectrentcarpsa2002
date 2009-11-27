unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask;

type
  TfrmCadUsuarios = class(TForm)
    DBLookupCBPessoa: TDBLookupComboBox;
    ListBox1: TListBox;
    DBESenha: TDBEdit;
    DBListBox1: TDBListBox;
    btnCadastar: TButton;
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    lblPessoa: TLabel;
    lblSenha: TLabel;
    lblAdicionarPerfil: TLabel;
    btnAdd: TButton;
    btnRet: TButton;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

procedure TfrmCadUsuarios.btnSairClick(Sender: TObject);
begin
 close;
end;

end.
