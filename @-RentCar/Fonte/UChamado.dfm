object frmRentCarAberturaChamado: TfrmRentCarAberturaChamado
  Left = 287
  Top = 205
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = '@-RentCar - Abertura de Chamados'
  ClientHeight = 393
  ClientWidth = 475
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
  object gbCliente: TGroupBox
    Left = 4
    Top = 5
    Width = 333
    Height = 61
    Caption = 'Cliente'
    Enabled = False
    TabOrder = 0
    object lblNome: TLabel
      Left = 14
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object DBLookupCliente: TDBLookupComboBox
      Left = 14
      Top = 29
      Width = 309
      Height = 21
      DataField = 'RentCar_Pessoa_Pes_id'
      DataSource = dmRentCar.dsTChamado
      TabOrder = 0
      OnClick = DBLookupClienteClick
    end
  end
  object gbAberturaChamados: TGroupBox
    Left = 4
    Top = 67
    Width = 465
    Height = 287
    Caption = 'Abertura Chamados'
    Enabled = False
    TabOrder = 1
    object lblSolicitacao: TLabel
      Left = 9
      Top = 22
      Width = 52
      Height = 13
      Caption = 'Solicita'#231#227'o'
    end
    object lblData: TLabel
      Left = 184
      Top = 27
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lblDesc: TLabel
      Left = 9
      Top = 67
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblProtocol: TLabel
      Left = 208
      Top = 259
      Width = 55
      Height = 13
      Caption = 'Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTProtocol: TDBText
      Left = 272
      Top = 259
      Width = 81
      Height = 17
      DataField = 'Ch_Protocol'
      DataSource = dmRentCar.dsTChamado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTHora: TDBText
      Left = 312
      Top = 40
      Width = 65
      Height = 17
      DataField = 'Ch_HoraCh'
      DataSource = dmRentCar.dsTChamado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 312
      Top = 27
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object DataChamado: TDateTimePicker
      Left = 184
      Top = 39
      Width = 103
      Height = 21
      Date = 40134.684487303240000000
      Time = 40134.684487303240000000
      TabOrder = 0
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 249
      Width = 185
      Height = 33
      Caption = 'Status Chamado'
      Columns = 2
      DataField = 'Ch_Status'
      DataSource = dmRentCar.dsTChamado
      Items.Strings = (
        'Fechado'
        'Em Espera')
      TabOrder = 1
      Values.Strings = (
        'F'
        'E')
    end
    object DBCBSolic: TDBComboBox
      Left = 9
      Top = 39
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'Ch_TipoCh'
      DataSource = dmRentCar.dsTChamado
      ItemHeight = 13
      Items.Strings = (
        'Loca'#231#227'o de Ve'#237'culos'
        'Reserva de Veiculos'
        'Reclama'#231#227'o'
        'Duvida')
      TabOrder = 2
    end
    object DBMDesc: TDBMemo
      Left = 8
      Top = 80
      Width = 449
      Height = 166
      DataField = 'Ch_DescCh'
      DataSource = dmRentCar.dsTChamado
      TabOrder = 3
    end
  end
  object btnCadastrar: TBitBtn
    Left = 46
    Top = 360
    Width = 76
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastrarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECA8A8A8737373553F2A553F2A553F2A553F2A553F2A553F2A553F
      2A553F2A553F2AA7A7A7D8E9ECD8E9ECD8E9ECD8E9EC929292AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FF553F2AD8E9ECD8E9EC
      D8E9ECD8E9EC919191AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFF
      FF99F8FFAAFFFF553F2AD8E9ECD8E9ECD8E9ECD8E9EC919191AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FF553F2AD8E9ECD8E9EC
      D8E9ECD8E9EC909090AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFF
      FF99F8FFAAFFFF767676D8E9ECD8E9ECD8E9ECD8E9EC919191AAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FFAAFFFF99F8FF808080D8E9ECD8E9EC
      D8E9ECD8E9EC91919198F7FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFF
      FF99F8FFAAFFFF8D8D8DD8E9ECD8E9ECD8E9ECD8E9ECC1C1C1C1C1C198F7FFAA
      FFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FF9B9B9BD8E9ECD8E9EC
      EFAD00A377007F5B00EFAD00C1C1C198F7FF98F7FF98F7FF98F7FF98F7FF98F7
      FF98F7FF98F7FFA7A7A7D8E9ECD8E9EC7F5B00D9A77DD9A77D7F5B00C1C1C1C1
      C1C198F7FF98F7FF98F7FF98F7FF55DFFF55DFFF54BFD3737373EFAD00A27600
      A27600D9A77DD9A77DA377007F5B00EFAD00C1C1C198F7FF98F7FFB4B4B4A0A0
      A0737373737373B4B4B4AA7F00F6CF6DD9A77DD9A77DD9A77DD9A77DFF9F2A7F
      5B00C1C1C198F7FF98F7FFA1A1A1E6E6E6DADADADADADAB4B4B4AA7F00FFFFCB
      FFFFCBF6CF6DD9A77DF6CF6DF6CF6DA37700C1C1C198F7FF98F7FFA7A7A7AAFF
      FFE7E7E7B4B4B4D8E9ECF7D06CE5B726E2B629FFFF66F6CF6DAA7F00AA7F00F7
      CF6CD8E9ECAAFFFFE6E6E68D8D8DD8E9ECB4B4B4D8E9ECD8E9ECD8E9ECD8E9EC
      F1BF2BFFFF99FFFF99AA7F00B4B4B4CDCDCDC1C1C1B4B4B48D8D8D8D8D8DC1C1
      C1D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECF8D06DFFC82DFDC831F7CF6CD8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
  end
  object btnSalvar: TBitBtn
    Left = 134
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
    Glyph.Data = {
      06030000424D06030000000000003600000028000000100000000F0000000100
      180000000000D0020000120B0000120B00000000000000000000D8E9ECD8E9EC
      A7A7A77373737373735959595959594B4B4B4B4B4B3D3D3D3030303030303030
      30A7A7A7D8E9ECD8E9ECD8E9ECA7A7A7633600CDCDCDE6E6E6C1C1C1C1C1C1CD
      CDCDF0F0F0EDEDEDE6E6E6A7A7A7333333303030A7A7A7D8E9EC633600633600
      633600DADADAE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6DADADACB8C
      44633600303030303030633600CB8C44633600D9A77DD9A77DD9A77DD9A77DD9
      A77DCB8C44CB8C44CB8C44CB8C44CB8C446336007F5B00303030633600D9A77D
      633600D9A77DD9A77DD9A77DD9A77DD9A77DD9A77DCB8C44CB8C44CB8C44CB8C
      44633600CB8C44303030633600D9A77D633600D9A77DD9A77DD9A77DD9A77DD9
      A77DD9A77DD9A77DCB8C44CB8C44CB8C44633600CB8C443D3D3D633600D9A77D
      633600AA3F2A633600633600633600633600633600633600633600633600CB8C
      44633600CB8C444B4B4B633600D9A77D6336009A9A9AAAFFFF99F8FF99F8FF99
      F8FF99F8FF99F8FF99F8FF99F8FF633600633600CB8C444B4B4B633600D9A77D
      633600AAFFFFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FF633600CB8C444B4B4B633600D9A77D7F5B00AAFFFFAAFFFFAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FF7F5B00CB8C444B4B4B633600D9A77D
      7F5B00AAFFFFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FF7F5B00CB8C444B4B4B633600D9A77D989898AAFFFFAAFFFFAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FF989898CB8C44595959633600D9A77D
      A6A6A6D8E9ECCDCDCDCB8C44CB8C44A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8
      FFA6A6A6D9A77D666666A7A7A76336007F5B00D8E9ECD8E9ECAAFFFFAAFFFFAA
      FFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF7F5B00633600A7A7A7D8E9ECD8E9EC
      A7A7A76336006336006336006336006336006336006336006336006336006336
      009A9A9AD8E9ECD8E9EC}
  end
  object btnCancelar: TBitBtn
    Left = 222
    Top = 360
    Width = 73
    Height = 25
    Hint = 'Cancelar altera'#231#227'o do registro'
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8808080B80000F800F8F800F8F800F8F800F8F800F8
      B80000B80000B80000B80000B80000F800F8F800F8F800F8F800F8F800F8B800
      00808080F800F8F800F8F800F8F800F8B80000B80000B80000B80000F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8B80000F800F8F800F8F800F8F800F8
      B80000B80000B80000F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8B80000F800F8F800F8F800F8F800F8B80000B80000F800F8B80000F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8B80000F800F8F800F8F800F8F800F8
      B80000F800F8F800F8F800F8B80000B80000F800F8F800F8F800F8F800F8B800
      00808080F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8B80000B80000B80000B80000808080F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8
      F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800
      F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F8
      00F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8F800F8}
  end
  object BitBtn4: TBitBtn
    Left = 310
    Top = 360
    Width = 70
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = BitBtn4Click
    Glyph.Data = {
      EE030000424DEE03000000000000360000002800000012000000110000000100
      180000000000B8030000120B0000120B00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9EC8484848484848484848484
      84848484848484848484848484848484848484D8E9ECC6C6C6848484C6C6C6D8
      E9ECC6C6C6D8E9EC0000D8E9EC84848484848484848484848484848484848484
      8484848484848484848484848484FFFFFF848484FFFFFF848484FFFFFFD8E9EC
      0000D8E9ECA376007F5B007F5B007F5B004B4B4B4B4B4B848484848484848484
      FFFFFFFFFFFFFFFFFF7F5B007F5B007F5B00A37600D8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9EC7F5B00A37600A376004B4B4B4B4B4B848484FFFFFFFFFFFFFFFF
      FF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B
      00A37600A37600A376004B4B4BFFFFFFFFFFFFFFFFFFFFFFFF7F5B00D8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A3
      76004B4B4BFFFFFFFFFFFFFFFFFFFFFFFF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A376004B4B4BFFFFDF
      FFFF80F7EF70FFFF007F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9EC7F5B00A37600A37600A376004B4B4BFFFF80FFFF80FFFF80FFFF
      807F5B00D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B
      00A37600A37600A376004B4B4BFFFF80FFFF80FFFF80FFFF807F5B00D8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9EC7F5B00A37600A37600A3
      76004B4B4BFFFF00FFFF80FFFF80FFFFDF7F5B00D8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9ECA376007F5B007F5B007F5B007F5B007F5B00
      7F5B007F5B007F5B00A37600D8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9EC6F6F6F4B4B4B4B4B4B4B4B4B4B4B4B6F6F6FD8E9ECD8E9ECD8E9ECD8
      E9ECD8E9ECD8E9EC0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC4B4B4B00
      DF0000DF0000DF0000DF004B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC6F6F6F4B4B4B4B4B4B4B4B4B
      4B4B4B6F6F6FD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0000}
  end
  object SSLSocket: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 416
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 465
    AuthenticationType = atNone
    Left = 384
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
