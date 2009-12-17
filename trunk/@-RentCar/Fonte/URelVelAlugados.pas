unit URelVelAlugados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmRelVel = class(TForm)
    QRVel: TQuickRep;
    QRBand1: TQRBand;
    QRCabecalho: TQRRichText;
    QRlblVec: TQRLabel;
    QRLogo: TQRImage;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRSysDateTime: TQRSysData;
    QRGroup1: TQRGroup;
    QryVel: TZQuery;
    QRDBText1: TQRDBText;
    QRDBImg: TQRDBImage;
    QRDBTEspec: TQRDBText;
    QRLblAcessorios: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVel: TfrmRelVel;

implementation

uses UDMRentCar, URentCarPrincipal;

{$R *.dfm}

end.
