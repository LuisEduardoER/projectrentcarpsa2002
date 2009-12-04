unit UListChamados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TfrmListChamados = class(TForm)
    DBGListChamados: TDBGrid;
    gbFiltros: TGroupBox;
    ckProtocolo: TCheckBox;
    edtProtocol: TEdit;
    btnAnterior: TButton;
    btnProximo: TButton;
    btnBuscar: TButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure ckProtocoloClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGListChamadosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListChamados: TfrmListChamados;

implementation

uses URentCarPrincipal, UDMRentCar;

{$R *.dfm}

procedure TfrmListChamados.btnBuscarClick(Sender: TObject);
begin
 if frmRentCarPrincipal.chamado = 'LF' then
  Begin
   with dmRentCar do
   Begin
    ZQFunctions.Close;
    ZQFunctions.SQL.Clear;
    ZQFunctions.SQL.Add('select Ch_TipoCh, Ch_Protocol, Ch_HoraCh, Ch_DataCh, Ch_Status ');
    ZQFunctions.SQL.Add('from rentcar_chamado ');
    ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_chamado.RentCar_Pessoa_Pes_id ');
    if edtProtocol.Text = '' then
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "F" ');
    end else
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "F" and Ch_Protocol = "'+edtProtocol.Text+'"');
    end;
    ZQFunctions.Open;
   end;
  end else
  if frmRentCarPrincipal.chamado = 'LE' then
  Begin
   with dmRentCar do
   Begin
    ZQFunctions.Close;
    ZQFunctions.SQL.Clear;
    ZQFunctions.SQL.Add('select Ch_TipoCh, Ch_Protocol, Ch_HoraCh, Ch_DataCh, Ch_Status ');
    ZQFunctions.SQL.Add('from rentcar_chamado ');
    ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_chamado.RentCar_Pessoa_Pes_id ');
    if edtProtocol.Text = '' then
    Begin
    ZQFunctions.SQL.Add('where ch_Status = "E" ');
    end else
    Begin
      ZQFunctions.SQL.Add('where ch_Status = "E" and Ch_Protocol = "'+edtProtocol.Text+'"');
    end;
    ZQFunctions.Open;
   end;
  end;
end;

procedure TfrmListChamados.ckProtocoloClick(Sender: TObject);
begin
  edtProtocol.Enabled := True;
  edtProtocol.SetFocus;
end;

procedure TfrmListChamados.btnAnteriorClick(Sender: TObject);
begin
 dmRentCar.ZQFunctions.Prior;
end;

procedure TfrmListChamados.btnProximoClick(Sender: TObject);
begin
 dmRentCar.ZQFunctions.Next;
end;

procedure TfrmListChamados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmRentCar.ZQFunctions.Close;
end;

procedure TfrmListChamados.DBGListChamadosCellClick(Column: TColumn);
begin

 if frmRentCarPrincipal.chamado = 'LE' then
 Begin
 if dmRentCar.ZQFunctions.RecordCount <= 0 then
  Begin
   ShowMessage('Nao existem mais chamados');
  end else
 if Application.MessageBox('Deseja mudar o Status do Chamado para Finalizado?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
 Begin
 dmRentCar.ZQFunctions.Edit;
 dmRentCar.ZQFunctions.fieldbyname('Ch_Status').Value := 'F';
 dmRentCar.ZQFunctions.Post;
 dmRentCar.ZQFunctions.Refresh;
 end;
 end else
 if frmRentCarPrincipal.chamado = 'LF' then
 Begin
  if dmRentCar.ZQFunctions.RecordCount <= 0 then
  Begin
   ShowMessage('Nao existem mais chamados');
  end else
 if Application.MessageBox('Deseja mudar o Status do Chamado para Em Espera?', 'Aviso', mb_yesno + mb_defbutton2) = idYes then
 Begin
 dmRentCar.ZQFunctions.Edit;
 dmRentCar.ZQFunctions.fieldbyname('Ch_Status').Value := 'E';
 dmRentCar.ZQFunctions.Post;
 dmRentCar.ZQFunctions.Refresh;
 end;
 end;
end;

end.
