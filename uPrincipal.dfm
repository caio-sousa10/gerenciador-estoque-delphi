object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerenciador de Estoque'
  ClientHeight = 264
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object PnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 210
    Height = 264
    Align = alLeft
    BevelOuter = bvNone
    Color = clDarkblue
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -1
    object SpdBtnProdutos: TSpeedButton
      Left = 58
      Top = 72
      Width = 97
      Height = 22
      Cursor = crHandPoint
      GroupIndex = 1
      Caption = 'Produtos'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpdBtnProdutosClick
    end
    object SpdBtnMovimentacoes: TSpeedButton
      Left = 49
      Top = 116
      Width = 121
      Height = 22
      Cursor = crHandPoint
      GroupIndex = 1
      Caption = 'Movimenta'#231#245'es'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpdBtnMovimentacoesClick
    end
    object SpdBtnRelatorios: TSpeedButton
      Left = 58
      Top = 168
      Width = 97
      Height = 22
      Cursor = crHandPoint
      GroupIndex = 1
      Caption = 'Relat'#243'rios'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpdBtnRelatoriosClick
    end
    object LblTitulo: TLabel
      Left = 22
      Top = 9
      Width = 63
      Height = 30
      Caption = 'MENU'
      Color = clMidnightblue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSnow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object PnlRodaPe: TPanel
      Left = 0
      Top = 236
      Width = 210
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 248
      object LblVersao: TLabel
        Left = 22
        Top = 9
        Width = 88
        Height = 13
        Alignment = taCenter
        Caption = 'Vers'#227'o 26.11.13.2'
        Color = clMidnightblue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object caption: TPanel
    Left = 210
    Top = 0
    Width = 790
    Height = 264
    Align = alClient
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    object LblGerenciamentoEstoque: TLabel
      Left = 322
      Top = 121
      Width = 158
      Height = 17
      Alignment = taCenter
      Caption = 'Gerenciamento de Estoque'
      Color = clMidnightblue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LblBemVindo: TLabel
      Left = 349
      Top = 73
      Width = 104
      Height = 25
      Alignment = taCenter
      Caption = 'Bem-vindo!'
      Color = clMidnightblue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
end
