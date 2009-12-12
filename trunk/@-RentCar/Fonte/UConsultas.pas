unit UConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DBCtrls, Mask, ExtCtrls;

type
  TfrmConsultas = class(TForm)
    pgcConsultas: TPageControl;
    tsConsultClientes: TTabSheet;
    tsConsultLoc: TTabSheet;
    tsConsultVeiculos: TTabSheet;
    tsListagemChamados: TTabSheet;
    gbFiltros: TGroupBox;
    ckNome: TCheckBox;
    ckCPFCNPJ: TCheckBox;
    edtNome: TEdit;
    edtCPFCNPJ: TEdit;
    btnBuscar: TButton;
    DBGClientes: TDBGrid;
    GroupBox1: TGroupBox;
    lblA: TLabel;
    ckCliente: TCheckBox;
    ckVeiculo: TCheckBox;
    DBLookupVeiculo: TDBLookupComboBox;
    DateI: TDateTimePicker;
    DateF: TDateTimePicker;
    ckPeriodo: TCheckBox;
    btnBuscarLoc: TButton;
    DBGLoc: TDBGrid;
    GroupBox2: TGroupBox;
    ckPlaca: TCheckBox;
    ckAno: TCheckBox;
    DateAno: TDateTimePicker;
    mkPlaca: TMaskEdit;
    btnBuscarVec: TButton;
    DBGVec: TDBGrid;
    GroupBox3: TGroupBox;
    ckProtocolo: TCheckBox;
    edtProtocol: TEdit;
    btnBuscarChamado: TButton;
    DBGListChamados: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    DBLookupCliente: TDBLookupComboBox;
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGClientesCellClick(Column: TColumn);
    procedure ckNomeClick(Sender: TObject);
    procedure ckCPFCNPJClick(Sender: TObject);
    procedure btnBuscarLocClick(Sender: TObject);
    procedure btnBuscarVecClick(Sender: TObject);
    procedure ckPlacaClick(Sender: TObject);
    procedure ckAnoClick(Sender: TObject);
    procedure DBGVecCellClick(Column: TColumn);
    procedure btnBuscarChamadoClick(Sender: TObject);
    procedure ckProtocoloClick(Sender: TObject);
    procedure DBGListChamadosCellClick(Column: TColumn);
    procedure DBGLocCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses UDMRentCar, URentCarPrincipal, DateUtils;

{$R *.dfm}

