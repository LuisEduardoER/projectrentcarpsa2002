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
    mkCPFCNPJ: TMaskEdit;
    btnBuscar: TButton;
    procedure ckNomeClick(Sender: TObject);
    procedure ckCPFCNPJClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaClientes: TfrmConsultaClientes;

implementation

uses UDMRentCar, URentCarPrincipal;

{$R *.dfm}

procedure TfrmConsultaClientes.ckNomeClick(Sender: TObject);
begin
 edtNome.SetFocus;
end;

procedure TfrmConsultaClientes.ckCPFCNPJClick(Sender: TObject);
begin
 mkCPFCNPJ.SetFocus;
end;

procedure TfrmConsultaClientes.btnBuscarClick(Sender: TObject);
begin
 with dmRentCar do
  Begin
    if frmRentCarPrincipal.tipo = 'F' then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_nome, rentcar_pesfis.pesfis_Sexo, rentcar_pessoa.pes_TelRes, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF');
      ZQCliente.SQL.Add('from rentcar_pessoa, rentcar_pesfis');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pessoa.pes_Nome ="'+edtNome.Text+'"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesfis.pesfis_CPF ="'+mkCPFCNPJ.Text+'"');
      end else
      Begin
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
      end;
    end else
     Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pesju.PesJu_NmFantasia, rentcar_pesju.PesJu_CNPJ, rentcar_pessoa.pes_TelRes, rentcar_pessoa.pes_TelOP, rentcar_pessoa.pes_Cel');
      ZQCliente.SQL.Add('from rentcar_pessoa, rentcar_pesju');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pessoa.pes_Nome ="'+edtNome.Text+'"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesju.pesju_CNPJ ="'+mkCPFCNPJ.Text+'"');
      end else
      Begin
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesju.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
     end;
  end;

  end;
  end;
end.
