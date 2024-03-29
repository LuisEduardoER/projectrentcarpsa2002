unit UCadVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask, Grids, DBGrids, ExtDlgs,
  ExtCtrls, Menus, Buttons;

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
    OpenPicture: TOpenPictureDialog;
    DBImgVeic: TDBImage;
    DateAno: TDateTimePicker;
    MenuVec: TMainMenu;
    Opcoes: TMenuItem;
    ValoresVeiculos: TMenuItem;
    AdicionarAcessorios: TMenuItem;
    btnFechar: TBitBtn;
    btnProcurar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCadastrar: TBitBtn;
    btnAlterar: TBitBtn;
    procedure btnCarregarClick(Sender: TObject);
    procedure MakeThumbNail(aSource :TGraphic; aDest: TBitmap; iWidth, iHeight: Integer);
    procedure DBECorKeyPress(Sender: TObject; var Key: Char);
    procedure DBEModeloKeyPress(Sender: TObject; var Key: Char);
    procedure DBEMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure DateAnoKeyPress(Sender: TObject; var Key: Char);
    procedure ValoresVeiculosClick(Sender: TObject);
    procedure AdicionarAcessoriosClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEPlacaExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeiculos: TfrmCadVeiculos;

implementation

uses UDMRentCar, DateUtils, UGerVlrVeiculo, UConsultas, UCadAcessorios;

{$R *.dfm}

procedure TfrmCadVeiculos.btnCarregarClick(Sender: TObject);
begin
 if OpenPicture.Execute then
  DBImgVeic.Picture.LoadFromFile(OpenPicture.Filename);
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



procedure TfrmCadVeiculos.DBECorKeyPress(Sender: TObject; var Key: Char);
begin
    if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

    if key=#13 then
    Begin
      DBEPlaca.SetFocus;
    end;

end;

procedure TfrmCadVeiculos.DBEModeloKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

    if key=#13 then
    Begin
      DateAno.SetFocus;
    end;

end;

