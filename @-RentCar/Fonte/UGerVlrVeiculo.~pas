unit UGerVlrVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, ComCtrls;

type
  TfrmRentCarVlrVeiculos = class(TForm)
    DBTEspec: TDBText;
    lblEspec: TLabel;
    btnCadastrar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    PageControl1: TPageControl;
    tsDiaria: TTabSheet;
    tsMensal: TTabSheet;
    DBEDia: TDBEdit;
    DBEMens: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure DBEVlrVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRentCarVlrVeiculos: TfrmRentCarVlrVeiculos;

implementation

uses UDMRentCar;

{$R *.dfm}

procedure TfrmRentCarVlrVeiculos.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarVlrVeiculos.DBEVlrVeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not ( Key in ['0'..'9',#13,#8] ) then
  Begin
   Key := #0;
  end;
end;

procedure TfrmRentCarVlrVeiculos.btnCadastrarClick(Sender: TObject);
begin
 if DBEDia.Text = '' then
 Begin
    ShowMessage('Preencha a taxa diária do aluguel do veículo');
    DBEDia.SetFocus;
 end else
  if DBEMens.Text = '' then
 Begin
    ShowMessage('Preencha a taxa mensal do aluguel do veículo');
    DBEMens.SetFocus;
 end else
 Begin
  dmRentCar.ZTGerValRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
  dmRentCar.ZTGerVal.Post;
  dmRentCar.ZTGerVal.Refresh;
  btnAlterar.Enabled := True;
  btnCadastrar.Enabled := False;
 end;

end;

procedure TfrmRentCarVlrVeiculos.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTGerVal.Edit;
 btnCadastrar.Enabled := True;

end;

procedure TfrmRentCarVlrVeiculos.btnFecharClick(Sender: TObject);
begin
 close;

end;

end.
