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
    ZQFunctionsVel_Espec: TStringField;
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

end.
