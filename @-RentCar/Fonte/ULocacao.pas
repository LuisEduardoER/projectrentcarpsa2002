unit ULocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ComCtrls;

type
  TfrmLocacao = class(TForm)
    btnCadastar: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    btnConsultarLoc: TButton;
    PageControl1: TPageControl;
    tsLocacao: TTabSheet;
    tsReserva: TTabSheet;
    lblCliente: TLabel;
    edtCliente: TEdit;
    btnBuscar: TButton;
    gbLocacao: TGroupBox;
    lblTipoPg: TLabel;
    lblVlrPagar: TLabel;
    lblVeiculo: TLabel;
    Label1: TLabel;
    DBTAluguel: TDBText;
    DBCheckBox1: TDBCheckBox;
    DBCBTpPg: TDBComboBox;
    DBEVlrAPagar: TDBEdit;
    DBLookupCBVeiculo: TDBLookupComboBox;
    DBImgVeiculo: TDBImage;
    Label2: TLabel;
    Edit1: TEdit;
    btnB: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBTVlr: TDBText;
    DBCBR: TDBCheckBox;
    DBLCBV: TDBLookupComboBox;
    DBImgV: TDBImage;
    btnSalvar: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBLCBVClick(Sender: TObject);
    procedure DBLookupCBVeiculoClick(Sender: TObject);
  private
    { Private declarations }
  public
     email : string;
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses UDMRentCar, URentCarPrincipal, MsgEditor, UCadCliente, UBCliente,
  StrUtils;

{$R *.dfm}

procedure TfrmLocacao.btnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmLocacao.edtClienteChange(Sender: TObject);
begin
 with dmRentCar do
  Begin
    if frmRentCarPrincipal.tipo = 'F' then
    Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pessoa.PesFis_Id,rentcar_pessoa.Pes_nome');
      ZQCliente.SQL.Add('from rentcar_pessoa, rentcar_pesfis');
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesfis.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
    end else
     Begin
      ZQCliente.Close;
      ZQCliente.SQL.Clear;
      ZQCliente.SQL.Add('Select rentcar_pesju.PesJu_Id,rentcar_pesju.PesJu_NmFantasia');
      ZQCliente.SQL.Add('from rentcar_pessoa, rentcar_pesju');
      ZQCliente.SQL.Add('where rentcar_pessoa.pes_id = rentcar_pesju.RentCar_Pessoa_Pes_id');
      ZQCliente.Open;
     end;
  end;
end;

procedure TfrmLocacao.btnCadastarClick(Sender: TObject);
begin
 dmRentCar.ZTAlugar.Insert;
end;


procedure TfrmLocacao.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTAlugar.Edit;
 dmRentCar.ZTGerVal.Edit;
end;

procedure TfrmLocacao.btnSalvarClick(Sender: TObject);
begin
  dmRentCar.ZTGerVal.Edit;
  dmRentCar.ZTGerVal.Post;
  dmRentCar.ZTAlugar.Post;
  if frmRentCarPrincipal.veiculo = 'L' then
   Begin
    if Application.MessageBox('Tem certeza enviar um e-mail para o cliente confirmar a locação do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      email := 'l';
      Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
      frmMessageEditor.edtTo.Text := dmRentCar.ZTPessoaPes_Email.Value;
      frmMessageEditor.edtNameTo.Text := LeftStr(trim(dmRentCar.ZTPessoaPes_Nome.Value),5);
      frmMessageEditor.ShowModal;
      frmMessageEditor.Free;
      end;
    end else
    Begin
    if Application.MessageBox('Tem certeza enviar um e-mail para o cliente confirmar a reserva do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      email := 'r';
      Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
      frmMessageEditor.edtTo.Text := dmRentCar.ZTPessoaPes_Email.Value;
      frmMessageEditor.edtNameTo.Text := LeftStr(trim(dmRentCar.ZTPessoaPes_Nome.Value),5);
      frmMessageEditor.ShowModal;
      frmMessageEditor.Free;
    end;
  end;
end;

procedure TfrmLocacao.btnBuscarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
  frmConsultaClientes.ShowModal;
  frmConsultaClientes.Close;

end;

procedure TfrmLocacao.DBLCBVClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTCadVeiculo.Filtered := False;
  ZTCadVeiculo.Filter := 'Vel_id = '+ QuotedStr(DBLookupCBVeiculo.KeyField);
  ZTCadVeiculo.Filtered := True;
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
 end;
end;

procedure TfrmLocacao.DBLookupCBVeiculoClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTCadVeiculo.Filtered := False;
  ZTCadVeiculo.Filter := 'Vel_id = '+ QuotedStr(DBLookupCBVeiculo.KeyField);
  ZTCadVeiculo.Filtered := True;
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;

 end;
end;

end.
