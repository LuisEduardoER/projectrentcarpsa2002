unit UGerarPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls;

type
  TfrmGerarPerfil = class(TForm)
    gbFiltros: TGroupBox;
    btnGerarPerfil: TButton;
    btnB: TButton;
    Label1: TLabel;
    pbPerfil: TProgressBar;
    DBLookupCliente: TDBLookupComboBox;
    procedure btnBClick(Sender: TObject);
    procedure btnGerarPerfilClick(Sender: TObject);
  private
    { Private declarations }
  public
     perfil : string;
    { Public declarations }
  end;

var
  frmGerarPerfil: TfrmGerarPerfil;

implementation

uses UBCliente, UPerfil, URentCarPrincipal;

{$R *.dfm}

procedure TfrmGerarPerfil.btnBClick(Sender: TObject);
begin
 Application.CreateForm(TfrmConsultaClientes, frmConsultaClientes);
 frmConsultaClientes.ShowModal;
 frmConsultaClientes.Free;
end;

procedure TfrmGerarPerfil.btnGerarPerfilClick(Sender: TObject);
var
   i:integer;
begin
  if DBLookupCliente.Text = '' then
  Begin
    ShowMessage('Escolha o Cliente');
  end else
  Begin
   pbPerfil.Max:= 2000;
   for i:= 1 to 2000 do
   Begin
      pbPerfil.Position:=i;
   end;
   Application.CreateForm(TfrmPerfil,frmPerfil);
   frmPerfil.ZQFunctions.Close;
   frmPerfil.ZQFunctions.SQL.Clear;
   frmPerfil.ZQFunctions.SQL.Add('select distinct Vel_Img, Vel_Espec from rentcar_veiculo');
   frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_alugar on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
   frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_alugar.RentCar_Pessoa_Pes_id ');
   if frmRentCarPrincipal.perfil = 'F' then
   Begin
     frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
     //frmPerfil.ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_StatusLoc = "L" or rentcar_veiculo.Vel_StatusRes = "R" ');
     frmPerfil.ZQFunctions.SQL.Add('where rentcar_pesfis.PesFis_Nome = "'+frmGerarPerfil.DBLookupCliente.Text+'"');
     frmPerfil.ZQFunctions.Open;
   end else
   if frmRentCarPrincipal.perfil = 'J' then
   Begin
     frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
     //frmPerfil.ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_StatusLoc = "L" or rentcar_veiculo.Vel_StatusRes = "R" ');
     frmPerfil.ZQFunctions.SQL.Add('where rentcar_pesju.PesJu_NmFantasia = "'+frmGerarPerfil.DBLookupCliente.Text+'"');
     frmPerfil.ZQFunctions.Open;
   end;
   
   if (frmPerfil.ZQFunctions.fieldbyname('Vel_Espec').AsString = '') then
    Begin
      ShowMessage('O cliente '+frmGerarPerfil.DBLookupCliente.Text+ ' n�o alugou/reservou nenhum ve�culo');
      pbPerfil.Position:= 0;
    end else
    Begin
    close;
    frmPerfil.ShowModal;
    frmPerfil.Free;
   end;
  end;
end;

end.