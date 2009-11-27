unit UTiposChamados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask;

type
  TfrmRentCarTiposChamados = class(TForm)
    DBListSolicitacoes: TDBListBox;
    DBListSolicitacoesChamados: TDBListBox;
    btnII: TButton;
    btnI: TButton;
    btnIII: TButton;
    btnIV: TButton;
    gbSolicitacao: TGroupBox;
    DBESolicitacao: TDBEdit;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRentCarTiposChamados: TfrmRentCarTiposChamados;

implementation

{$R *.dfm}

end.
