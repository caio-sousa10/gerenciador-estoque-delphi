unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmPrincipal = class(TForm) // criação de classe do formulário principal herdada da classe Tform
    PnlMenu: TPanel;
    caption: TPanel;
    SpdBtnProdutos: TSpeedButton;
    SpdBtnMovimentacoes: TSpeedButton;
    SpdBtnRelatorios: TSpeedButton;
    LblTitulo: TLabel;
    LblGerenciamentoEstoque: TLabel;
    LblBemVindo: TLabel;
    PnlRodaPe: TPanel;
    LblVersao: TLabel;
    procedure SpdBtnProdutosClick(Sender: TObject);
    procedure SpdBtnMovimentacoesClick(Sender: TObject);
    procedure SpdBtnRelatoriosClick(Sender: TObject);
  private
    { Private declarations } // encapsulamento
    procedure AtualizarMenu(Abotao:TSpeedButton); // procedure para atualizar o menu - espera um parâmetro do tipo speedbutton

  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
  uses
    uProdutos; // informando ao Delphi que o Form Principal irá utilizar/reconhecer o Form Produtos

  procedure TFrmPrincipal.AtualizarMenu(Abotao: TSpeedButton);  // chamando procedure dentro da classe do form principal
  begin
    SpdBtnProdutos.Font.Color:=clSilver;
    SpdBtnMovimentacoes.Font.Color:=clSilver; // modificando propriedades de cor
    SpdBtnRelatorios.Font.Color:=clSilver;

    SpdBtnProdutos.Font.Style:=[];
    SpdBtnMovimentacoes.Font.Style:=[];
    SpdBtnRelatorios.Font.Style:=[];

    Abotao.Font.Color:=clWhite;
    Abotao.Font.Style:=[FsBold];
  end;
{$R *.dfm}

procedure TFrmPrincipal.SpdBtnMovimentacoesClick(Sender: TObject);
begin
    AtualizarMenu(SpdBtnMovimentacoes);
end;

procedure TFrmPrincipal.SpdBtnProdutosClick(Sender: TObject);
begin
     AtualizarMenu(SpdBtnProdutos);
     Application.CreateForm(TFrmProdutos, frmProdutos); // cria form frmProdutos da classe TFrmProdutos
     try
       frmProdutos.ShowModal;  // tratamento de exceção para exibir o form. Caso contrário, libera da memoria e zera a referência/apontamento
     finally
       FreeAndNil(frmProdutos);
     end;
end;

procedure TFrmPrincipal.SpdBtnRelatoriosClick(Sender: TObject);
begin
    AtualizarMenu(SpdBtnRelatorios);
end;

end.