procedure TfrmConsultas.btnBuscarClick(Sender: TObject);
begin
 with dmRentCar do
  Begin
    if (frmRentCarPrincipal.tipo = 'PF') or (frmRentCarPrincipal.veiculo = 'PFR') or (frmRentCarPrincipal.veiculo = 'PFL') or (frmRentCarPrincipal.perfil = 'F') or (frmRentCarPrincipal.chamado = 'F') then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_id, rentcar_pesfis.PesFis_Nome, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pesfis.PesFis_Tipo = "C"');

      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('and rentcar_pesfis.pesfis_Nome LIKE "%'+edtNome.Text+'%"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('and rentcar_pesfis.pesfis_CPF LIKE "%'+edtCPFCNPJ.Text+'%"');
      end else
      Begin
      ZQCliente.SQL.Add('and rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id');
      end;
      ZQCliente.Open;


      if ZQCliente.IsEmpty then
      Begin
        ShowMessage('Cliente não existente');
      end;
    end else
    if (frmRentCarPrincipal.tipo = 'FUN') then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_id, rentcar_pesfis.PesFis_Nome, rentcar_pesfis.pesfis_RG, rentcar_pesfis.pesfis_CPF');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      ZQCliente.SQL.Add('where rentcar_pesfis.PesFis_Tipo = "F"');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('and rentcar_pesfis.pesfis_Nome LIKE "%'+edtNome.Text+'%"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('and rentcar_pesfis.pesfis_CPF LIKE "%'+edtCPFCNPJ.Text+'%"');
      end else
      Begin
      ZQCliente.SQL.Add('and rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id');
      end;
      ZQCliente.Open;


      if ZQCliente.IsEmpty then
      Begin
        ShowMessage('Funcionario não existente');
      end;

    end else
     if (frmRentCarPrincipal.tipo = 'PJ') or (frmRentCarPrincipal.veiculo = 'PJL') or (frmRentCarPrincipal.veiculo = 'PJR') or (frmRentCarPrincipal.perfil = 'J') or (frmRentCarPrincipal.chamado = 'J') then
      Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_id,rentcar_pesju.PesJu_NmFantasia, rentcar_pesju.PesJu_CNPJ');
      ZQCliente.SQL.Add('from rentcar_pessoa');
      ZQCliente.SQL.Add('INNER join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
      if ckNome.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pessoa.pes_Nome LIKE "%'+edtNome.Text+'%"');
      end else
      if ckCPFCNPJ.Checked = True then
      Begin
        ZQCliente.SQL.Add('where rentcar_pesju.pesju_CNPJ LIKE "%'+edtCPFCNPJ.Text+'%"');
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

procedure TfrmConsultas.DBGClientesCellClick(Column: TColumn);
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
  end;

end;

procedure TfrmConsultas.ckNomeClick(Sender: TObject);
begin
 edtNome.Enabled := True;
 edtNome.SetFocus;
end;

procedure TfrmConsultas.ckCPFCNPJClick(Sender: TObject);
begin
 edtCPFCNPJ.Enabled := True;
 edtCPFCNPJ.SetFocus;
end;

procedure TfrmConsultas.btnBuscarLocClick(Sender: TObject);
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
     ZQFunctions.SQL.Add('select rentcar_pessoa.Pes_id , rentcar_pesfis.PesFis_Nome , rentcar_veiculo.Vel_Espec from rentcar_alugar ');
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
     ZQFunctions.SQL.Add('select rentcar_pessoa.Pes_id, rentcar_pesju.PesJu_NmFantasia, rentcar_veiculo.Vel_Espec from rentcar_alugar ');
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
  end;
end;

procedure TfrmConsultas.btnBuscarVecClick(Sender: TObject);
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

procedure TfrmConsultas.ckPlacaClick(Sender: TObject);
begin
 mkPlaca.Enabled := True;
end;

procedure TfrmConsultas.ckAnoClick(Sender: TObject);
begin
 DateAno.Enabled := True;
end;

procedure TfrmConsultas.DBGVecCellClick(Column: TColumn);
begin
 close;
  if dmRentCar.ZTCadVeiculo.IsEmpty then
  Begin
    dmRentCar.ZTCadVeiculo.Filtered := False;
  end;
end;

procedure TfrmConsultas.btnBuscarChamadoClick(Sender: TObject);
begin
 if frmRentCarPrincipal.chamado = 'LF' then
  Begin
   with dmRentCar do
   Begin
    ZQFunctions.Close;
    ZQFunctions.SQL.Clear;
    ZQFunctions.SQL.Add('select Ch_TipoCh, Ch_Protocol, Ch_HoraCh, Ch_DataCh, Ch_Status ');
    ZQFunctions.SQL.Add('from rentcar_chamado ');
    ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_chamado.RentCar_Pessoa_Pes_id ');
    if ckProtocolo.Checked = True then
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "F" and Ch_Protocol = "'+edtProtocol.Text+'"');
    end else
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "F" ');
    end;
    ZQFunctions.Open;

    ZQFunctions.FieldByName('Ch_TipoCh').DisplayLabel := 'Tipo Chamado';
    ZQFunctions.FieldByName('Ch_Protocol').DisplayLabel := 'Protocolo';
    ZQFunctions.FieldByName('Ch_HoraCh').DisplayLabel := 'Hora';
    ZQFunctions.FieldByName('Ch_DataCh').DisplayLabel := 'Data';
    ZQFunctions.FieldByName('Ch_Status').DisplayLabel := 'Status';

    if ZQFunctions.IsEmpty then
    Begin
      ShowMessage('Não Existem chamados finalizados');
      ZQFunctions.Close;
    end;
   end;
  end else
  if frmRentCarPrincipal.chamado = 'LE' then
  Begin
   with dmRentCar do
   Begin
    ZQFunctions.Close;
    ZQFunctions.SQL.Clear;
    ZQFunctions.SQL.Add('select Ch_TipoCh, Ch_Protocol, Ch_HoraCh, Ch_DataCh, Ch_Status ');
    ZQFunctions.SQL.Add('from rentcar_chamado ');
    ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_chamado.RentCar_Pessoa_Pes_id ');
    if ckProtocolo.Checked = True then
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "E" and Ch_Protocol = "'+edtProtocol.Text+'"');
    end else
    Begin
    ZQFunctions.SQL.Add('where ch_Status = "E" ');
    end;

    ZQFunctions.Open;

    ZQFunctions.FieldByName('Ch_TipoCh').DisplayLabel := 'Tipo Chamado';
    ZQFunctions.FieldByName('Ch_Protocol').DisplayLabel := 'Protocolo';
    ZQFunctions.FieldByName('Ch_HoraCh').DisplayLabel := 'Hora';
    ZQFunctions.FieldByName('Ch_DataCh').DisplayLabel := 'Data';
    ZQFunctions.FieldByName('Ch_Status').DisplayLabel := 'Status';


    if ZQFunctions.IsEmpty then
    Begin
      ShowMessage('Não Existem chamados em espera');
      ZQFunctions.Close;
    end;

   end;
  end;
end;

procedure TfrmConsultas.ckProtocoloClick(Sender: TObject);
begin
  edtProtocol.Enabled := True;
  edtProtocol.SetFocus;
end;

procedure TfrmConsultas.DBGListChamadosCellClick(Column: TColumn);
begin

 if frmRentCarPrincipal.chamado = 'LE' then
 Begin
 if dmRentCar.ZQFunctions.RecordCount <= 0 then
  Begin
   ShowMessage('Nao existem mais chamados');
  end else
 if Application.MessageBox('Deseja mudar o Status do Chamado para Finalizado?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
 Begin
 dmRentCar.ZQFunctions.Edit;
 dmRentCar.ZQFunctions.fieldbyname('Ch_Status').Value := 'F';
 dmRentCar.ZQFunctions.Post;
 dmRentCar.ZQFunctions.Refresh;
 end;
 end else
 if frmRentCarPrincipal.chamado = 'LF' then
 Begin
  if dmRentCar.ZQFunctions.RecordCount <= 0 then
  Begin
   ShowMessage('Nao existem mais chamados');
  end else
 if Application.MessageBox('Deseja mudar o Status do Chamado para Em Espera?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
 Begin
 dmRentCar.ZQFunctions.Edit;
 dmRentCar.ZQFunctions.fieldbyname('Ch_Status').Value := 'E';
 dmRentCar.ZQFunctions.Post;
 dmRentCar.ZQFunctions.Refresh;
 end;
 end;

end;

procedure TfrmConsultas.DBGLocCellClick(Column: TColumn);
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
