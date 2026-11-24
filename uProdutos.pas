unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmProdutos = class(TForm) // classe TFrmProdutos criada herda da classe TForm
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
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnConsultarProdClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    FEditando: Boolean; // variável que indica se o formulário está em modo de edição, evitando que o botão Salvar execute um INSERT ao invés de um UPDATE.
    FNulo : Boolean;
    // encapsulamento e declarações de procedures
    procedure LimpaCampos;
    procedure SalvarProduto;
    procedure ConsultarProdutos;
    procedure EditarProdutoSelecionado;
    procedure ApagarProdutoSelecionado;
    procedure AtualizarProduto;
    procedure ValidaCampos;
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
procedure TfrmProdutos.ValidaCampos();  // procedure para validar se os campos são nulos
begin
   FNulo := False; // inicia considerando que nenhum campo está vazio

  if (Trim(EdtProduto.Text) = '') or
     (Trim(EdtCodigoBarras.Text) = '') or
     (Trim(EdtUnidade.Text) = '') or
     (Trim(EdtEstoque.Text) = '') or
     (Trim(EdtCusto.Text) = '') or
     (Trim(EdtVenda.Text) = '') then
  begin
    FNulo := True;
    ShowMessage('Os campos estão vazios...');
  end;
end;
procedure TfrmPRodutos.AtualizarProduto();
Var
  ID_Produto : Integer;
begin
   // recuperando valor do ID armazenado na propriedade tag
   ID_Produto := EdtProduto.Tag;
   // comando SQL de atualização
   DM.qryProdutos.SQL.Text :=
    'UPDATE PRODUTOS SET ' +
    'codigo_barras = :codigo_barras, ' +
    'descricao = :descricao, ' +
    'preco_custo = :preco_custo, ' +
    'preco_venda = :preco_venda, ' +
    'quantidade = :quantidade, ' +
    'unidade = :unidade ' +
    'WHERE id_produto = :id_produto';

   // passa os novos valores dos Edits para os parâmetros
   DM.qryProdutos.ParamByName('codigo_barras').AsString := EdtCodigoBarras.Text;
   DM.qryProdutos.ParamByName('descricao').AsString := EdtProduto.Text;
   DM.qryProdutos.ParamByName('preco_custo').AsFloat := StrToFloat(EdtCusto.Text);  //conversão para float no parâmetro o valor do text dos Edts (são string)
   DM.qryProdutos.ParamByName('preco_venda').AsFloat := StrToFloat(EdtVenda.Text);
   DM.qryProdutos.ParamByName('quantidade').AsFloat := StrToFloat(EdtEstoque.Text);
   DM.qryProdutos.ParamByName('unidade').AsString := EdtUnidade.Text;

   // Passa o ID para o WHERE
   DM.qryProdutos.ParamByName('id_produto').AsInteger := ID_Produto;

   // executa o comando
   DM.qryProdutos.ExecSQL;
end;
procedure TFrmProdutos.ApagarProdutoSelecionado();
var
      ID_Produto : Integer;  // variável do tipo inteiro que receberá o ID do item selecionado na grid
begin
     ID_Produto := DM.qryProdutos.FieldByName('id_produto').AsInteger;
     DM.qryProdutos.SQL.Text := 'DELETE FROM PRODUTOS WHERE id_produto = :id_produto';
     DM.qryProdutos.ParamByName('id_produto').AsInteger := ID_Produto; // parametro :ID_Produto recebe o valor armazenado na variável ID_Produto
     DM.qryProdutos.ExecSQL; // executa o comando sql
end;
procedure TFrmProdutos.EditarProdutoSelecionado();
var
  ID_Produto : Integer; // variável do tipo inteiro que receberá o ID do item selecionado na grid
begin
    // captura o ID do produto selecionado na Grid
    ID_Produto := DM.qryProdutos.FieldByName('id_produto').AsInteger;

    // Carrega os dados do banco nos Edits
    EdtCodigoBarras.Text := DM.qryProdutos.FieldByName('codigo_barras').AsString;
    EdtProduto.Text := DM.qryProdutos.FieldByName('descricao').AsString;
    EdtCusto.Text := DM.qryProdutos.FieldByName('preco_custo').AsString;
    EdtVenda.Text := DM.qryProdutos.FieldByName('preco_venda').AsString;
    EdtEstoque.Text := DM.qryProdutos.FieldByName('quantidade').AsString;
    EdtUnidade.Text := DM.qryProdutos.FieldByName('unidade').AsString;

    // Armazena o ID no Tag do Edit para utilizá-lo posteriormente
    EdtProduto.Tag := ID_Produto; // tag é uma propriedade nos componentes para armazenar valor inteiro
