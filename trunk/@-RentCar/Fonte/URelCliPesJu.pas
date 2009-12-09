unit URelCliPesJu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCliPesJu = class(TForm)
    QRCliPesJu: TQuickRep;
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
    QRVecAlu: TQRLabel;
    QRImage1: TQRImage;
    QRLblNome: TQRLabel;
    QRLblRG: TQRLabel;
    QRLblCPF: TQRLabel;
    QRLblTel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLblCel: TQRLabel;
    QRLblEmail: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliPesJu: TfrmRelCliPesJu;

implementation

{$R *.dfm}

end.
