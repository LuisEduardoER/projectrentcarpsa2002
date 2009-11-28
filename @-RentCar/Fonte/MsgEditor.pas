unit MsgEditor;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ComCtrls, ExtCtrls, Grids, Buttons, Menus, IdBaseComponent,
   IdMessage, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
   IdSMTP, ImgList, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL;

type
   TfrmMessageEditor = class(TForm)
      bbtnAdvanced: TBitBtn;
    btnSair: TBitBtn;
      bbtnOk: TBitBtn;
      btnAttachment: TBitBtn;
    edtCaminhoAnexo: TEdit;
      edtSubject: TEdit;
      edtTo: TEdit;
      grpAttachment: TGroupBox;
      lblSubject: TLabel;
      lblTo: TLabel;
    MCorpo: TMemo;
      pnlBottom: TPanel;
    btnContatos: TPanel;
      pnlMainDetails: TPanel;
      pnlSmallButtons: TPanel;
    SMTP: TIdSMTP;
    SSLSocket: TIdSSLIOHandlerSocket;
    MSG: TIdMessage;
    OpenDialog1: TOpenDialog;
    sbRentCar: TStatusBar;
    Label1: TLabel;
    edtNameTo: TEdit;
    ProgressBar1: TProgressBar;
      procedure btnAttachmentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure bbtnAdvancedClick(Sender: TObject);
   private
    { Private declarations }
   public
    { Public declarations }
   end;

var
   frmMessageEditor: TfrmMessageEditor;



implementation

uses UListContato, ULocacao;

{$R *.DFM}

procedure TfrmMessageEditor.btnAttachmentClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
      begin
      TIdAttachment.Create(MSG.MessageParts, OpenDialog1.FileName);
      edtCaminhoAnexo.Text := OpenDialog1.FileName;
      end;
end;


procedure TfrmMessageEditor.FormShow(Sender: TObject);
begin
  sbRentCar.Panels[1].Text := DateToStr(date);
  sbRentCar.Panels[2].Text := TimeToStr(now);
  //Application.CreateForm(TfrmLocacao, frmLocacao);
  if frmLocacao.email = 'r' then
  Begin
   MCorpo.Lines.Add('--------------------------------'+
                   '--------------------------------'+
                   '@-RentCar - Locadora de Veículos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Srº'+' '+'informamos que a foi feita a reserva do veículo '+''+'');
  end else
  if frmLocacao.email = 'l' then
  Begin
   MCorpo.Lines.Add('--------------------------------'+
                   '--------------------------------'+
                   '@-RentCar - Locadora de Veículos'+
                   '-----------------------------------'+
                   '-----------------------------------'+
                   '         '+
                   'Srº'+' '+'estamos mandando esse e-mail para confirmar a locação do veículo '+''+'');
  end;
 // frmLocacao.Free;
end;

procedure TfrmMessageEditor.bbtnOkClick(Sender: TObject);
begin
  if (edtTo.Text = '') then
   Begin
     ShowMessage('Digite o e-mail do destinatário');
     edtTo.SetFocus;
   end
   else
   if (edtNameTo.Text = '') then
   Begin
     ShowMessage('Digite um nome para o destinatário');
     edtNameTo.SetFocus;
   end
   else
  Begin
   with MSG do
   begin
      Body.Add(MCorpo.Text);
      From.Address := 'arllm_@hotmail.com'; //opcional
      From.Name := '@-RentCar'; //opcional
      Recipients.Add;
      Recipients.Items[0].Address := edtTo.Text;
      Recipients.Items[0].Name := edtNameTo.Text; //opcional
      Subject := edtSubject.Text;
   end;

   try
      SMTP.Connect();
      SMTP.Send(MSG);
      SMTP.Disconnect;
   except
      ShowMessage('Falha no envio!');
      exit;
   end;
   ShowMessage('Mensagem enviada com sucesso!');
 end;
end;

procedure TfrmMessageEditor.FormCreate(Sender: TObject);
begin
 with SMTP do
   begin
      AuthenticationType := atLogin;
      Host := 'smtp.gmail.com';
      IOHandler := SSLSocket;
      Password := 'mangue3088';
      Port := 465;
      Username := 'arllmcomputacao@gmail.com'; //não esqueça o @gmail.com!!
   end;

   SSLSocket.SSLOptions.Method := sslvSSLv2;
   SSLSocket.SSLOptions.Mode := sslmClient;
end;

procedure TfrmMessageEditor.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmMessageEditor.bbtnAdvancedClick(Sender: TObject);
begin
  Application.CreateForm(TfrmListContatos, frmListContatos);
  frmListContatos.ShowModal;
  frmListContatos.Free;
end;

end.

