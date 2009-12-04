unit UContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage;

type
  TfrmContratoLocacao = class(TForm)
    QRVelContrLoc: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBNome: TQRDBText;
    QRDBEstC: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBRG: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBCPF: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBLogr: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBN: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBBairro: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBCEP: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBCid: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBEst: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBMarca: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBModelo: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBAno: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBCor: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBPlaca: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRVecAlu: TQRLabel;
    QRRichText1: TQRRichText;
    QRImage1: TQRImage;
    QRLabel47: TQRLabel;
    procedure QRVelContrLocBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContratoLocacao: TfrmContratoLocacao;

implementation

uses UDMRentCar, ULocacao;

{$R *.dfm}

procedure TfrmContratoLocacao.QRVelContrLocBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
      With dmRentCar do
      Begin
        ZQAlugar.Close;
        ZQAlugar.SQL.Clear;
        ZQAlugar.SQL.Add('select PesFis_Nome, PesFis_EstCivil, PesFis_RG, PesFis_CPF, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
        ZQAlugar.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
        ZQAlugar.SQL.Add('from rentcar_pessoa ');
        ZQAlugar.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
        ZQAlugar.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
        ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id  ');
        ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
        ZQAlugar.SQL.Add('where PesFis_Nome = "'+frmLocacao.edtCliLoc.Text+'"');
        ZQAlugar.Open;
      end;
end;

end.
