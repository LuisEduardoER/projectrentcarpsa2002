object frmCapImage: TfrmCapImage
  Left = 355
  Top = 163
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = '@-RentCar'
  ClientHeight = 210
  ClientWidth = 406
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
  object GroupBox1: TGroupBox
    Left = 3
    Top = 6
    Width = 136
    Height = 28
    TabOrder = 0
    object CheckPrev: TCheckBox
      Left = 4
      Top = 9
      Width = 67
      Height = 16
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = CheckPrevClick
    end
  end
  object BtSPict: TButton
    Left = 2
    Top = 39
    Width = 138
    Height = 25
    Caption = 'Salvar Imagem'
    TabOrder = 1
    OnClick = BtSPictClick
  end
  object PnlImagem: TPanel
    Left = 145
    Top = 5
    Width = 258
    Height = 201
    BevelInner = bvLowered
    BevelWidth = 2
    Caption = 'PnlImagem'
    Color = clSilver
    TabOrder = 2
    object VCImagem: TVideoCap
      Left = 4
      Top = 4
      Width = 249
      Height = 192
      align = alCustom
      color = clSilver
      DriverOpen = False
      DriverIndex = 0
      DriverName = 'Microsoft WDM Image Capture (Win32)'
      VideoOverlay = False
      VideoPreview = False
      PreviewScaleToWindow = True
      PreviewScaleProportional = True
      PreviewRate = 30
      MicroSecPerFrame = 33333
      FrameRate = 30
      CapAudio = False
      VideoFileName = 'Video.avi'
      SingleImageFile = 'C:\Foto.jpg'
      CapTimeLimit = 0
      CapIndexSize = 0
      CapToFile = True
      CapAudioFormat.Channels = Stereo
      CapAudioFormat.Resolution = r16Bit
      BufferFileSize = 0
    end
  end
end
