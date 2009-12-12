unit UGerContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls;

type
  TfrmGerContratos = class(TForm)
    gbFiltros: TGroupBox;
    Label1: TLabel;
    DBLookupCliente: TDBLookupComboBox;
    btnGerarContrato: TButton;
    pbPerfil: TProgressBar;
    procedure btnGerarContratoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerContratos: TfrmGerContratos;

implementation

uses URentCarPrincipal, UContrato, UDMRentCar;

{$R *.dfm}

procedure TfrmGerContratos.btnGerarContratoClick(Sender: TObject);
var
 i : integer;
begin
  if DBLookupCliente.Text = '' then
  Begin
    ShowMessage('Escolha o Cliente');
  end else
  Begin
   pbPerfil.Max:= 2000;
   for i:= 1 to 2000 do
   Begin
      pbPerfil.Position:=i;
   end;
   close;
   if frmRentCarPrincipal.contrato = 'ContLocPesFis' then
   Begin
      With dmRentCar do
      Begin
        ZQAlugar.Close;
        ZQAlugar.SQL.Clear;
        ZQAlugar.SQL.Add('select distinct PesFis_Nome, PesFis_EstCivil, PesFis_RG, PesFis_CPF, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
        ZQAlugar.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
        ZQAlugar.SQL.Add('from rentcar_pessoa ');
        ZQAlugar.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
        ZQAlugar.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
        ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id  ');
        ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
        ZQAlugar.SQL.Add('where PesFis_Nome = "'+frmGerContratos.DBLookupCliente.Text+'"');
        ZQAlugar.Open;
      end;
     if dmRentCar.ZQAlugar.IsEmpty then
     Begin
      ShowMessage('Não existem dados de locação para o cliente escolhido');
     end else
    Begin
    Application.CreateForm(TfrmContratoLocacao,frmContratoLocacao);
    frmContratoLocacao.QRVelContrLoc.Preview;
    frmContratoLocacao.Free;
    end;
  end else
  if frmRentCarPrincipal.contrato = 'ContLocPesJu' then
  Begin
    With dmRentCar do
      Begin
        ZQAlugar.Close;
        ZQAlugar.SQL.Clear;
        ZQAlugar.SQL.Add('select DISTINCT PesJU_NmFantasia, PesJu_RazaoSocial, PesJu_CNPJ, End_Endereco, End_Num, End_Bairro, End_CEP, End_Cidade, End_Estado, ');
        ZQAlugar.SQL.Add('Vel_Marca, Vel_Modelo, Vel_Ano, Vel_Cor, Vel_Placa ');
        ZQAlugar.SQL.Add('from rentcar_pessoa ');
        ZQAlugar.SQL.Add('inner join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id ');
        ZQAlugar.SQL.Add('inner join rentcar_enderecos on rentcar_enderecos.End_Id = rentcar_pessoa.RentCar_Enderecos_End_Id ');
        ZQAlugar.SQL.Add('inner join rentcar_alugar on rentcar_alugar.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id  ');
        ZQAlugar.SQL.Add('inner join rentcar_veiculo on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
        ZQAlugar.SQL.Add('where PesJu_NmFantasia = "'+frmGerContratos.DBLookupCliente.Text+'"');
        ZQAlugar.Open;
     end;
     
     if dmRentCar.ZQAlugar.IsEmpty then
     Begin
      ShowMessage('Não existem dados de locação para o cliente escolhido');
     end else
     Begin


    Application.CreateForm(TfrmContratoLocacao,frmContratoLocacao);
    frmContratoLocacao.QRVelContrLoc.Preview;
    frmContratoLocacao.Free;

  end;
  end;
  end;
end;

end.

