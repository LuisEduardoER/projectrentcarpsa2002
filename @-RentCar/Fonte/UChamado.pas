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
    lblNome: TLabel;
    gbAberturaChamados: TGroupBox;
    lblSolicitacao: TLabel;
    DataChamado: TDateTimePicker;
    lblData: TLabel;
    DBREChamado: TDBRichEdit;
    lblDesc: TLabel;
    btnSalvar: TButton;
    lblProtocol: TLabel;
    DBTProtocol: TDBText;
    DBTHora: TDBText;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    btnBuscar: TButton;
    DBCBSolic: TDBComboBox;
    DBLookupCliente: TDBLookupComboBox;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure DBLookupClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
     chamado : string;
    { Public declarations }
  end;

var
  frmRentCarAberturaChamado: TfrmRentCarAberturaChamado;

implementation

uses UDMRentCar;

{$R *.dfm}

procedure TfrmRentCarAberturaChamado.btnCadastrarClick(Sender: TObject);
begin
 gbAberturaChamados.Enabled := True;
 btnCadastrar.Enabled := False;
 dmRentCar.ZTChamado.Insert;
 DBTHora.Caption := TimeToStr(Time); 
end;

procedure TfrmRentCarAberturaChamado.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarAberturaChamado.btnSalvarClick(Sender: TObject);
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
dmRentCar.ZTChamadoCh_Protocol.AsInteger := StrToInt(protocol);
dmRentCar.ZTChamado.Post;
btnCadastrar.Enabled := True;
btnSalvar.Enabled := False;
end;

procedure TfrmRentCarAberturaChamado.btnLimparClick(Sender: TObject);
begin
 dmRentCar.ZTChamado.ClearFields;
end;

procedure TfrmRentCarAberturaChamado.DBLookupClienteClick(Sender: TObject);
begin
 dmRentCar.ZTPessoa.Filtered := False;
 dmRentCar.ZTPessoa.Filter := 'Pes_id = '+QuotedStr(dmRentCar.ZTPesFisRentCar_Pessoa_Pes_id.AsString);
 dmRentCar.ZTPessoa.Filtered := True;
end;

end.
