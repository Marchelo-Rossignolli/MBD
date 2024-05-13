# MBD
Modelagem de Banco de Dados - Marcelo Rossignolli


---

# Documentação do Modelo Relacional da Frutaria

## Visão Geral

Este documento descreve o modelo relacional de banco de dados para uma frutaria, projetado para gerenciar produtos, categorias, fornecedores e vendas, aplicando rigorosamente os princípios de relacionamentos 1:N e N:N.

## Tabelas e Relacionamentos

### 1. Produtos

**Descrição:** Tabela que armazena informações sobre os produtos disponíveis na frutaria.

- **ID** (Primary Key): Identificador único do produto.
- **NomeProduto**: Nome do produto.
- **Preço**: Preço do produto.
- **QuantidadeEmEstoque**: Quantidade disponível em estoque.
- **IDCategoria** (Foreign Key): Referência à tabela `Categorias`.
- **IDFornecedor** (Foreign Key): Referência à tabela `Fornecedores`.

**SQL:**
```sql
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10, 2),
    QuantidadeEmEstoque INT,
    IDCategoria INT,
    IDFornecedor INT,
    FOREIGN KEY (IDCategoria) REFERENCES Categorias(ID),
    FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(ID)
);
```

### 2. Categorias

**Descrição:** Tabela que armazena as categorias dos produtos.

- **ID** (Primary Key): Identificador único da categoria.
- **NomeCategoria**: Nome da categoria.

**SQL:**
```sql
CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    NomeCategoria VARCHAR(100)
);
```

### 3. Fornecedores

**Descrição:** Tabela que armazena informações sobre os fornecedores.

- **ID** (Primary Key): Identificador único do fornecedor.
- **NomeFornecedor**: Nome do fornecedor.
- **Contato**: Informações de contato do fornecedor.
- **Endereco**: Endereço do fornecedor.

**SQL:**
```sql
CREATE TABLE Fornecedores (
    ID INT PRIMARY KEY,
    NomeFornecedor VARCHAR(100),
    Contato VARCHAR(100),
    Endereco VARCHAR(200)
);
```

### 4. Vendas

**Descrição:** Tabela que armazena informações sobre as vendas realizadas.

- **ID** (Primary Key): Identificador único da venda.
- **DataVenda**: Data em que a venda foi realizada.
- **TotalVenda**: Valor total da venda.

**SQL:**
```sql
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    DataVenda DATE,
    TotalVenda DECIMAL(10, 2)
);
```

### 5. Vendas_Produtos

**Descrição:** Tabela associativa que conecta `Vendas` e `Produtos`, representando o relacionamento N:N.

- **IDVenda** (Foreign Key): Referência à tabela `Vendas`.
- **IDProduto** (Foreign Key): Referência à tabela `Produtos`.
- **QuantidadeVendida**: Quantidade do produto vendida na venda específica.

**SQL:**
```sql
CREATE TABLE Vendas_Produtos (
    IDVenda INT,
    IDProduto INT,
    QuantidadeVendida INT,
    PRIMARY KEY (IDVenda, IDProduto),
    FOREIGN KEY (IDVenda) REFERENCES Vendas(ID),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID)
);
```

## Relacionamentos

### 1:N (Um para Muitos)
- **Produtos** para **Categorias**: Um produto pertence a uma categoria.
- **Produtos** para **Fornecedores**: Um produto é fornecido por um fornecedor.
- **Vendas** para **Vendas_Produtos**: Uma venda pode incluir vários produtos.
- **Produtos** para **Vendas_Produtos**: Um produto pode ser vendido em várias vendas.

### N:N (Muitos para Muitos)
- **Vendas** para **Produtos** através da tabela **Vendas_Produtos**: Uma venda pode conter vários produtos, e um produto pode ser incluído em várias vendas.

