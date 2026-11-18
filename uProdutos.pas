unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmProdutos = class(TForm)
    LblCodigoBarras: TLabel;
    EdtCodigoBarras: TEdit;
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
    btnConsultarProd: TButton;
    EdtUnidade: TEdit;
    LblUnidade: TLabel;
    DBGridProdutos: TDBGrid;
    procedure btnConsultarProdClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos; // encapsulamento
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;
  Formato : TFormatSettings;  //  Instância da classe FromatSettings para formatar numero com vírgula nas caixas Edt

implementation

uses
  uDM;

{$R *.dfm}

procedure TFrmProdutos.LimpaCampos(); // Acessando diretamente dentro do form Produtos
  begin
      EdtCodigoBarras.Text := '';
      EdtProduto.Text := '';
      EdtCusto.Text := '';
      EdtVenda.Text := '';
      EdtEstoque.Text := '';
      EdtUnidade.Text := '';
end;

procedure TFrmProdutos.btnConsultarProdClick(Sender: TObject);

begin
    DM.qryProdutos.Close;  // finaliza qualquer query previamente
    DM.qryProdutos.SQL.Text := 'SELECT * FROM PRODUTOS order by ID_PRODUTO';  // query completa, se fosse alguma adição pontual seria add
    DM.qryProdutos.Open;  // retorna para o Delphi o resultado da query

    showmessage('Total de produtos: ' + DM.qRyProdutos.RecordCount.ToString); // Converte a contagem de linhas retornadas em string pra concatenar
    DBGridProdutos.Show; // apresentando grid ao consultar

end;


procedure TFrmProdutos.BtnLimparClick(Sender: TObject);
begin
      // limpar Edt´s
      LimpaCampos;
end;

procedure TFrmProdutos.BtnSalvarClick(Sender: TObject);
begin
    try
    DM.qryProdutos.Close;  // garantir que começa uma nova query abaixo
    DM.qryProdutos.SQL.Clear; // limpa a query utilizada;
    DM.qryProdutos.SQL.Add('insert into produtos ' +
    '(descricao, codigo_barras, unidade, quantidade, preco_custo, preco_venda)' +
    'values ' +
    '(:descricao, :codigo_barras,:unidade,:quantidade, :preco_custo, :preco_venda)'  // valores possuem : na frente
    );

        begin
        Formato := TFormatSettings.Create;
        Formato.DecimalSeparator := ','; // formatação
      end;

    // receber dados digitados no Edt e informar para o Delphi qual é parâmetro :nome correspondente
    DM.qryProdutos.ParamByName('descricao').AsString := EdtProduto.Text;
    DM.qryProdutos.ParamByName('codigo_barras').AsString := EdtCodigoBarras.Text;
    DM.qryProdutos.ParamByName('unidade').AsString := EdtUnidade.Text;
    DM.qryProdutos.ParamByName('quantidade').AsFloat := StrToFloat(EdtEstoque.Text); // conversão necessária pois o parâmetro é double/float Edt é text str
    DM.qryProdutos.ParamByName('preco_custo').AsFloat := StrToFloat(edtCusto.Text,Formato);
    DM.qryProdutos.ParamByName('preco_venda').AsFloat := StrToFloat(edtVenda.Text,Formato);

    DM.qryProdutos.ExecSQL; // executando comando SQL acima
    showmessage('Produto cadastrado com sucesso!!');
    LimpaCampos;
    except
      on E: Exception do
        showmessage('Não foi possível cadastrar o produto ' + 'Verifique se os valores informados estão corretos...');
    end;
end;

end.
