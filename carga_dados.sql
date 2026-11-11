--Nome: Breno Fonseca Alexandre
-- Tema: Banco de uma livraria 

USE bd_livraria;


--Inserts
INSERT INTO livro(ISBN, titulo, editora, preco_capa, qtd_estoque)
VALUES
('9788535902775', 'Dom Casmurro', 'Atica', 39.90, 15),
('9788572326113', 'O Alienista', 'Martin Claret', 29.90, 12),
('9788537817442', 'Memorias Postumas', 'Zahar', 49.90, 8),
('9786555521234', 'Capitaes da Areia', 'Companhia das Letras', 44.90, 10),
('9786559987654', 'A Hora da Estrela', 'Rocco', 34.90, 20);

INSERT INTO cliente(nome, cpf, email, rua, numero, bairro, cidade, cep, data_cadastro)
VALUES
('Joao Silva', '12345678901', 'joao@email.com', 'Rua A', '10', 'Centro', 'Cabedelo', '58100000', '2026-11-01'),
('Maria Souza', '98765432100', 'maria@email.com', 'Rua B', '20', 'Intermares', 'Cabedelo', '58101000', '2026-11-02'),
('Pedro Lima', '11122233344', NULL, 'Rua C', '30', 'Poco', 'Cabedelo', '58102000', '2026-11-03'),
('Ana Costa', '55566677788', 'ana@email.com', 'Rua D', '40', 'Centro', 'Joao Pessoa', '58000000', '2026-11-04'),
('Lucas Santos', '99988877766', 'lucas@email.com', 'Rua E', '50', 'Bessa', 'Joao Pessoa', '58035000', '2026-11-05');

INSERT INTO venda
(data_hora_venda, canal, forma_pagamento, valor_total)
VALUES
('2026-11-01 10:00:00', 'balcao', 'pix', 39.90),
('2026-11-01 14:30:00', 'site', 'cartao', 79.80),
('2026-11-02 09:15:00', 'balcao', 'dinheiro', 29.90),
('2026-11-03 16:45:00', 'site', 'pix', 84.80),
('2026-11-04 11:20:00', 'balcao', 'cartao', 34.90);
INSERT INTO cliente_telefone
(id_cliente, telefone)
VALUES
(1, '83999990001'),
(2, '83999990002'),
(3, '83999990003');
INSERT INTO livro_autor
(ISBN, autor)
VALUES
('9788535902775', 'Machado de Assis'),
('9788572326113', 'Machado de Assis'),
('9786559987654', 'Clarice Lispector');
INSERT INTO item_venda
(id_venda, ISBN)
VALUES
(1, '9788535902775'),
(2, '9788572326113'),
(3, '9786559987654');

-- Consultas

-- Quais livros custam mais de x reais?
SELECT *
FROM livro
WHERE preco_capa > 40;

-- select para checar os clientes que tem email cadastrado, no caso, todos menos pedro.
SELECT *
FROM cliente
WHERE email IS NULL;
-- Quais livros possuem estoque entre 5 e 15 unidades?
-- resposta deve ser todos menos dom casmurro e hora da estrela
SELECT *
FROM livro
WHERE qtd_estoque BETWEEN 5 AND 15;

--UPDATES
--checando alteração do preço

-- Antes da alteração de preço
SELECT *
FROM livro
WHERE ISBN = '9788535902775';

UPDATE livro
SET preco_capa = 45.90
WHERE ISBN = '9788535902775';

-- Depois da alteração de preço
SELECT *
FROM livro
WHERE ISBN = '9788535902775';

--DELETE

-- Antes da exclusão
SELECT *
FROM cliente
WHERE id_cliente = 5;

DELETE FROM cliente
WHERE id_cliente = 5;

-- Depois da exclusão
SELECT *
FROM cliente
WHERE id_cliente = 5;
--deve retornar nada
