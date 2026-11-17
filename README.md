Gerenciador de Estoque

Projeto de um sistema de gerenciamento de estoque desenvolvido em Delphi, utilizando Object Pascal.

Sobre o projeto

O objetivo deste projeto é desenvolver uma aplicação desktop para gerenciamento de produtos e movimentações de estoque, aplicando conceitos de programação orientada a objetos e desenvolvimento com Delphi.

Tecnologias utilizadas

- Delphi 13
- Object Pascal
- PostgreSQL
- VCL
- Git e GitHub

Funcionalidades

- [x] Estrutura inicial da aplicação
- [x] Navegação entre telas
- [X] Cadastro de produtos
- [X] Consultas SQL utilizando TFDQuery
- [ ] Edição de produtos
- [ ] Exclusão de produtos
- [ ] Controle de movimentações de estoque
- [ ] Relatórios

## Como executar o projeto

### 1. Pré-requisitos

- Delphi 13 Community Edition
- PostgreSQL
- Driver FireDAC para PostgreSQL (`libpq.dll`)

### 2. Configuração do banco de dados

Após instalar o PostgreSQL, siga os passos:

1. Abra o pgAdmin.
2. Conecte-se ao servidor PostgreSQL.
3. Abra o arquivo `database/criar_banco.sql` e execute o script para criar o banco de dados `gerenciador_estoque`.
4. Conecte-se ao banco `gerenciador_estoque`.
5. Abra o arquivo `database/estrutura.sql` e execute o script para criar a tabela `produtos`.

### 3. Configuração da conexão

Configure a conexão PostgreSQL no Delphi utilizando FireDAC (`TFDConnection`).

Informe os dados de conexão do seu ambiente:

- Servidor: `localhost`
- Porta: `5432`
- Banco de dados: `gerenciador_estoque`
- Usuário: seu usuário PostgreSQL
- Senha: sua senha PostgreSQL

### 4. Executando a aplicação

Após configurar o banco de dados e a conexão, abra o projeto no Delphi e execute a aplicação.

Autor

Caio Sousa

Desenvolvido como projeto de estudo e portfólio para aprimoramento em desenvolvimento Delphi.

© 2026 Caio Sousa. Todos os direitos reservados.
