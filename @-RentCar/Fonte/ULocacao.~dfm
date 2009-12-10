object frmLocacao: TfrmLocacao
  Left = 345
  Top = 209
  Width = 487
  Height = 366
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
    Left = 12
    Top = 293
    Width = 77
    Height = 31
    Caption = 'Cadastrar'
    TabOrder = 0
    OnClick = btnCadastarClick
  end
  object btnAlterar: TButton
    Left = 186
    Top = 293
    Width = 77
    Height = 29
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object btnSair: TButton
    Left = 387
    Top = 293
    Width = 75
    Height = 29
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object btnConsultarLoc: TButton
    Left = 276
    Top = 293
    Width = 101
    Height = 29
    Caption = 'Consultar Loca'#231#245'es'
    TabOrder = 3
    OnClick = btnConsultarLocClick
  end
  object btnSalvar: TButton
    Left = 98
    Top = 294
    Width = 78
    Height = 28
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object pgGerLovResDev: TPageControl
    Left = 9
    Top = 8
    Width = 465
    Height = 278
    ActivePage = tsLocacao
    TabOrder = 5
    object tsLocacao: TTabSheet
      Caption = 'Loca'#231#227'o'
      OnShow = tsLocacaoShow
      object gbLocacao: TGroupBox
        Left = 3
        Top = 8
        Width = 449
        Height = 226
        Enabled = False
        TabOrder = 0
        object lblTipoPg: TLabel
          Left = 6
          Top = 178
          Width = 78
          Height = 13
          Caption = 'Tipo Pagamento'
        end
        object lblVlrPagar: TLabel
          Left = 6
          Top = 142
          Width = 65
          Height = 13
          Caption = 'Valor A Pagar'
        end
        object lblVeiculo: TLabel
          Left = 6
          Top = 59
          Width = 37
          Height = 13
          Caption = 'Ve'#237'culo'
        end
        object Label1: TLabel
          Left = 280
          Top = 133
          Width = 62
          Height = 13
          Caption = 'Valor Aluguel'
        end
        object DBTAluguel: TDBText
          Left = 352
          Top = 133
          Width = 65
          Height = 17
          DataField = 'GerVal_ValAlu'
          DataSource = dmRentCar.dsTGerVal
        end
        object DBTVlrAPag: TDBText
          Left = 7
          Top = 155
          Width = 65
          Height = 17
          DataField = 'GerVal_ValAPag'
          DataSource = dmRentCar.dsTGerVal
        end
        object lblPerLoc: TLabel
          Left = 6
          Top = 100
          Width = 83
          Height = 13
          Caption = 'Per'#237'odo Loca'#231#227'o'
        end
        object Label3: TLabel
          Left = 94
          Top = 115
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object lblCliente: TLabel
          Left = 5
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Cliente'
        end
        object DBCBTpPg: TDBComboBox
          Left = 6
          Top = 192
          Width = 89
          Height = 21
          Style = csDropDownList
          DataField = 'GerVal_TipoPag'
          DataSource = dmRentCar.dsTGerVal
          ItemHeight = 13
          Items.Strings = (
            'Dinheiro'
            'Cheque')
          TabOrder = 0
        end
        object DBLookupCBVeiculo: TDBLookupComboBox
          Left = 6
          Top = 73
          Width = 241
          Height = 21
          DataField = 'RentCar_Veiculo_Vel_id'
          DataSource = dmRentCar.dsTAlugar
          KeyField = 'Vel_id'
          ListField = 'Vel_Espec'
          ListSource = dmRentCar.dsCadVeiculo
          TabOrder = 1
          OnClick = DBLookupCBVeiculoClick
        end
        object DBImgVeiculo: TDBImage
          Left = 304
          Top = 21
          Width = 105
          Height = 105
          DataField = 'Vel_Img'
          DataSource = dmRentCar.dsCadVeiculo
          TabOrder = 2
        end
        object DateLocI: TDateTimePicker
          Left = 6
          Top = 113
          Width = 86
          Height = 21
          Date = 40150.949875393520000000
          Time = 40150.949875393520000000
          TabOrder = 3
        end
        object DateLocF: TDateTimePicker
          Left = 106
          Top = 112
          Width = 86
          Height = 21
          Date = 40150.949875393520000000
          Time = 40150.949875393520000000
          TabOrder = 4
        end
        object DBLookupCliente: TDBLookupComboBox
          Left = 7
          Top = 24
          Width = 246
          Height = 21
          DataField = 'RentCar_Pessoa_Pes_id'
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 5
          OnClick = DBLookupClienteClick
        end
        object DBGrid1: TDBGrid
          Left = 224
          Top = 112
          Width = 320
          Height = 120
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object tsReserva: TTabSheet
      Caption = 'Reserva'
      ImageIndex = 1
      OnShow = tsReservaShow
      object gbReserva: TGroupBox
        Left = 3
        Top = 8
        Width = 449
        Height = 161
        Enabled = False
        TabOrder = 0
        object Label5: TLabel
          Left = 5
          Top = 63
          Width = 37
          Height = 13
          Caption = 'Ve'#237'culo'
        end
        object Label6: TLabel
          Left = 288
          Top = 141
          Width = 62
          Height = 13
          Caption = 'Valor Aluguel'
        end
        object DBTVlr: TDBText
          Left = 368
          Top = 141
          Width = 65
          Height = 17
          DataField = 'GerVal_ValAlu'
          DataSource = dmRentCar.dsTGerVal
        end
        object Label4: TLabel
          Left = 6
          Top = 108
          Width = 66
          Height = 13
          Caption = 'Data Reserva'
        end
        object Label2: TLabel
          Left = 5
          Top = 17
          Width = 32
          Height = 13
          Caption = 'Cliente'
        end
        object DBLCBV: TDBLookupComboBox
          Left = 5
          Top = 77
          Width = 241
          Height = 21
          DataField = 'RentCar_Veiculo_Vel_id'
          DataSource = dmRentCar.dsTAlugar
          KeyField = 'Vel_id'
          ListField = 'Vel_Espec'
          ListSource = dmRentCar.dsCadVeiculo
          TabOrder = 0
          OnClick = DBLCBVClick
        end
        object DBImgV: TDBImage
          Left = 304
          Top = 25
          Width = 105
          Height = 105
          DataField = 'Vel_Img'
          DataSource = dmRentCar.dsCadVeiculo
          TabOrder = 1
        end
        object DateReserva: TDateTimePicker
          Left = 6
          Top = 123
          Width = 89
          Height = 21
          Date = 40150.949875393520000000
          Time = 40150.949875393520000000
          TabOrder = 2
        end
        object DBLookupClienteRes: TDBLookupComboBox
          Left = 5
          Top = 33
          Width = 246
          Height = 21
          DataField = 'RentCar_Pessoa_Pes_id'
          DataSource = dmRentCar.dsTAlugar
          TabOrder = 3
          OnClick = DBLookupClienteClick
        end
      end
    end
    object tsDevolucao: TTabSheet
      Caption = 'Devolucao'
      ImageIndex = 2
      OnShow = tsDevolucaoShow
      object gbDev: TGroupBox
        Left = 3
        Top = 36
        Width = 449
        Height = 151
        TabOrder = 0
        object Label9: TLabel
          Left = 6
          Top = 14
          Width = 37
          Height = 13
          Caption = 'Ve'#237'culo'
        end
        object Label10: TLabel
          Left = 288
          Top = 128
          Width = 62
          Height = 13
          Caption = 'Valor Aluguel'
        end
        object DBTVlrDev: TDBText
          Left = 368
          Top = 128
          Width = 65
          Height = 17
          DataField = 'GerVal_ValAlu'
          DataSource = dmRentCar.dsTGerVal
        end
        object DBLookupVecDev: TDBLookupComboBox
          Left = 6
          Top = 28
          Width = 241
          Height = 21
          DataField = 'RentCar_Veiculo_Vel_id'
          DataSource = dmRentCar.dsTAlugar
          KeyField = 'Vel_id'
          ListField = 'Vel_Espec'
          ListSource = dmRentCar.dsCadVeiculo
          TabOrder = 0
          OnClick = DBLookupVecDevClick
        end
        object DBImgDev: TDBImage
          Left = 304
          Top = 16
          Width = 105
          Height = 105
          DataField = 'Vel_Img'
          DataSource = dmRentCar.dsCadVeiculo
          TabOrder = 1
        end
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
