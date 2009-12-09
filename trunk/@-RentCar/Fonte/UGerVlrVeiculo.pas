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
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
 dmRentCar.ZTGerValRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
 dmRentCar.ZTGerVal.Post;
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

end.
