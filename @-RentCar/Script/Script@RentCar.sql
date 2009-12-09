CREATE TABLE RentCar_Acesso (
  Ac_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_PesFis_PesFis_id INTEGER NOT NULL,
  Ac_Login VARCHAR(15) NULL,
  Ac_Senha INTEGER(15) NULL,
  Ac_Perfil CHAR(1) NULL,
  PRIMARY KEY(Ac_id),
  INDEX RentCar_Acesso_PesFis(RentCar_PesFis_PesFis_id)
);

CREATE TABLE RentCar_Alugar (
  Alu_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Pessoa_Pes_id INTEGER NOT NULL,
  RentCar_Ger_Valores_GerVal_id INTEGER NOT NULL,
  RentCar_Veiculo_Vel_id INTEGER NOT NULL,
  PerInicialLoc DATE NULL,
  PerFinalLoc DATE NULL,
  DataReserva DATE NULL,
  PRIMARY KEY(Alu_id),
  INDEX RentCar_Alugar_Veiculo(RentCar_Veiculo_Vel_id),
  INDEX RentCar_Alugar_Valores(RentCar_Ger_Valores_GerVal_id),
  INDEX RentCar_Alugar_Pessoa(RentCar_Pessoa_Pes_id)
);

CREATE TABLE RentCar_Chamado (
  Ch_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Pessoa_Pes_id INTEGER NOT NULL,
  Ch_TipoCh VARCHAR(15) NULL,
  Ch_DescCh TEXT NULL,
  Ch_Protocol INTEGER(11) NULL,
  Ch_HoraCh TIME NULL,
  Ch_DataCh DATE NULL,
  Ch_Status CHAR(1) NULL,
  PRIMARY KEY(Ch_id),
  INDEX RentCar_Chamado_Pessoa(RentCar_Pessoa_Pes_id)
);

CREATE TABLE RentCar_Enderecos (
  End_Id INTEGER NOT NULL AUTO_INCREMENT,
  End_Cidade VARCHAR(30) NULL,
  End_Endereco VARCHAR(50) NULL,
  End_Bairro VARCHAR(20) NULL,
  End_Estado CHAR(2) NULL,
  End_CEP VARCHAR(15) NULL,
  End_Num INTEGER NULL,
  PRIMARY KEY(End_Id)
);

CREATE TABLE RentCar_Ger_Valores (
  GerVal_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Veiculo_Vel_id INTEGER NOT NULL,
  GerVal_ValAlu DECIMAL(10,2) NULL,
  GerVal_ValAPag DECIMAL(10,2) NULL,
  GerVal_TipoPag CHAR(15) NULL,
  PRIMARY KEY(GerVal_id),
  INDEX RentCar_Ger_Valores_Veiculo(RentCar_Veiculo_Vel_id)
);

CREATE TABLE RentCar_PesFis (
  PesFis_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Pessoa_Pes_id INTEGER NOT NULL,
  PesFis_RG VARCHAR(15) NULL,
  PesFis_CPF VARCHAR(15) NULL,
  PesFis_Sexo CHAR(1) NULL,
  PesFis_Tipo CHAR(1) NULL,
  PesFis_EstCivil CHAR(1) NULL,
  PesFis_CNH VARCHAR(20) NULL,
  PesFis_Validade DATE NULL,
  PesFis_Login CHAR(15) NULL,
  PesFis_Senha VARCHAR(10) NULL,
  PesFis_Nome VARCHAR(100) NULL,
  PRIMARY KEY(PesFis_id),
  INDEX RentCar_PesFis_Pessoa(RentCar_Pessoa_Pes_id)
);

CREATE TABLE RentCar_PesJu (
  PesJu_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Pessoa_Pes_id INTEGER NOT NULL,
  PesJu_CNPJ VARCHAR(20) NULL,
  PesJu_NmFantasia VARCHAR(30) NULL,
  PesJu_RazaoSocial VARCHAR(20) NULL,
  PRIMARY KEY(PesJu_id),
  INDEX RentCar_PesJu_Pessoa(RentCar_Pessoa_Pes_id)
);

CREATE TABLE RentCar_Pessoa (
  Pes_id INTEGER NOT NULL AUTO_INCREMENT,
  RentCar_Enderecos_End_Id INTEGER NOT NULL,
  Pes_TelRes VARCHAR(15) NULL,
  Pes_Cel VARCHAR(15) NULL,
  Pes_TelOp VARCHAR(15) NULL,
  Pes_Email VARCHAR(30) NULL,
  PRIMARY KEY(Pes_id),
  INDEX RentCar_Pessoa_Endereco(RentCar_Enderecos_End_Id)
);

CREATE TABLE RentCar_Veiculo (
  Vel_id INTEGER NOT NULL AUTO_INCREMENT,
  Vel_Placa VARCHAR(8) NULL,
  Vel_Cor VARCHAR(10) NULL,
  Vel_Ano INTEGER(4) NULL,
  Vel_Espec VARCHAR(60) NULL,
  Vel_Modelo VARCHAR(10) NULL,
  Vel_Img BLOB NULL,
  Vel_Marca VARCHAR(20) NULL,
  Vel_StatusLoc CHAR(1) NULL,
  Vel_StatusRes CHAR(1) NULL,
  PRIMARY KEY(Vel_id)
);


