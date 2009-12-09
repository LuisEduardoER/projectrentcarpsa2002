unit URelVelAlugados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage;

type
  TfrmRelVelAlugados = class(TForm)
    QRVelAlugados: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBImgVel: TQRDBImage;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRRichText1: TQRRichText;
    QRVecAlu: TQRLabel;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVelAlugados: TfrmRelVelAlugados;

implementation

uses UDMRentCar;

{$R *.dfm}

end.
