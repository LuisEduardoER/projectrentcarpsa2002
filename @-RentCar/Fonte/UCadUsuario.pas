unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls;

type
  TfrmCadUsuarios = class(TForm)
    DBLookupCBPessoa: TDBLookupComboBox;
    DBESenha: TDBEdit;
    btnCadastar: TButton;
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    lblPessoa: TLabel;
    lblSenha: TLabel;
    lblAdicionarPerfil: TLabel;
    DBRGPerfil: TDBRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadastarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBLookupCBPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses UDMRentCar, DB;

{$R *.dfm}

procedure TfrmCadUsuarios.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZQFunctions.Close;
  ZQFunctions.SQL.Clear;
  ZQFunctions.SQL.Add('select Pes_id,PesFis_Nome from rentcar_pessoa, rentcar_pesfis ');
  ZQFunctions.SQL.Add('where rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
  ZQFunctions.Open;
 end;
end;

procedure TfrmCadUsuarios.btnSalvarClick(Sender: TObject);
begin
 dmRentCar.ZTAcessoRentCar_PesFis_PesFis_id.Value := dmRentCar.ZQFunctions.fieldbyname('Pes_id').AsInteger;
 dmRentCar.ZTAcessoAc_Login.Value := DBLookupCBPessoa.Text;
 dmRentCar.ZTAcesso.Post;
 btnSalvar.Enabled := False;
end;

procedure TfrmCadUsuarios.btnCadastarClick(Sender: TObject);
begin
// dmRentCar.ZTAcesso.Open;
 dmRentCar.ZTAcesso.Insert;
 btnSalvar.Enabled := True;
end;

procedure TfrmCadUsuarios.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTAcesso.Edit;
end;

procedure TfrmCadUsuarios.DBLookupCBPessoaClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTAcesso.Filtered := False;
  ZTAcesso.Filter := 'RentCar_PesFis_PesFis_id = '+ QuotedStr(dmRentCar.ZQFunctions.fieldbyname('Pes_id').AsString);
  ZTAcesso.Filtered := True;
  ZTAcesso.Open;
  ShowMessage(ZTAcesso.Filter);
  if not ZTAcesso.IsEmpty then
   Begin
     btnCadastar.Enabled := False;
   end;
 end;

end;

end.
