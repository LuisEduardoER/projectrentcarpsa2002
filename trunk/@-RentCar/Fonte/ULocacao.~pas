unit ULocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ComCtrls, Grids, DBGrids;

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
    btnB: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBTVlr: TDBText;
    DBCBR: TDBCheckBox;
    DBLCBV: TDBLookupComboBox;
    DBImgV: TDBImage;
    btnSalvar: TButton;
    edtCliLoc: TEdit;
    edtCliRes: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBLCBVClick(Sender: TObject);
    procedure DBLookupCBVeiculoClick(Sender: TObject);
  private
    { Private declarations }
  public
     email, t : string;
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses UDMRentCar, URentCarPrincipal, MsgEditor, UCadCliente, UBCliente,
  StrUtils, DB;

{$R *.dfm}

procedure TfrmLocacao.btnSairClick(Sender: TObject);
begin
 Close;
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

  if frmRentCarPrincipal.veiculo = 'L' then
   Begin
      //dmRentCar.ZTAlugarRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarRentCar_PesFis_PesFis_id.Value := dmRentCar.ZQCliente.fieldbyname('PesFis_Id').AsInteger;
      dmRentCar.ZTAlugar.Post;
    if Application.MessageBox('Tem certeza enviar um e-mail para o cliente confirmar a locação do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      email := 'l';
      Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
  //    frmMessageEditor.edtTo.Text := dmRentCar.ZQCliente.fieldbyname('Pes_Email').AsString;
//      frmMessageEditor.edtNameTo.Text := LeftStr(trim(dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString),5);
      frmMessageEditor.ShowModal;
      frmMessageEditor.Free;
      end;
    end else
    if frmRentCarPrincipal.veiculo = 'R' then
    Begin
      //dmRentCar.ZTAlugarRentCar_Veiculo_Vel_id.Value := dmRentCar.ZTCadVeiculoVel_id.Value;
      dmRentCar.ZTAlugarRentCar_Ger_Valores_GerVal_id.Value := dmRentCar.ZTGerValGerVal_id.Value;
      dmRentCar.ZTAlugarRentCar_PesFis_PesFis_id.Value := dmRentCar.ZQCliente.fieldbyname('PesFis_Id').AsInteger;
      dmRentCar.ZTAlugar.Post;

    if Application.MessageBox('Tem certeza enviar um e-mail para o cliente confirmar a reserva do veículo?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
    Begin
      email := 'r';
      close;
      Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
//      frmMessageEditor.edtTo.Text := dmRentCar.ZQCliente.fieldbyname('Pes_Email').AsString;
//      frmMessageEditor.edtNameTo.Text := LeftStr(trim(dmRentCar.ZQCliente.fieldbyname('PesFis_Nome').AsString),5);
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
  ZTCadVeiculo.Filter := 'Vel_Marca = '+ QuotedStr(DBLCBV.Text);
  //ZTCadVeiculo.Filtered := True;
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
  ZTCadVeiculo.Filter := 'Vel_Marca = '+ QuotedStr(DBLookupCBVeiculo.Text);
  //ZTCadVeiculo.Filtered := True;
  ZTGerVal.Filtered := False;
  ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
  ZTGerVal.Filtered := True;
  DBEVlrAPagar.Text := dmRentCar.ZTGerValGerVal_ValAlu.AsString;
 end;
end;

end.
