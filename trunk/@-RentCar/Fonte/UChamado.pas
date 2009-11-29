unit UChamado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, ExtCtrls;

type
  TfrmRentCarAberturaChamado = class(TForm)
    btnSair: TButton;
    btnLimpar: TButton;
    btnCadastrar: TButton;
    GroupBox1: TGroupBox;
    edtNome: TEdit;
    lblNome: TLabel;
    gbAberturaChamados: TGroupBox;
    lblSolicitacao: TLabel;
    DataChamado: TDateTimePicker;
    lblData: TLabel;
    DBREChamado: TDBRichEdit;
    lblDesc: TLabel;
    brnSalvar: TButton;
    lblProtocol: TLabel;
    DBTProtocol: TDBText;
    DBTHora: TDBText;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    btnBuscar: TButton;
    DBCBSolic: TDBComboBox;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure brnSalvarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
     chamado : string;
    { Public declarations }
  end;

var
  frmRentCarAberturaChamado: TfrmRentCarAberturaChamado;

implementation

uses UDMRentCar, UBCliente;

{$R *.dfm}

procedure TfrmRentCarAberturaChamado.btnCadastrarClick(Sender: TObject);
begin
 dmRentCar.ZTChamado.Insert;
 DBTHora.Caption := TimeToStr(Time); 
end;

procedure TfrmRentCarAberturaChamado.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarAberturaChamado.brnSalvarClick(Sender: TObject);
Var
Rand : integer;
protocol : string;
begin
  Randomize;
  protocol := '';
   repeat
    Rand :=Random(10);       //ser� sorteado os n�meros de 0 a 9
    if AnsiPos(IntToStr(Rand),protocol)=0 then         //somente se o n�mero for diferente do j� escolhido
      protocol := protocol +IntToStr(Rand);
    until(Length(protocol)= 10); //quantos n�meros diferentes voc� desejar obter.

dmRentCar.ZTChamadoRentCar_PesFis_PesFis_id.Value := dmRentCar.ZQCliente.fieldbyname('PesFis_Id').AsInteger;
dmRentCar.ZTChamadoCh_HoraCh.Value := Now;
dmRentCar.ZTChamadoCh_DataCh.Value := DataChamado.Date;
dmRentCar.ZTChamadoCh_Protocol.AsString := protocol;
dmRentCar.ZTChamado.Post;
end;

procedure TfrmRentCarAberturaChamado.btnBuscarClick(Sender: TObject);
begin
  chamado := 'Ch';
  Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
  frmConsultaClientes.ShowModal;
  frmConsultaClientes.Close;
end;

procedure TfrmRentCarAberturaChamado.btnLimparClick(Sender: TObject);
begin
 dmRentCar.ZTChamado.ClearFields;
end;

end.
