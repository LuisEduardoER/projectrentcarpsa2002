object frmLocacao: TfrmLocacao
  Left = 276
  Top = 212
  Width = 488
  Height = 376
  Caption = '@-RentCar - Gerenciamento Loca'#231#227'o/Reserva Ve'#237'culos'
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
  object btnCadastar: TButton
    Left = 16
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 0
    OnClick = btnCadastarClick
  end
  object btnAlterar: TButton
    Left = 190
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object btnSair: TButton
    Left = 391
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object btnConsultarLoc: TButton
    Left = 280
    Top = 310
    Width = 101
    Height = 24
    Caption = 'Consultar Loca'#231#245'es'
    TabOrder = 3
  end
  object btnSalvar: TButton
    Left = 102
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 16
    Width = 465
    Height = 289
    ActivePage = tsLocacao
    TabOrder = 5
    object tsLocacao: TTabSheet
      Caption = 'Loca'#231#227'o'
      object lblCliente: TLabel
        Left = 5
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object btnBuscar: TButton
        Left = 260
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object gbLocacao: TGroupBox
        Left = 3
        Top = 52
        Width = 449
        Height = 201
        TabOrder = 1
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
          Width = 65
          Height = 13
          Caption = 'Valor A Pagar'
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
        object DBCKAlu: TDBCheckBox
          Left = 8
          Top = 168
          Width = 73
          Height = 17
          Caption = 'Alugado'
          DataField = 'Alu_Loc'
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 0
          ValueChecked = 'AL'
          ValueUnchecked = 'NAL'
        end
        object DBCBTpPg: TDBComboBox
          Left = 8
          Top = 130
          Width = 89
          Height = 21
          Style = csDropDownList
          DataField = 'GerVal_TipoPag'
          DataSource = dmRentCar.dsTGerVal
          ItemHeight = 13
          Items.Strings = (
            'Dinheiro'
            'Cheque')
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
          DataSource = dmRentCar.dsTAlugar
          KeyField = 'Vel_id'
          ListField = 'Vel_Marca'
          ListSource = dmRentCar.dsCadVeiculo
          TabOrder = 3
          OnClick = DBLookupCBVeiculoClick
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
      object edtCliLoc: TEdit
        Left = 5
        Top = 22
        Width = 240
        Height = 21
        TabOrder = 2
      end
    end
    object tsReserva: TTabSheet
      Caption = 'Reserva'
      ImageIndex = 1
      object Label2: TLabel
        Left = 5
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object btnB: TButton
        Left = 260
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 63
        Width = 449
        Height = 155
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 22
          Width = 37
          Height = 13
          Caption = 'Ve'#237'culo'
        end
        object Label6: TLabel
          Left = 288
          Top = 132
          Width = 62
          Height = 13
          Caption = 'Valor Aluguel'
        end
        object DBTVlr: TDBText
          Left = 368
          Top = 132
          Width = 65
          Height = 17
          DataField = 'GerVal_ValAlu'
          DataSource = dmRentCar.dsTGerVal
        end
        object DBCBR: TDBCheckBox
          Left = 8
          Top = 72
          Width = 73
          Height = 17
          Caption = 'Reservado'
          DataField = 'Alu_Reserva'
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 0
          ValueChecked = 'R'
          ValueUnchecked = 'NR'
        end
        object DBLCBV: TDBLookupComboBox
          Left = 8
          Top = 36
          Width = 241
          Height = 21
          DataField = 'RentCar_Veiculo_Vel_id'
          DataSource = dmRentCar.dsTAlugar
          KeyField = 'Vel_id'
          ListField = 'Vel_Marca'
          ListSource = dmRentCar.dsCadVeiculo
          TabOrder = 1
          OnClick = DBLCBVClick
        end
        object DBImgV: TDBImage
          Left = 304
          Top = 16
          Width = 105
          Height = 105
          DataField = 'Vel_Img'
          DataSource = dmRentCar.dsCadVeiculo
          TabOrder = 2
        end
      end
      object edtCliRes: TEdit
        Left = 4
        Top = 24
        Width = 234
        Height = 21
        TabOrder = 2
      end
    end
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 384
  end
  object SSLSocket: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 416
  end
  object MSG: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 448
  end
end
