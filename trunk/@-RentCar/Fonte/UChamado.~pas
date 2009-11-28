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
    DBLCBSolcit: TDBLookupComboBox;
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
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure brnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
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
 DBTHora.Caption := DateToStr(now); 
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
    Rand :=Random(10);       //será sorteado os números de 0 a 9
    if AnsiPos(IntToStr(Rand),protocol)=0 then         //somente se o número for diferente do já escolhido
      protocol := protocol +IntToStr(Rand);
    until(Length(protocol)= 10); //quantos números diferentes você desejar obter.

dmRentCar.ZTChamadoCh_HoraCh.Value := Now;
dmRentCar.ZTChamadoCh_DataCh.Value := DataChamado.Date;
dmRentCar.ZTChamadoCh_Protocol.AsString := protocol;
dmRentCar.ZTChamado.Post;
end;

procedure TfrmRentCarAberturaChamado.FormShow(Sender: TObject);
begin
 DBTHora.Caption := DateToStr(Date);
end;

procedure TfrmRentCarAberturaChamado.btnBuscarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
  frmConsultaClientes.ShowModal;
  frmConsultaClientes.Close;

end;

end.
