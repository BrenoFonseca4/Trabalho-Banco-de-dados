--Projeto: bd_livraria
--Autor: Breno Fonseca Alexandre

CREATE DATABASE IF NOT EXISTS bd_livraria;
USE bd_livraria;

CREATE TABLE livro (
  ISBN        VARCHAR(13)  NOT NULL,
  titulo      VARCHAR(150) NOT NULL,
  editora     VARCHAR(80)  NOT NULL,
  preco_capa  DECIMAL(8,2) NOT NULL,
  qtd_estoque INT          NOT NULL,
  PRIMARY KEY (ISBN),
  CONSTRAINT ck_livro_preco   CHECK (preco_capa >= 0),
  CONSTRAINT ck_livro_estoque CHECK (qtd_estoque >= 0)
);

CREATE TABLE IF NOT EXISTS cliente (
  id_cliente    INT          NOT NULL AUTO_INCREMENT,
  nome          VARCHAR(100) NOT NULL,
  cpf           VARCHAR(11),
  email         VARCHAR(100),
  rua           VARCHAR(100),
  numero        VARCHAR(10),
  bairro        VARCHAR(60),
  cidade        VARCHAR(60),
  cep           VARCHAR(8),
  data_cadastro DATE         NOT NULL,
  PRIMARY KEY (id_cliente),
  CONSTRAINT cliente_cpf UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS venda ( id_venda INT AUTO_INCREMENT PRIMARY KEY,
data_hora_venda DATETIME NOT NULL,
canal VARCHAR (10) NOT NULL,
forma_pagamento VARCHAR(20) NOT NULL,
valor_total DECIMAL (10,2) NOT NULL,

CHECK (canal IN ('balcao', 'site')), CHECK (forma_pagamento IN ('dinheiro', 'cartao', 'pix')), CHECK (valor_total >= 0));

CREATE TABLE cliente_telefone( id_cliente INT NOT NULL, telefone VARCHAR(15)  NOT NULL,
PRIMARY KEY (id_cliente, telefone),
FOREIGN KEY (id_cliente),
REFERENCES cliente(id_cliente) ON DELETE CASCADE); -- se apagar os clientes, automaticamente o telefone relacionado a ele será apagado

CREATE TABLE livro_autor (ISBN VARCHAR (13)NOT NULL, autor VARCHAR(100) NOT NULL,
PRIMARY KEY (ISBN, autor),
FOREIGN KEY (ISBN) REFERENCES livro(ISBN) ON DELETE CASCADE); -- se o livro for apagado, os registros dessa tabela também serão

CREATE TABLE item_venda (id_venda INT NOT NULL, ISBN VARCHAR(13)NOT NULL,
PRIMARY KEY (id_venda, ISBN),
FOREIGN KEY (id_venda) REFERENCES venda(id_venda) ON DELETE CASCADE,
FOREIGN KEY (ISBN) REFERENCES livro(ISBN) ON DELETE RESTRICT); -- restrict porque não pode apagar um livro que já aparece em uma venda
								-- Cascade porque apagar um livro apaga os registros dele em item_venda
