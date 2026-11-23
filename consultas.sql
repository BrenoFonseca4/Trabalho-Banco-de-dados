--Nome: Breno Fonseca Alexandre
--Tema: Banco de uma livraria

USE bd_livraria;

-- Pergunta: quais foram as vendas realizadas, com título do livro e autor?
SELECT v.id_venda,
       v.data_hora_venda,
       v.canal,
       l.titulo,
       a.autor
FROM venda v
JOIN item_venda iv  ON iv.id_venda = v.id_venda
JOIN livro l        ON l.ISBN = iv.ISBN
JOIN livro_autor a  ON a.ISBN = l.ISBN;

-- Pergunta: quais livros nunca foram vendidos?
-- Resultado esperado com a carga atual: 2 linhas (Memorias Postumas e Capitaes da Areia).
SELECT l.ISBN,
       l.titulo,
       l.qtd_estoque
FROM livro l
LEFT JOIN item_venda iv ON iv.ISBN = l.ISBN
WHERE iv.ISBN IS NULL;

-- Pergunta: quais clientes de CJoão pessoa têm telefone cadastrado, em ordem alfabética?
-- Resposta (Joao, Maria e Pedro).
SELECT c.nome,
       c.cidade,
       t.telefone
FROM cliente c
JOIN cliente_telefone t ON t.id_cliente = c.id_cliente
WHERE c.cidade = 'João pessoa'
ORDER BY c.nome;


-- Pergunta: qual o resumo geral das vendas (quantidade, total, média, menor e maior valor)?
-- (funções de agregação sem GROUP BY)
-- Resultado:(5 vendas, total 269.30).
SELECT COUNT(*)         AS qtd_vendas,
       SUM(valor_total) AS total_vendido,
       AVG(valor_total) AS ticket_medio,
       MIN(valor_total) AS menor_venda,
       MAX(valor_total) AS maior_venda
FROM venda;

-- Pergunta: quantas vendas e quanto foi vendido?
-- Resultado (balcao: 3 vendas; site: 2 vendas).
SELECT canal,
       COUNT(*)         AS qtd_vendas,
       SUM(valor_total) AS total_vendido
FROM venda
GROUP BY canal;

-- Pergunta: quais autores têm mais de um livro cadastrado, e quantas unidades há em estoque?
-- Resultado(Machado de Assis, 2 livros, 27 unidades).
SELECT a.autor,
       COUNT(*)           AS qtd_livros,
       SUM(l.qtd_estoque) AS estoque_total
FROM livro_autor a
JOIN livro l ON l.ISBN = a.ISBN
GROUP BY a.autor
HAVING COUNT(*) > 1;





