unit UListContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TfrmListContatos = class(TForm)
    DBGListContato: TDBGrid;
    edtBuscar: TEdit;
    btnBuscar: TButton;
    btnSair: TButton;
    procedure DBGListContatoCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListContatos: TfrmListContatos;

implementation

uses MsgEditor, UDMRentCar, DB;

{$R *.dfm}

procedure TfrmListContatos.DBGListContatoCellClick(Column: TColumn);
begin
 frmMessageEditor.edtNameTo.Text := dmRentCar.ZQCliente.fieldbyname('Pes_nome').AsString;
 frmMessageEditor.edtTo.Text := dmRentCar.ZQCliente.fieldbyname('Pes_Email').AsString;
 close;
end;

procedure TfrmListContatos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmListContatos.btnBuscarClick(Sender: TObject);
begin
 with dmRentCar do
 Begin
  ZQCliente.Close;
  ZQCliente.SQL.Clear;
  ZQCliente.SQL.Add('Select rentcar_pessoa.Pes_nome, rentcar_pessoa.Pes_Email');
  ZQCliente.SQL.Add('from rentcar_pessoa');
  ZQCliente.SQL.Add('where rentcar_pessoa.pes_Nome ="'+edtBuscar.Text+'"');
  ZQCliente.Open;
 end; 
end;

end.