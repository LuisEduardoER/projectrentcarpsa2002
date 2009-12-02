unit UBCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask;

type
  TfrmConsultaClientes = class(TForm)
    DBGrid1: TDBGrid;
    gbFiltros: TGroupBox;
    ckNome: TCheckBox;
    ckCPFCNPJ: TCheckBox;
    edtNome: TEdit;
    btnBuscar: TButton;
    edtCPFCNPJ: TEdit;
    procedure ckNomeClick(Sender: TObject);
    procedure ckCPFCNPJClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaClientes: TfrmConsultaClientes;

implementation

uses UDMRentCar, URentCarPrincipal, ULocacao, DB, UChamado, UGerarPerfil;

{$R *.dfm}

procedure TfrmConsultaClientes.ckNomeClick(Sender: TObject);
begin
 edtNome.Enabled := True;
 edtNome.SetFocus;
end;

procedure TfrmConsultaClientes.ckCPFCNPJClick(Sender: TObject);
begin
 edtCPFCNPJ.Enabled := True;
 edtCPFCNPJ.SetFocus;
end;

procedure TfrmConsultaClientes.btnBuscarClick(Sender: TObject);
begin
 with dmRentCar do
  Begin
    if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PFL') or (frmRentCarPrincipal.perfil = 'F') or (frmRentCarPrincipal.chamado = 'F') then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pesfis.PesFis_Nome, rentcar_pessoa.Pes_id, rentcar_pesfis.PesFis_Id, rentcar_pesfis.pesfis_Sexo, rentcar_pessoa.pes_TelRes, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF, rentcar_pessoa.Pes_Email');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesfis.pesfis_Nome ="'+edtNome.Text+'"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesfis.pesfis_CPF ="'+edtCPFCNPJ.Text+'"');
      end else
      Begin
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id');
      end;
      ZQCliente.Open;
      ShowMessage(ZQCliente.SQL.Text);
    end else
     if (frmRentCarPrincipal.tipo = 'PJ') or (frmRentCarPrincipal.veiculo = 'PJL') or (frmRentCarPrincipal.veiculo = 'PJR') or (frmRentCarPrincipal.perfil = 'J') or (frmRentCarPrincipal.chamado = 'J') then
      Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_id,rentcar_pesju.PesJu_NmFantasia, rentcar_pesju.PesJu_CNPJ, rentcar_pessoa.pes_TelRes, rentcar_pessoa.pes_TelOP, rentcar_pessoa.pes_Cel');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pessoa.pes_Nome ="'+edtNome.Text+'"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesju.pesju_CNPJ ="'+edtCPFCNPJ.Text+'"');
      end else
      Begin
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesju.RentCar_Pessoa_Pes_id');
     end;
     ZQCliente.Open;
  end;
  end; 
end;

procedure TfrmConsultaClientes.DBGrid1CellClick(Column: TColumn);
begin
  close;
  if (frmRentCarPrincipal.veiculo = 'PFR') then
  Begin
  frmLocacao.edtCliRes.Text := dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString;
  end else
  if (frmRentCarPrincipal.veiculo = 'PJR') then
  Begin
  frmLocacao.edtCliRes.Text := dmRentCar.ZQCliente.fieldbyname('PesJu_NmFantasia').AsString;
  end else
  if (frmRentCarPrincipal.veiculo = 'PJL') then
  Begin
  frmLocacao.edtCliLoc.Text := dmRentCar.ZQCliente.fieldbyname('PesJu_NmFantasia').AsString;
  end else
  if (frmRentCarPrincipal.veiculo = 'PFL') then
  Begin
    ShowMessage('krai');
  frmLocacao.edtCliLoc.Text := dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString;
  end else
  if frmRentCarPrincipal.perfil = 'F' then
  Begin
    frmGerarPerfil.edtCli.Text := dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString;
  end else
  if frmRentCarPrincipal.perfil = 'J' then
  Begin
        frmGerarPerfil.edtCli.Text := dmRentCar.ZQCliente.fieldbyname('PesJu_NmFantasia').AsString;
  end else
  if frmRentCarPrincipal.chamado = 'F' then
  Begin
   frmRentCarAberturaChamado.edtNome.Text := dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString;
  end else
  if frmRentCarPrincipal.chamado = 'J' then
  Begin
   frmRentCarAberturaChamado.edtNome.Text := dmRentCar.ZQCliente.fieldbyname('PesJu_NmFantasia').AsString;
  end; 

end;

end.
