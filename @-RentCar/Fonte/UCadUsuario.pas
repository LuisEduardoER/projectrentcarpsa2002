unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, Buttons;

type
  TfrmCadUsuarios = class(TForm)
    gbUsuarios: TGroupBox;
    DBRGPerfil: TDBRadioGroup;
    lblAdicionarPerfil: TLabel;
    DBESenha: TDBEdit;
    lblSenha: TLabel;
    DBLookupCBPessoa: TDBLookupComboBox;
    lblUsuario: TLabel;
    btnCadastrar: TBitBtn;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBLookupCBPessoaClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
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

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZQFunctions.Close;
  ZQFunctions.SQL.Clear;
  ZQFunctions.SQL.Add('select Pes_id,PesFis_Nome from rentcar_pessoa ');
  ZQFunctions.SQL.Add(' inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
  ZQFunctions.SQL.Add(' where rentcar_pesfis.PesFis_Tipo = "F"');
  ZQFunctions.Open;

  DBLookupCBPessoa.ListSource := dmRentCar.dsQFunctions;
  DBLookupCBPessoa.ListField := 'PesFis_Nome';
  DBLookupCBPessoa.KeyField := 'Pes_id';
  ZQFunctions.Refresh;
 end;
end;

procedure TfrmCadUsuarios.DBLookupCBPessoaClick(Sender: TObject);
begin
 With dmRentCar do
 Begin
  ZTAcesso.Open;
  ZTAcesso.Filtered := False;
  ZTAcesso.Filter := 'RentCar_PesFis_PesFis_id = '+ QuotedStr(dmRentCar.ZQFunctions.fieldbyname('Pes_id').AsString);
  ZTAcesso.Filtered := True;

  if not ZTAcesso.IsEmpty then
   Begin
     ZTAcesso.Cancel;
     btnCadastrar.Enabled := False;
     btnSalvar.Enabled := False;
     btnAlterar.Enabled := True;
   end;
 end;

end;

procedure TfrmCadUsuarios.btnCadastrarClick(Sender: TObject);
begin
// dmRentCar.ZTAcesso.Open;
 dmRentCar.ZTAcesso.Insert;
 gbUsuarios.Enabled := True;
 btnSalvar.Enabled := True;
 btnCadastrar.Enabled := False;

end;

procedure TfrmCadUsuarios.btnSalvarClick(Sender: TObject);
begin
 if DBLookupCBPessoa.Text = '' then
 Begin
   ShowMessage('Escolha o usu�rio');
 end else
 Begin
   dmRentCar.ZTAcessoRentCar_PesFis_PesFis_id.Value := dmRentCar.ZQFunctions.fieldbyname('Pes_id').AsInteger;
   dmRentCar.ZTAcessoAc_Login.Value := DBLookupCBPessoa.Text;
   dmRentCar.ZTAcesso.Post;
   btnSalvar.Enabled := False;
   btnCadastrar.Enabled := True;
   btnAlterar.Enabled := True;
 end;

end;

procedure TfrmCadUsuarios.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCadUsuarios.btnAlterarClick(Sender: TObject);
begin
 dmRentCar.ZTAcesso.Edit;
 btnSalvar.Enabled := True;

end;

end.
