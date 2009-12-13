unit UGerar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls;

type
  TfrmGerar = class(TForm)
    gbFiltros: TGroupBox;
    Label1: TLabel;
    DBLookupCliente: TDBLookupComboBox;
    btnGerar: TButton;
    pbPerfil: TProgressBar;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerar: TfrmGerar;

implementation

uses URentCarPrincipal, UPerfil, UDMRentCar, UContrato;

{$R *.dfm}

procedure TfrmGerar.btnGerarClick(Sender: TObject);
Var
i : integer;
begin
 if frmRentCarPrincipal.gerar = 'P' then
 Begin
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
   Application.CreateForm(TfrmPerfil,frmPerfil);
   frmPerfil.ZQFunctions.Close;
   frmPerfil.ZQFunctions.SQL.Clear;
   frmPerfil.ZQFunctions.SQL.Add('select distinct Vel_Img, Vel_Espec from rentcar_veiculo');
   frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_alugar on rentcar_veiculo.Vel_id = rentcar_alugar.RentCar_Veiculo_Vel_id ');
   frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pessoa on rentcar_pessoa.Pes_id = rentcar_alugar.RentCar_Pessoa_Pes_id ');
   if frmRentCarPrincipal.perfil = 'F' then
   Begin
     frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pesfis on rentcar_pesfis.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
     //frmPerfil.ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_StatusLoc = "L" or rentcar_veiculo.Vel_StatusRes = "R" ');
     frmPerfil.ZQFunctions.SQL.Add('where rentcar_pesfis.PesFis_Nome = "'+frmGerar.DBLookupCliente.Text+'"');
     frmPerfil.ZQFunctions.Open;
   end else
   if frmRentCarPrincipal.perfil = 'J' then
   Begin
     frmPerfil.ZQFunctions.SQL.Add('inner join rentcar_pesju on rentcar_pesju.RentCar_Pessoa_Pes_id = rentcar_pessoa.Pes_id');
     //frmPerfil.ZQFunctions.SQL.Add('where rentcar_veiculo.Vel_StatusLoc = "L" or rentcar_veiculo.Vel_StatusRes = "R" ');
     frmPerfil.ZQFunctions.SQL.Add('where rentcar_pesju.PesJu_NmFantasia = "'+frmGerar.DBLookupCliente.Text+'"');
     frmPerfil.ZQFunctions.Open;
   end;
   
   if (frmPerfil.ZQFunctions.fieldbyname('Vel_Espec').AsString = '') then
    Begin
      ShowMessage('O cliente '+frmGerar.DBLookupCliente.Text+ ' não alugou/reservou nenhum veículo');
      pbPerfil.Position:= 0;
    end else
    Begin
    close;
    frmPerfil.ShowModal;
    frmPerfil.Free;
   end;
  end;
 end else
 if frmRentCarPrincipal.gerar = 'C' then
 Begin
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
        ZQAlugar.SQL.Add('where PesFis_Nome = "'+frmGerar.DBLookupCliente.Text+'"');
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
        ZQAlugar.SQL.Add('where PesJu_NmFantasia = "'+frmGerar.DBLookupCliente.Text+'"');
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
end;

end.
