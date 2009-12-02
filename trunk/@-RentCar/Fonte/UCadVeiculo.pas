unit UCadVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask, Grids, DBGrids, ExtDlgs,
  ExtCtrls;

type
  TfrmCadVeiculos = class(TForm)
    gbCadVeiculo: TGroupBox;
    DBEPlaca: TDBEdit;
    DBECor: TDBEdit;
    DBEModelo: TDBEdit;
    DBEMarca: TDBEdit;
    DBREspec: TDBRichEdit;
    btnCarregar: TButton;
    lblModelo: TLabel;
    lblAno: TLabel;
    lblMarca: TLabel;
    lblCor: TLabel;
    lblPlaca: TLabel;
    lblEspec: TLabel;
    DBGrid1: TDBGrid;
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    btnConsultar: TButton;
    btnSair: TButton;
    lblVlrVeiculos: TLabel;
    OpenPicture: TOpenPictureDialog;
    DBImgVeic: TDBImage;
    Button1: TButton;
    DateAno: TDateTimePicker;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure lblVlrVeiculosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MakeThumbNail(aSource :TGraphic; aDest: TBitmap; iWidth, iHeight: Integer);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeiculos: TfrmCadVeiculos;

implementation

uses UDMRentCar, DateUtils, UGerVlrVeiculo;

{$R *.dfm}

procedure TfrmCadVeiculos.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCadVeiculos.btnSalvarClick(Sender: TObject);
var
  aDest :TBitmap;
  ano : word;
begin
 ano := YearOf(DateAno.Date);
 
 DBREspec.Text := 'Carro :  '+DBEModelo.Text +' Ano : '+ IntToStr(ano) +' Marca: '+DBEMarca.Text +' Cor : '+DBECor.Text;

 aDest := tbitmap.create;
 aDest.Width := 95;
 aDest.Height := 95;
 aDest.Canvas.StretchDraw(Rect(0, 0, aDest.width, aDest.Height), DBImgVeic.Picture.Graphic);
 DBImgVeic.Picture.Assign(aDest);
 dmRentCar.ZTCadVeiculoVel_Ano.Value := ano;
 dmRentCar.ZTCadVeiculo.post;
 lblVlrVeiculos.Enabled := True;
end;

procedure TfrmCadVeiculos.btnCarregarClick(Sender: TObject);
begin
 if OpenPicture.Execute then
  DBImgVeic.Picture.LoadFromFile(OpenPicture.Filename);
end;

procedure TfrmCadVeiculos.btnAlterarClick(Sender: TObject);
begin
 gbCadVeiculo.Enabled := True;
 dmRentCar.ZTCadVeiculo.Edit;
end;

procedure TfrmCadVeiculos.btnExcluirClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Delete;
end;

procedure TfrmCadVeiculos.btnLimparClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.ClearFields;
end;

procedure TfrmCadVeiculos.lblVlrVeiculosClick(Sender: TObject);
begin
 dmRentCar.ZTGerVal.Open;
 Application.CreateForm(TfrmRentCarVlrVeiculos, frmRentCarVlrVeiculos);
 frmRentCarVlrVeiculos.ShowModal;
 frmRentCarVlrVeiculos.Free;
 dmRentCar.ZTGerVal.Close;
end;

procedure TfrmCadVeiculos.Button1Click(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Insert;
end;

procedure TfrmCadVeiculos.MakeThumbNail(aSource: TGraphic; aDest: TBitmap;
  iWidth, iHeight: Integer);
var
  Escala :Double;
begin
  aDest.Width := iWidth;
  aDest.Height := iHeight;

// Esta parte � utilizada para manter a propor��o, sem que
// o maior dos lados ultrapasse a maior medida informada (acho que est� 100%)
  Escala := aSource.Width /aSource.Height;
  if (iWidth *Escala) > iHeight then
    aDest.Height := Round(iHeight /Escala)
  else
    if (iHeight /Escala) > iWidth then
      aDest.Width := Round(iWidth *Escala);

// Desenha a imagem no tamanho calculado
  aDest.Canvas.StretchDraw(Rect(0, 0, aDest.Width, aDest.Height), aSource);
end;



end.
