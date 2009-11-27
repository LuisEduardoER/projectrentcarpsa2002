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
    edtCPF: TEdit;
    lblCPF: TLabel;
    rbNome: TRadioButton;
    rbCPF: TRadioButton;
    gbAberturaChamados: TGroupBox;
    DBLCBSolcit: TDBLookupComboBox;
    lblSolicitacao: TLabel;
    lblTiposSoliciticao: TLabel;
    DateTimePicker1: TDateTimePicker;
    lblData: TLabel;
    DBREChamado: TDBRichEdit;
    lblDesc: TLabel;
    brnSalvar: TButton;
    rgStatusChamados: TRadioGroup;
    procedure btnCadastrarClick(Sender: TObject);
    procedure lblTiposSoliciticaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure rbCPFClick(Sender: TObject);
    procedure brnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRentCarAberturaChamado: TfrmRentCarAberturaChamado;

implementation

uses UTiposChamados, UDMRentCar;

{$R *.dfm}

procedure TfrmRentCarAberturaChamado.btnCadastrarClick(Sender: TObject);
begin
 dmRentCar.ZTChamado.Insert;
end;

procedure TfrmRentCarAberturaChamado.lblTiposSoliciticaoClick(
  Sender: TObject);
begin
  Application.CreateForm(TfrmRentCarTiposChamados, frmRentCarTiposChamados);
  frmRentCarTiposChamados.ShowModal;
  frmRentCarTiposChamados.Free;
end;

procedure TfrmRentCarAberturaChamado.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRentCarAberturaChamado.rbNomeClick(Sender: TObject);
begin
 edtNome.Enabled := True;
 edtCPF.Enabled := False;
 edtNome.SetFocus;
end;

procedure TfrmRentCarAberturaChamado.rbCPFClick(Sender: TObject);
begin
 edtNome.Enabled := False;
 edtCPF.Enabled := True;
 edtCPF.SetFocus;
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

dmRentCar.ZTChamadoCh_HoraCh.Value := Now;
dmRentCar.ZTChamadoCh_DataCh.Value := Date;
dmRentCar.ZTChamadoCh_Protocol.AsString := protocol;
dmRentCar.ZTChamado.Post;
end;

end.