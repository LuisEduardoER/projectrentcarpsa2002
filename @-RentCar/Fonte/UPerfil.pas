unit UPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids;

type
  TfrmPerfil = class(TForm)
    DBNPerfil: TDBNavigator;
    DBTEspec: TDBText;
    Label1: TLabel;
    ZQFunctions: TZQuery;
    dsQFunctions: TDataSource;
    DBImgPerfil: TDBImage;
    ZQFunctionsVel_Img: TBlobField;
    ZQFunctionsMaxVel_Espec: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerfil: TfrmPerfil;

implementation

uses UDMRentCar, UGerarPerfil;

{$R *.dfm}

procedure TfrmPerfil.FormShow(Sender: TObject);
begin
   ZQFunctions.Close;
   ZQFunctions.SQL.Clear;
   ZQFunctions.SQL.Add('select Vel_Img, Max(Vel_Espec) from rentcar_veiculo');
   ZQFunctions.SQL.Add('inner join rentcar_alugar on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
   ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_alugar.RentCar_Pessoa_Pes_id ');
   ZQFunctions.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
   ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_StatusLoc = "L" or rentcar_veiculo.Vel_StatusRes = "R" ');
   ZQFunctions.SQL.Add('and rentcar_pesfis.PesFis_Nome = "'+frmGerarPerfil.edtCli.Text+'"');
   ZQFunctions.Open;

  if (ZQFunctions.IsEmpty) then
    Begin
      ShowMessage('krai');
    end;
end;

end.
