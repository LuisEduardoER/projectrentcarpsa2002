unit UConsulLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TfrmConsultarLocacoes = class(TForm)
    gbFiltros: TGroupBox;
    ckCliente: TCheckBox;
    ckVeiculo: TCheckBox;
    btnBuscar: TButton;
    DBGBVec: TDBGrid;
    DBLookupCliente: TDBLookupComboBox;
    DBLookupVeiculo: TDBLookupComboBox;
    DateI: TDateTimePicker;
    DateF: TDateTimePicker;
    ckPeriodo: TCheckBox;
    lblA: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGBVecCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarLocacoes: TfrmConsultarLocacoes;

implementation

uses UDMRentCar, URentCarPrincipal;

{$R *.dfm}

procedure TfrmConsultarLocacoes.btnBuscarClick(Sender: TObject);
Var
dI, dF : string;
begin
dI := FormatDateTime('yyyy-MM-dd',DateI.date);
dF := FormatDateTime('yyyy-MM-dd',DateF.date);

  with dmRentCar do
  Begin
   if frmRentCarPrincipal.veiculo = 'PFL' then
   Begin
     ZQFunctions.Close;
     ZQFunctions.SQL.Clear;
     ZQFunctions.SQL.Add('select rentcar_pessoa.Pes_id, rentcar_pesfis.PesFis_Nome, rentcar_veiculo.Vel_Espec, rentcar_alugar.DataReserva from rentcar_alugar ');
     ZQFunctions.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id  ');
     ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_Id = rentcar_alugar.RentCar_Pessoa_Pes_id ');
     ZQFunctions.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_Id = rentcar_pessoa.Pes_Id ');
     if ckCliente.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_pesfis.PesFis_Nome = "'+DBLookupCliente.Text+'"');
     end else
     if ckVeiculo.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_Espec = "'+DBLookupVeiculo.Text+'"');
     end else
     if ckPeriodo.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_alugar.PerInicialLoc = "'+dI+'" or rentcar_alugar.PerInicialLoc = "'+dF+'"');
     end;
   end else
   if frmRentCarPrincipal.veiculo = 'PFL' then
   Begin
     ZQFunctions.Close;
     ZQFunctions.SQL.Clear;
     ZQFunctions.SQL.Add('select rentcar_pessoa.Pes_id, rentcar_pesju.PesJu_NmFantasia, rentcar_veiculo.Vel_Espec, rentcar_alugar.DataReserva from rentcar_alugar ');
     ZQFunctions.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id  ');
     ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_Id = rentcar_alugar.RentCar_Pessoa_Pes_id ');
     ZQFunctions.SQL.Add('inner join rentcar_pesJu on rentcar_pesJu.RentCar_Pessoa_Pes_Id = rentcar_pessoa.Pes_Id ');
     if ckCliente.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_pesJu.PesFis_NmFantasia = "'+DBLookupCliente.Text+'"');
     end else
     if ckVeiculo.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_Espec = "'+DBLookupVeiculo.Text+'"');
     end else
     if ckPeriodo.Checked = True then
     Begin
     ZQFunctions.SQL.Add('where rentcar_alugar.PerInicialLoc = "'+dI+'" or rentcar_alugar.PerInicialLoc = "'+dF+'"');
     end;
   end;
   ZQFunctions.Open;

   if ZQFunctions.IsEmpty then
   Begin
     DBGBVec.Enabled := False;
   end else
   Begin
      DBGBVec.Enabled := True;
   end;
  end;
end;

procedure TfrmConsultarLocacoes.DBGBVecCellClick(Column: TColumn);
begin
  close;
  with dmRentCar do
  Begin
    ZTAlugar.Filtered := False;
    ZTAlugar.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(ZQFunctions.fieldbyname('Pes_Id').AsString);
    ZTAlugar.Filtered := True;
  end;
end;

end.