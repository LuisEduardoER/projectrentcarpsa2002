unit UCapImage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Videocap, ExtCtrls, Jpeg,Clipbrd, StdCtrls,inifiles;

type
  TfrmCapImage = class(TForm)
    GroupBox1: TGroupBox;
    CheckPrev: TCheckBox;
    BtSPict: TButton;
    PnlImagem: TPanel;
    VCImagem: TVideoCap;
    procedure BtSPictClick(Sender: TObject);
    procedure CheckPrevClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapImage: TfrmCapImage;

implementation

uses UCadCliente;

{$R *.dfm}

procedure TfrmCapImage.BtSPictClick(Sender: TObject);
Var BMP : TBitMap;
    JPG : TJpegImage;
    ini:TInifile;
    aDest :TBitmap;
    caminhoImg : string;
begin
  caminhoImg := ExtractFilePath('C:\Documents and Settings\Alan\Meus documentos\Alain\Projetos\@-rentcar\@-RentCar\Imagens\') + 'Foto'+frmCadClientes.DBENome.Text+'.jpg';
  ini:= TInifile.Create('vcap.ini');
  VCImagem.Driverindex := 0;
  VCImagem.Driverindex := ini.readInteger('Driver','index',0);
  ini.free;


  VCImagem.SaveToClipboard;
  BMP := TBitMap.Create;
  BMP.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  JPG := TJpegImage.Create;
  JPG.Assign(BMP);
  JPG.SaveToFile(caminhoImg);
  JPG.Free;


  frmCadClientes.OpenPicture.FileName := 'Foto'+frmCadClientes.DBENome.Text+'.jpg' ;
  frmCadClientes.OpenPicture.InitialDir := 'C:\Documents and Settings\Alan\Meus documentos\Alain\Projetos\@-rentcar\@-RentCar\Imagens\';
  frmCadClientes.DBImgCli.Picture.LoadFromFile('C:\Documents and Settings\Alan\Meus documentos\Alain\Projetos\@-rentcar\@-RentCar\Imagens\Foto'+frmCadClientes.DBENome.Text+'.jpg');
  aDest := tbitmap.create;
  aDest.Width := 95;
  aDest.Height := 95;
  aDest.Canvas.StretchDraw(Rect(0, 0, aDest.width, aDest.Height), frmCadClientes.DBImgCli.Picture.Graphic);
  frmCadClientes.DBImgCli.Picture.Assign(aDest);
  close;


end;

procedure TfrmCapImage.CheckPrevClick(Sender: TObject);
begin
 VCImagem.VideoPreview:=CheckPrev.Checked;
end;

end.
