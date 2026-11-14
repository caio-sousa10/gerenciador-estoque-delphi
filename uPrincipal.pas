unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmPrincipal = class(TForm) // classe do formulário principal
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
      var
        FormProdutos:TfrmProdutos; // declarando variável do tipo TfrmPRodutos para armazenar suas propriedades posteriormente
      begin
        FormProdutos := TfrmProdutos.Create(Self); // variável vira criação de uma instância da classe TfrmProdutos
        try
          FormProdutos.ShowModal;  // shoemodal é um método herdado da classe TfrmProdutos que permite que o form aberto
                                  //inutilze o principal, diferente do show apenas
        finally   // garante que o free abaixo seja executado mesmo caso haja erro
          FormProdutos.Free; // libera da memória
        end;
      end;
end;

procedure TFrmPrincipal.SpdBtnRelatoriosClick(Sender: TObject);
begin
    AtualizarMenu(SpdBtnRelatorios);
end;

end.
