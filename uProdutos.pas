unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmProdutos = class(TForm)
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    LblProduto: TLabel;
    EdtProduto: TEdit;
    LblCusto: TLabel;
    EdtCusto: TEdit;
    LblVenda: TLabel;
    EdtVenda: TEdit;
    LblEstoque: TLabel;
    EdtEstoque: TEdit;
    MemoAviso: TMemo;
    BtnSalvar: TButton;
    BtnEditar: TButton;
    BtnApagar: TButton;
    BtnLimpar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

{$R *.dfm}

end.
