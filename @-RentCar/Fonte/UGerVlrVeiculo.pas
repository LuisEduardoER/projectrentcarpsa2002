unit UGerVlrVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TfrmRentCarVlrVeiculos = class(TForm)
    DBTMarca: TDBText;
    DBTModelo: TDBText;
    DBEVlrVeiculo: TDBEdit;
    lblModelo: TLabel;
    lblMarca: TLabel;
    btnAlterar: TButton;
    btnCadastrar: TButton;
    btnSair: TButton;
    lblVlr: TLabel;
    DBGrid1: TDBGrid;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEVlrVeiculoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRentCarVlrVeiculos.btnCadastrarClick(Sender: TObject);
begin
 if DBEVlrVeiculo.Text = '' then
 Begin
    ShowMessage('Preencha o valor do aluguel');
 end else
 Begin
  dmRentCar.ZTGerValRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
  dmRentCar.ZTGerVal.Post;
  dmRentCar.ZTGerVal.Refresh;
  btnAlterar.Enabled := True
 end;
end;

procedure TfrmRentCarVlrVeiculos.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTGerVal.Edit;
 btnCadastrar.Enabled := True;
end;

procedure TfrmRentCarVlrVeiculos.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarVlrVeiculos.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarVlrVeiculos.FormShow(Sender: TObject);
begin
{ dmRentCar.ZTGerVal.Filtered := False;
 dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
 dmRentCar.ZTGerVal.Filtered := True;   }
end;

procedure TfrmRentCarVlrVeiculos.DBEVlrVeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not ( Key in ['0'..'9',#13,#8] ) then
  Begin
   Key := #0;
  end;
end;

end.