end;
procedure TFrmProdutos.ConsultarProdutos();
begin
    DM.qryProdutos.Close;  // finaliza qualquer query previamente
    DM.qryProdutos.SQL.Text := 'SELECT * FROM PRODUTOS order by ID_PRODUTO';  // query completa, se fosse alguma adição pontual seria add
    DM.qryProdutos.Open;  // retorna para o Delphi o resultado da query

    showmessage('Total de produtos: ' + DM.qRyProdutos.RecordCount.ToString); // Converte a contagem de linhas retornadas em string pra concatenar
    DBGridProdutos.Show; // apresentando grid ao consultar
end;

procedure TFrmProdutos.SalvarProduto();
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
        Formato := TFormatSettings.Create; // criando uma instância de TFormatSettings para armazenar configurações de formatação regional
        Formato.DecimalSeparator := ','; // formatação para separar por vírgulas -- alterando propriedade DecimalSeparator
      end;

    ValidaCampos;
      if (FNulo = False) then
        begin
        // receber dados digitados no Edt e informar para o Delphi qual é parâmetro :nome correspondente
        DM.qryProdutos.ParamByName('descricao').AsString := EdtProduto.Text;
        DM.qryProdutos.ParamByName('codigo_barras').AsString := EdtCodigoBarras.Text;
        DM.qryProdutos.ParamByName('unidade').AsString := UpperCase(EdtUnidade.Text);// uppercase -- normaliza o texto para sempre ser maiúsculo
        DM.qryProdutos.ParamByName('quantidade').AsFloat := StrToFloat(EdtEstoque.Text); // conversão necessária pois o parâmetro é double/float Edt é text str
        DM.qryProdutos.ParamByName('preco_custo').AsFloat := StrToFloat(edtCusto.Text,Formato);
        DM.qryProdutos.ParamByName('preco_venda').AsFloat := StrToFloat(edtVenda.Text,Formato);

        DM.qryProdutos.ExecSQL; // executando comando SQL acima
        showmessage('Produto cadastrado com sucesso!!');
        LimpaCampos;
        end;
    except
      on E: Exception do
        begin
            raise;   // repassa a exceção (evitar repetir a mensagem do mesmo erro) --tratar ela em outro lugar(botão salvar)
        end;
    end;
end;

procedure TFrmProdutos.LimpaCampos(); // Acessando diretamente dentro do form Produtos
  begin
      EdtCodigoBarras.Text := '';
      EdtProduto.Text := '';
      EdtCusto.Text := '';
      EdtVenda.Text := '';
      EdtEstoque.Text := '';
      EdtUnidade.Text := '';
end;


procedure TFrmProdutos.BtnApagarClick(Sender: TObject);
begin
   // verifica se a grid possui algum produto (nao esta vazia)
  if DM.qryProdutos.IsEmpty then
  begin
    ShowMessage('Consulte e selecione na grade o item desejado para exclusão');
    Exit;   // interrompe execução da procedure
  end;

  // apaga o item selecionado na Grid
  ApagarProdutoSelecionado;

  // atualiza a Grid
  ConsultarProdutos;
end;

procedure TFrmProdutos.btnConsultarProdClick(Sender: TObject);
begin
      LimpaCampos(); // limpa campos de edição (caso tenha sido realizada)
      // consulta produtos
      ConsultarProdutos;
end;

procedure TFrmProdutos.BtnEditarClick(Sender: TObject);
begin
 // verifica se a Grid possui algum produto
  if DM.qryProdutos.IsEmpty then
  begin
    ShowMessage('Certifique-se de selecionar algum produto da Grid');
    ConsultarProdutos;
    Exit;  // saindo da procedure
  end;

  // Carrega os valores do banco nos Edits e armazena o ID na Tag
  EditarProdutoSelecionado;

  // Ativa o modo de edição
  FEditando := True;
end;

procedure TFrmProdutos.BtnLimparClick(Sender: TObject);
begin
      // limpar Edt´s
      LimpaCampos;
end;

procedure TFrmProdutos.BtnSalvarClick(Sender: TObject);
begin
  ValidaCampos;

  if FNulo = True then  // Verifica se há campo nulo
    Exit;  // encerra procedure

  try  // tratamento de exceção // tenta salvar ou atualizar... caso de algum erro, retorna a mensagem do erro na tela
    if FEditando = False then
      SalvarProduto
    else
      AtualizarProduto;
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível salvar o produto: ' + E.Message);
      Exit;  //encerra procedure
    end;
  end;

  ConsultarProdutos;
  LimpaCampos;
  FEditando := False; // encerra modo edição
end;

end.
