object frmLocacao: TfrmLocacao
  Left = 276
  Top = 212
  Width = 493
  Height = 351
  Caption = 'Loca'#231#227'o Ve'#237'culos - Locacao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCliente: TLabel
    Left = 21
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object edtCliente: TEdit
    Left = 21
    Top = 32
    Width = 345
    Height = 21
    TabOrder = 0
    Text = 'edtCliente'
    OnChange = edtClienteChange
  end
  object btnCadastar: TButton
    Left = 24
    Top = 278
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnCadastarClick
  end
  object btnAlterar: TButton
    Left = 198
    Top = 278
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnSair: TButton
    Left = 399
    Top = 278
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
  object btnConsultarLoc: TButton
    Left = 288
    Top = 278
    Width = 101
    Height = 24
    Caption = 'Consultar Loca'#231#245'es'
    TabOrder = 4
  end
  object gbLocacao: TGroupBox
    Left = 16
    Top = 64
    Width = 449
    Height = 201
    Caption = 'Loca'#231#227'o'
    TabOrder = 5
    object lblTipoPg: TLabel
      Left = 8
      Top = 116
      Width = 78
      Height = 13
      Caption = 'Tipo Pagamento'
    end
    object lblVlrPagar: TLabel
      Left = 8
      Top = 70
      Width = 37
      Height = 13
      Caption = 'Ve'#237'culo'
    end
    object lblVeiculo: TLabel
      Left = 8
      Top = 22
      Width = 37
      Height = 13
      Caption = 'Ve'#237'culo'
    end
    object Label1: TLabel
      Left = 288
      Top = 153
      Width = 62
      Height = 13
      Caption = 'Valor Aluguel'
    end
    object DBTAluguel: TDBText
      Left = 368
      Top = 153
      Width = 65
      Height = 17
      DataField = 'GerVal_ValAlu'
      DataSource = dmRentCar.dsTGerVal
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 168
      Width = 73
      Height = 17
      Caption = 'Alugado'
      DataField = 'Alu_Reserva'
      DataSource = dmRentCar.dsTAlugar
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCBTpPg: TDBComboBox
      Left = 8
      Top = 130
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'GerVal_TipoPag'
      DataSource = dmRentCar.dsTGerVal
      ItemHeight = 13
      TabOrder = 1
    end
    object DBEVlrAPagar: TDBEdit
      Left = 8
      Top = 84
      Width = 121
      Height = 21
      DataField = 'GerVal_ValAPag'
      DataSource = dmRentCar.dsTGerVal
      TabOrder = 2
    end
    object DBLookupCBVeiculo: TDBLookupComboBox
      Left = 8
      Top = 36
      Width = 241
      Height = 21
      DataField = 'RentCar_Veiculo_Vel_id'
      KeyField = 'Vel_id'
      ListField = 'Vel_Espec'
      ListSource = dmRentCar.dsCadVeiculo
      TabOrder = 3
    end
    object DBImgVeiculo: TDBImage
      Left = 304
      Top = 16
      Width = 105
      Height = 105
      DataField = 'Vel_Img'
      DataSource = dmRentCar.dsCadVeiculo
      TabOrder = 4
    end
  end
  object btnSalvar: TButton
    Left = 110
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btnSalvarClick
  end
end
