unit URelVelRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage;

type
  TfrmRelVelRes = class(TForm)
    QRVelRes: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBImgVel: TQRDBImage;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRRichText1: TQRRichText;
    QRVecRes: TQRLabel;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVelRes: TfrmRelVelRes;

implementation

uses UDMRentCar;

{$R *.dfm}

end.