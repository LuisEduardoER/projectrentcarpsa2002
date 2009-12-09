unit URelCliPesFis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCliPesFis = class(TForm)
    QRCliPesFis: TQuickRep;
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
    QRVecAlu: TQRLabel;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLblNome: TQRLabel;
    QRLblRG: TQRLabel;
    QRLblCPF: TQRLabel;
    QRLblTel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLblCel: TQRLabel;
    QRLblEmail: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliPesFis: TfrmRelCliPesFis;

implementation

uses UDMRentCar;

{$R *.dfm}

end.
