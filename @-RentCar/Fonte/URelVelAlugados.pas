unit URelVelAlugados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage;

type
  TfrmRelVel = class(TForm)
    QRVel: TQuickRep;
    QRBand1: TQRBand;
    QRCabecalho: TQRRichText;
    QRlblVec: TQRLabel;
    QRLogo: TQRImage;
    QRBand2: TQRBand;
    QRDBImg: TQRDBImage;
    QRDBTEspec: TQRDBText;
    QRBand3: TQRBand;
    QRSysDateTime: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVel: TfrmRelVel;

implementation

uses UDMRentCar;

{$R *.dfm}

end.
