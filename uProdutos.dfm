object FrmProdutos: TFrmProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 264
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 17
  object LblCodigo: TLabel
    Left = 40
    Top = 64
    Width = 46
    Height = 17
    Caption = 'C'#243'digo:'
  end
  object LblProduto: TLabel
    Left = 36
    Top = 112
    Width = 50
    Height = 17
    Caption = 'Produto:'
  end
  object LblCusto: TLabel
    Left = 6
    Top = 160
    Width = 92
    Height = 17
    Caption = 'Pre'#231'o de Custo:'
  end
  object LblVenda: TLabel
    Left = 272
    Top = 64
    Width = 95
    Height = 17
    Caption = 'Pre'#231'o de Venda:'
  end
  object LblEstoque: TLabel
    Left = 317
    Top = 112
    Width = 50
    Height = 17
    Caption = 'Estoque:'
  end
  object EdtCodigo: TEdit
    Left = 104
    Top = 61
    Width = 121
    Height = 25
    TabOrder = 0
  end
  object EdtProduto: TEdit
    Left = 104
    Top = 109
    Width = 121
    Height = 25
    TabOrder = 1
  end
  object EdtCusto: TEdit
    Left = 104
    Top = 157
    Width = 121
    Height = 25
    TabOrder = 2
  end
  object EdtVenda: TEdit
    Left = 384
    Top = 61
    Width = 121
    Height = 25
    TabOrder = 3
  end
  object EdtEstoque: TEdit
    Left = 384
    Top = 109
    Width = 121
    Height = 25
    TabOrder = 4
  end
  object MemoAviso: TMemo
    Left = 349
    Top = 159
    Width = 156
    Height = 66
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    Lines.Strings = (
      'Somente salve ap'#243's validar '
      'internamente todas as '
      'informa'#231#245'es preenchidas '
      'referentes ao produto.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object BtnSalvar: TButton
    Left = 656
    Top = 93
    Width = 89
    Height = 41
    Caption = 'Salvar'
    TabOrder = 6
  end
  object BtnEditar: TButton
    Left = 776
    Top = 93
    Width = 89
    Height = 41
    Caption = 'Editar'
    TabOrder = 7
  end
  object BtnApagar: TButton
    Left = 896
    Top = 93
    Width = 89
    Height = 41
    Caption = 'Apagar'
    TabOrder = 8
  end
  object BtnLimpar: TButton
    Left = 543
    Top = 93
    Width = 89
    Height = 41
    Caption = 'Limpar'
    TabOrder = 9
  end
end
