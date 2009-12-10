unit UConsultaVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Mask;

type
  TfrmConsultaVeiculos = class(TForm)
    gbFiltros: TGroupBox;
    ckPlaca: TCheckBox;
    ckAno: TCheckBox;
    btnBuscar: TButton;
    DBGBVec: TDBGrid;
    DateAno: TDateTimePicker;
    mkPlaca: TMaskEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure ckPlacaClick(Sender: TObject);
    procedure ckAnoClick(Sender: TObject);
    procedure DBGBVecCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVeiculos: TfrmConsultaVeiculos;

implementation

uses UCadVeiculo, UDMRentCar, DateUtils;

{$R *.dfm}

procedure TfrmConsultaVeiculos.btnBuscarClick(Sender: TObject);
Var
ano : word;
begin
 ano := YearOf(DateAno.Date);
 if ckPlaca.Checked = True then
 Begin
   dmRentCar.ZTCadVeiculo.Filtered := False;
   dmRentCar.ZTCadVeiculo.Filter := 'Vel_Placa = '+QuotedStr(mkPlaca.Text);
   dmRentCar.ZTCadVeiculo.Filtered := True;
 end else
 if ckAno.Checked = True then
 Begin
   dmRentCar.ZTCadVeiculo.Filtered := False;
   dmRentCar.ZTCadVeiculo.Filter := 'Vel_Ano = '+QuotedStr(IntToStr(ano));
   dmRentCar.ZTCadVeiculo.Filtered := True;
 end else
 Begin
    dmRentCar.ZTCadVeiculo.Filtered := False;
 end;
end;

procedure TfrmConsultaVeiculos.ckPlacaClick(Sender: TObject);
begin
 mkPlaca.Enabled := True;
end;

procedure TfrmConsultaVeiculos.ckAnoClick(Sender: TObject);
begin
 DateAno.Enabled := True;
end;

procedure TfrmConsultaVeiculos.DBGBVecCellClick(Column: TColumn);
begin
 close;
end;

procedure TfrmConsultaVeiculos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if dmRentCar.ZTCadVeiculo.IsEmpty then
  Begin
    dmRentCar.ZTCadVeiculo.Filtered := False;
  end;
end;

end.
