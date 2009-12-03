unit URelVelDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, pngimage;

type
  TfrmRelVelDisp = class(TForm)
    QRVelDisp: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBImgVel: TQRDBImage;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVelDisp: TfrmRelVelDisp;

implementation

uses UDMRentCar;

{$R *.dfm}

end.
