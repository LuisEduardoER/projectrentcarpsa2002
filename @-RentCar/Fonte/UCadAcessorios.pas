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
    DBListBox1: TDBListBox;
    DBListBox2: TDBListBox;
    DBTEspec: TDBText;
    lblEspec: TLabel;
    btnAdd: TButton;
    btnDel: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
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
end;

procedure TfrmAcessorios.btnExcluirClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Delete;
end;

procedure TfrmAcessorios.btnGravarClick(Sender: TObject);
begin
 dmRentCar.ZTTipoAcessorios.Post;
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
    ShowMessage('Nao existem acessário para serem adicionados');
  end else
  Begin
    dmRentCar.ZTAcessorios.Insert;
    dmRentCar.ZTAcessoriosRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
    dmRentCar.ZTAcessoriosRentCar_TipoAcessorios_TipoAcessorio_Id.Value := dmRentCar.ZTTipoAcessoriosTipoAcessorio_Id.Value;
    dmRentCar.ZTAcessorios.Post;
  end;

end;

end.
