unit UCadAcessorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmAcessorios = class(TForm)
    pgcAcessorio: TPageControl;
    tsTipoAcessorios: TTabSheet;
    Label1: TLabel;
    DBEAcessorio: TDBEdit;
    DBGTipoAcessorio: TDBGrid;
    btnIncluir: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    BitBtn4: TBitBtn;
    tsAddAcessorios: TTabSheet;
    DBTEspec: TDBText;
    lblEspec: TLabel;
    btnAdd: TButton;
    btnDel: TButton;
    DBLookupTipoAcessorios: TDBLookupListBox;
    DBLookupAcessorios: TDBLookupListBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcessorios: TfrmAcessorios;

implementation

uses UDMRentCar, DB;

{$R *.dfm}

procedure TfrmAcessorios.btnIncluirClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Insert;
 btnGravar.Enabled := True;
 btnIncluir.Enabled := False;
 btnCancelar.Enabled := True;
end;

procedure TfrmAcessorios.btnExcluirClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Delete;
end;

procedure TfrmAcessorios.btnGravarClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Post;
 btnGravar.Enabled := False;
 btnIncluir.Enabled := True;
 btnExcluir.Enabled := True;
end;

procedure TfrmAcessorios.BitBtn4Click(Sender: TObject);
begin
 close;
end;

procedure TfrmAcessorios.btnCancelarClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Cancel;
end;

procedure TfrmAcessorios.btnAddClick(Sender: TObject);
begin
  if dmRentCar.ZTTipoAcessorios.IsEmpty then
  Begin
    ShowMessage('Nao existem acessários para serem adicionados');
  end else
  Begin
    dmRentCar.ZTAcessorios.Insert;
    dmRentCar.ZTAcessoriosRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
    dmRentCar.ZTAcessoriosRentCar_TipoAcessorios_TipoAcessorio_Id.Value := dmRentCar.ZTTipoAcessoriosTipoAcessorio_Id.Value;
    dmRentCar.ZTAcessorios.Post;
    dmRentCar.ZQFunctions.Refresh;
  end;

end;

procedure TfrmAcessorios.btnDelClick(Sender: TObject);
begin
 dmRentCar.ZTAcessorios.Delete;
 dmRentCar.ZQFunctions.Refresh;
end;

procedure TfrmAcessorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmRentCar.ZQFunctions.Close;
end;

end.
