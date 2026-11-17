CREATE TABLE produtos (
    id_produto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    codigo_barras VARCHAR(50),
    unidade VARCHAR(10) NOT NULL,
    quantidade NUMERIC(15,3) DEFAULT 0,
    preco_custo NUMERIC(15,2) DEFAULT 0,
    preco_venda NUMERIC(15,2) DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);