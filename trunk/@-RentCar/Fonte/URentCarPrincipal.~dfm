object frmRentCarPrincipal: TfrmRentCarPrincipal
  Left = 156
  Top = 119
  Width = 870
  Height = 500
  Caption = '@-RentCar - Gerenciamento de Locadora de Ve'#237'culos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MenuRentCar
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbRentCar: TStatusBar
    Left = 0
    Top = 427
    Width = 862
    Height = 19
    Panels = <
      item
        Text = '@-RentCar - Gerencimanto de Locadora de Ve'#237'culos'
        Width = 700
      end
      item
        Text = 'Hora'
        Width = 80
      end
      item
        Text = 'Data'
        Width = 50
      end>
  end
  object MenuRentCar: TMainMenu
    Left = 176
    Top = 32
    object Administrativo1: TMenuItem
      Caption = 'Administrativo'
      object Cadastros1: TMenuItem
        Caption = 'Cadastros'
        object Clientes: TMenuItem
          Caption = 'Clientes'
          object PesFisica: TMenuItem
            Caption = 'Fisica'
            OnClick = PesFisicaClick
          end
          object PesJuridica: TMenuItem
            Caption = 'Juridica'
            OnClick = PesJuridicaClick
          end
        end
        object Veiculos: TMenuItem
          Caption = 'Veiculos'
          OnClick = VeiculosClick
        end
      end
      object Relatorios: TMenuItem
        Caption = 'Relatorios'
        object RelVeiculos: TMenuItem
          Caption = 'Ve'#237'culos'
          object Alugados: TMenuItem
            Caption = 'Alugados'
            OnClick = AlugadosClick
          end
          object Disponveis: TMenuItem
            Caption = 'Dispon'#237'veis'
            OnClick = DisponveisClick
          end
          object Reservados: TMenuItem
            Caption = 'Reservados'
            OnClick = ReservadosClick
          end
        end
      end
    end
    object LocVeiculos: TMenuItem
      Caption = 'Veiculos'
      object Reserva: TMenuItem
        Caption = 'Reserva'
        object Fisica: TMenuItem
          Caption = 'Fisica'
          OnClick = FisicaClick
        end
        object Juridica: TMenuItem
          Caption = 'Juridica'
          OnClick = JuridicaClick
        end
      end
      object Locacao: TMenuItem
        Caption = 'Locacao'
        object LocPesFis: TMenuItem
          Caption = 'Fisica'
          OnClick = LocPesFisClick
        end
        object LocPesJu: TMenuItem
          Caption = 'Juridica'
          OnClick = LocPesJuClick
        end
      end
    end
    object Chamados: TMenuItem
      Caption = 'Chamados'
      object AberturaChamados: TMenuItem
        Caption = 'Abertura Chamados'
        OnClick = AberturaChamadosClick
      end
      object ChamadosEmEspera: TMenuItem
        Caption = 'Chamados em Espera'
      end
      object ChamadosFinalizados: TMenuItem
        Caption = 'Chamados Finalizados'
      end
    end
    object Configuracoes: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object Funcionarios1: TMenuItem
        Caption = 'Funcionarios'
        OnClick = Funcionarios1Click
      end
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      OnClick = SairClick
    end
  end
end
