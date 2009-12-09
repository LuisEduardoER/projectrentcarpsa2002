unit UBCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask;

type
  TfrmConsultaClientes = class(TForm)
    DBGClientes: TDBGrid;
    gbFiltros: TGroupBox;
    ckNome: TCheckBox;
    ckCPFCNPJ: TCheckBox;
    edtNome: TEdit;
    btnBuscar: TButton;
    edtCPFCNPJ: TEdit;
    procedure ckNomeClick(Sender: TObject);
    procedure ckCPFCNPJClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGClientesCellClick(Column: TColumn);
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
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_id, rentcar_pesfis.PesFis_Nome, rentcar_pesfis.pesfis_Sexo, rentcar_pessoa.pes_TelRes, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF, rentcar_pessoa.Pes_Email');
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
      if ZQCliente.IsEmpty then
      Begin
        ShowMessage('Cliente não existente');
      end;
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
     if ZQCliente.IsEmpty then
      Begin
        ShowMessage('Cliente não existente');
        DBGClientes.DataSource := dsQCliente;
      end;
  end;
  end; 
end;

procedure TfrmConsultaClientes.DBGClientesCellClick(Column: TColumn);
begin
  close;

  if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.tipo = 'FUN')  then
  Begin
    dmRentCar.ZTPessoa.Filtered := False;
    dmRentCar.ZTPessoa.Filter := 'Pes_Id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
    dmRentCar.ZTPessoa.Filtered := True;
    dmRentCar.ZTPesFis.Filtered := False;
    dmRentCar.ZTPesFis.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
    dmRentCar.ZTPesFis.Filtered := True;
    dmRentCar.ZTEndereco.Filtered := False;
    dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
    dmRentCar.ZTEndereco.Filtered := True;
  end else
  if (frmRentCarPrincipal.tipo = 'PJ') then
  Begin
    dmRentCar.ZTPessoa.Filtered := False;
    dmRentCar.ZTPessoa.Filter := 'Pes_Id = '+QuotedStr(dmRentCar.ZQCliente.FieldByName('Pes_Id').AsString);
    dmRentCar.ZTPessoa.Filtered := True;
    dmRentCar.ZTPesJu.Filtered := False;
    dmRentCar.ZTPesJu.Filter := 'RentCar_Pessoa_Pes_id = '+QuotedStr(dmRentCar.ZTPessoaPes_id.AsString);
    dmRentCar.ZTPesJu.Filtered := True;
    dmRentCar.ZTEndereco.Filtered := False;
    dmRentCar.ZTEndereco.Filter := 'End_Id = '+QuotedStr(dmRentCar.ZTPessoaRentCar_Enderecos_End_Id.AsString);
    dmRentCar.ZTEndereco.Filtered := True;
  end else
end;

end.
