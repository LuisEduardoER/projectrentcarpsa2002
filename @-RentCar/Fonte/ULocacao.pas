unit ULocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask;

type
  TfrmLocacao = class(TForm)
    edtCliente: TEdit;
    lblCliente: TLabel;
    btnCadastar: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    btnConsultarLoc: TButton;
    gbLocacao: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCBTpPg: TDBComboBox;
    lblTipoPg: TLabel;
    DBEVlrAPagar: TDBEdit;
    lblVlrPagar: TLabel;
    DBLookupCBVeiculo: TDBLookupComboBox;
    lblVeiculo: TLabel;
    Label1: TLabel;
    DBTAluguel: TDBText;
    DBImgVeiculo: TDBImage;
    procedure btnSairClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
     email : string;
    { Public declarations }
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses UDMRentCar, URentCarPrincipal, MsgEditor;

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
 dmRentCar.ZTGerVal.Filtered := False;
 dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
 dmRentCar.ZTGerVal.Filtered := True;
 dmRentCar.ZTGerVal.Post;
 dmRentCar.ZTAlugar.Post;
 if Application.MessageBox('Tem certeza que deseja sair sem gravar as opções?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
   Begin
    email := 'l';
    frmMessageEditor.edtTo.Text := dmRentCar.ZTPessoaPes_Email.Value;
    frmMessageEditor.edtNameTo.Text := dmRentCar.ZTPessoaPes_Nome.Value;
   end;
end;

end.