procedure TfrmCadVeiculos.DBEMarcaKeyPress(Sender: TObject; var Key: Char);
begin
    if Not (key in ['A'..'Z','a'..'z',#13,#8,#32]) then
    key := #0;

    if key=#13 then
    Begin
      DBECor.SetFocus;
    end;

end;

procedure TfrmCadVeiculos.DateAnoKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    Begin
      DBEMarca.SetFocus;
    end;

end;

procedure TfrmCadVeiculos.ValoresVeiculosClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Open;
 dmRentCar.ZTGerVal.Open;
 Application.CreateForm(TfrmRentCarVlrVeiculos, frmRentCarVlrVeiculos);
 dmRentCar.ZTGerVal.Filtered := False;
 dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
 dmRentCar.ZTGerVal.Filtered := True;

  if dmRentCar.ZTGerVal.IsEmpty then
 Begin
   dmRentCar.ZTGerVal.Insert;
   frmRentCarVlrVeiculos.btnAlterar.Enabled:= False;
 end else
 Begin
   dmRentCar.ZTGerVal.Edit;
   frmRentCarVlrVeiculos.btnCadastrar.Enabled := False;
 end;
 frmRentCarVlrVeiculos.ShowModal;
 frmRentCarVlrVeiculos.Free;
 dmRentCar.ZTGerVal.Close;

end;

procedure TfrmCadVeiculos.AdicionarAcessoriosClick(Sender: TObject);
begin
 dmRentCar.ZTAcessorios.Open;
 dmRentCar.ZTTipoAcessorios.Open;
 Application.CreateForm(TfrmAcessorios, frmAcessorios);
 dmRentCar.ZQFunctions.Close;
 dmRentCar.ZQFunctions.SQL.Clear;
 dmRentCar.ZQFunctions.SQL.Add('Select TipoAcessorio_Id, Acess�rio from rentcar_tipoacessorios ');
 dmRentCar.ZQFunctions.SQL.Add('inner join rentcar_acessorio on rentcar_acessorio.RentCar_TipoAcessorios_TipoAcessorio_Id = rentcar_tipoacessorios.TipoAcessorio_Id ');
 dmRentCar.ZQFunctions.SQL.Add('where rentcar_acessorio.RentCar_Veiculo_Vel_id = "'+dmRentCar.ZTCadVeiculoVel_id.AsString+'"');
 dmRentCar.ZQFunctions.Open;
 frmAcessorios.DBLookupAcessorios.ListSource := dmRentCar.dsQFunctions;
 frmAcessorios.DBLookupAcessorios.ListField := 'Acess�rio';
 frmAcessorios.DBLookupAcessorios.KeyField := 'TipoAcessorio_Id';


 frmAcessorios.tsTipoAcessorios.Destroy;
 frmAcessorios.ShowModal;
 frmAcessorios.Free;
 dmRentCar.ZTAcessorios.Close;
 dmRentCar.ZTTipoAcessorios.Close;
end;

procedure TfrmCadVeiculos.btnCadastrarClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Insert;
 btnSalvar.Enabled := True;
 btnCadastrar.Enabled := False;
 gbCadVeiculo.Enabled := True;
 DBEModelo.SetFocus;

end;

procedure TfrmCadVeiculos.btnSalvarClick(Sender: TObject);
var
  aDest :TBitmap;
  ano : word;
begin
  if (DBEModelo.Text = '') then
  Begin
    ShowMessage('Modelo � um campo obrigrat�rio');
    DBEModelo.SetFocus;
  end else
  if (DBEMarca.Text = '') then
  Begin
    ShowMessage('Marca � um campo obrigrat�rio');
    DBEMarca.SetFocus;
  end else
  if (DBECor.Text = '') then
  Begin
    ShowMessage('Cor � um campo obrigrat�rio');
    DBECor.SetFocus;
  end else
  if (DBEPlaca.Text = '') then
  Begin
    ShowMessage('Placa � um campo obrigrat�rio');
    DBEPlaca.SetFocus;
  end else
  Begin
    ano := YearOf(DateAno.Date);
    DBREspec.Text := 'Carro :  '+DBEModelo.Text +' Ano : '+ IntToStr(ano) +' Marca: '+DBEMarca.Text +' Cor : '+DBECor.Text;
    aDest := tbitmap.create;
    aDest.Width := 95;
    aDest.Height := 95;
    aDest.Canvas.StretchDraw(Rect(0, 0, aDest.width, aDest.Height), DBImgVeic.Picture.Graphic);
    DBImgVeic.Picture.Assign(aDest);
    dmRentCar.ZTCadVeiculoVel_Ano.Value := ano;
    dmRentCar.ZTCadVeiculoVel_StatusLoc.Value := 'L';
    dmRentCar.ZTCadVeiculoVel_StatusRes.Value := 'R';
    dmRentCar.ZTCadVeiculo.post;
    btnSalvar.Enabled := False;
    btnCadastrar.Enabled := True;
    btnAlterar.Enabled := True;
    btnExcluir.Enabled := True;
    frmCadVeiculos.AdicionarAcessorios.Enabled := True;
    frmCadVeiculos.ValoresVeiculos.Enabled := True;
 end;
end;

procedure TfrmCadVeiculos.btnExcluirClick(Sender: TObject);
begin
 dmRentCar.ZTGerVal.Open;
 dmRentCar.ZTAcessorios.Open;

 dmRentCar.ZTGerVal.Filtered := False;
 dmRentCar.ZTGerVal.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
 dmRentCar.ZTGerVal.Filtered := True;

 dmRentCar.ZTAcessorios.Filtered := False;
 dmRentCar.ZTAcessorios.Filter := 'RentCar_Veiculo_Vel_id = '+QuotedStr(dmRentCar.ZTCadVeiculoVel_id.AsString);
 dmRentCar.ZTAcessorios.Filtered := True;

 if not dmRentCar.ZTAcessorios.IsEmpty then
 Begin
   while not dmRentCar.ZTAcessorios.eof do
   Begin
     dmRentCar.ZTAcessorios.Delete;
     dmRentCar.ZTAcessorios.Next;
   end;
 end else
 Begin
    dmRentCar.ZTCadVeiculo.Delete;
 end;

 if not dmRentCar.ZTGerVal.IsEmpty then
 Begin
   dmRentCar.ZTCadVeiculo.Delete;
 end else
 Begin
   dmRentCar.ZTCadVeiculo.Delete;
 end;

end;

procedure TfrmCadVeiculos.btnProcurarClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Open;
 Application.CreateForm(TfrmConsultas, frmConsultas);
 frmConsultas.tsConsultClientes.Destroy;
 frmConsultas.tsConsultLoc.Destroy;
 frmConsultas.tsListagemChamados.Destroy;
 frmConsultas.ShowModal;
 frmConsultas.Free;

end;

procedure TfrmCadVeiculos.btnFecharClick(Sender: TObject);
begin
 close;

end;

procedure TfrmCadVeiculos.btnCancelarClick(Sender: TObject);
begin
 dmRentCar.ZTCadVeiculo.Cancel;
end;

procedure TfrmCadVeiculos.btnAlterarClick(Sender: TObject);
begin
 gbCadVeiculo.Enabled := True;
 if dmRentCar.ZTCadVeiculo.IsEmpty then
 Begin
    ShowMessage('N�o existe(m) ve�culo(s) para ser(m) alterado(s)');
 end else
 Begin
    dmRentCar.ZTCadVeiculo.Edit;
    btnSalvar.Enabled := True;
 end;
 btnSalvar.Enabled := True;

end;

procedure TfrmCadVeiculos.FormShow(Sender: TObject);
begin
 if not dmRentCar.ZTCadVeiculo.IsEmpty then
 Begin
   btnAlterar.Enabled:= True;
   btnExcluir.Enabled := True;
 end;
end;

procedure TfrmCadVeiculos.DBEPlacaExit(Sender: TObject);
begin
if pos(' ',DBEPlaca.Text) > 0 Then
 begin
  showmessage('Campo com espa�o(s) em branco digite novamente');
  DBEPlaca.SetFocus;
end;

end;

end.
