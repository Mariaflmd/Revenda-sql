CREATE DATABASE db_revenda_mariaf;

CREATE TABLE cliente(
	cliente_id serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	telefone varchar(12) UNIQUE,
	data_cadastro date NOT NULL	
);

CREATE TABLE produto(
	produto_id serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	preco decimal(10,2),
	estoque int NOT NULL,
	genero varchar(50)
);

CREATE TABLE funcionario(
	funcionario_id serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	cargo varchar(50),
	salario decimal(10,2),
	data_contratacao date,
	turno varchar(20)
);

CREATE TABLE pedido(
	pedido_id serial PRIMARY KEY,
	data_pedido date NOT NULL,
	status varchar(30),
	valor_total decimal(10,2),
	desconto decimal(10,2),
	cliente_id int,
	FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);

CREATE TABLE pedido_produto(
	pedido_id int,
	produto_id int,
	quantidade int NOT NULL,
	preco_unitario decimal(10,2),
	total_item decimal(10,2),
	FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
	FOREIGN KEY (produto_id) REFERENCES produto(produto_id)
);

CREATE TABLE pagamento(
	pagamento_id serial PRIMARY KEY,
	valor decimal(10,2) NOT NULL,
	metodo varchar(50),
	data_pagamento date,
	pedido_id int,
	FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id)
);

INSERT INTO cliente (nome, email, telefone, data_cadastro) VALUES
('Maria Silva', 'maria.silva@email.com', '11987654321', '2024-01-10'),
('João Santos', 'joao.santos@email.com', '21998765432', '2024-02-15'),
('Ana Pereira', 'ana.pereira@email.com', '31991234567', '2024-03-20'),
('Carlos Lima', 'carlos.lima@email.com', '41999887766', '2024-04-05'),
('Beatriz Souza', 'beatriz.souza@email.com', '51988776655', '2024-05-10'),
('Lucas Oliveira', 'lucas.oliveira@email.com', '61987654321', '2024-06-22'),
('Fernanda Rocha', 'fernanda.rocha@email.com', '71991234567', '2024-07-18'),
('Ricardo Alves', 'ricardo.alves@email.com', '81999887766', '2024-08-02'),
('Juliana Costa', 'juliana.costa@email.com', '91988776655', '2024-09-30'),
('Paulo Martins', 'paulo.martins@email.com', '11987654322', '2024-10-15');

INSERT INTO produto (nome, preco, estoque, genero) VALUES
('Perfume amadeirado', 49.90, 100, 'Masculino'),
('Hidratante de lavanda', 89.90, 50, 'Feminino'),
('Espuma barbeadora', 120.00, 80, 'Unissex'),
('Desodorante', 150.00, 60, 'Unissex'),
('Esponja de maquiagem', 99.90, 70, 'Feminino'),
('Máquina de barbear', 39.90, 90, 'Masculino'),
('Creme antiatrito', 59.90, 40, 'Feminino'),
('Perfume Egeo', 110.00, 30, 'Masculino'),
('Esfoliante', 250.00, 20, 'Unissex'),
('Máscara de Skin Care Facial', 15.00, 200, 'Unissex');

INSERT INTO funcionario (nome, cargo, salario, data_contratacao, turno) VALUES
('Joana Almeida', 'Vendedora', 1800.00, '2023-01-10', 'Manhã'),
('Pedro Gonçalves', 'Gerente', 3500.00, '2022-11-15', 'Integral'),
('Marcela Ferreira', 'Estoquista', 1500.00, '2023-03-20', 'Tarde'),
('Renato Dias', 'Caixa', 1700.00, '2023-02-25', 'Noite'),
('Luana Ribeiro', 'Vendedora', 1800.00, '2023-04-05', 'Manhã'),
('Carlos Henrique', 'Auxiliar de Limpeza', 1200.00, '2023-05-10', 'Tarde'),
('Ana Beatriz', 'Vendedora', 1800.00, '2023-06-22', 'Noite'),
('Ricardo Lima', 'Segurança', 2000.00, '2023-07-18', 'Integral'),
('Paula Mendes', 'Caixa', 1700.00, '2023-08-02', 'Manhã'),
('Lucas Souza', 'Estoquista', 1500.00, '2023-09-30', 'Tarde');

INSERT INTO pedido (data_pedido, status, valor_total, desconto, cliente_id) VALUES
('2024-08-01', 'Entregue', 299.70, 0, 1),
('2024-08-05', 'Cancelado', 0, 0, 2),
('2024-08-07', 'Pendente', 450.00, 30.00, 3),
('2024-08-10', 'Entregue', 120.00, 0, 4),
('2024-08-12', 'Entregue', 89.90, 10.00, 5),
('2024-08-15', 'Pendente', 59.90, 0, 6),
('2024-08-18', 'Entregue', 250.00, 25.00, 7),
('2024-08-20', 'Entregue', 180.00, 0, 8),
('2024-08-22', 'Cancelado', 0, 0, 9),
('2024-08-25', 'Pendente', 75.00, 5.00, 10);

INSERT INTO pedido_produto (pedido_id, produto_id, quantidade, preco_unitario, total_item) VALUES
(1, 1, 2, 49.90, 99.80),
(1, 10, 10, 15.00, 150.00),
(3, 3, 3, 120.00, 360.00),
(3, 5, 1, 89.90, 89.90),
(4, 3, 1, 120.00, 120.00),
(5, 2, 1, 89.90, 89.90),
(7, 9, 1, 250.00, 250.00),
(8, 4, 1, 150.00, 150.00),
(8, 6, 1, 39.90, 39.90),
(10, 7, 1, 59.90, 59.90);

INSERT INTO pagamento (valor, metodo, data_pagamento, pedido_id) VALUES
(299.70, 'Cartão de Crédito', '2024-08-02', 1),
(0, 'Nenhum', NULL, 2),
(420.00, 'Boleto', '2024-08-08', 3),
(120.00, 'Dinheiro', '2024-08-11', 4),
(79.90, 'Cartão de Débito', '2024-08-13', 5),
(59.90, 'Dinheiro', '2024-08-16', 6),
(225.00, 'Pix', '2024-08-19', 7),
(180.00, 'Cartão de Crédito', '2024-08-21', 8),
(0, 'Nenhum', NULL, 9),
(70.00, 'Boleto', '2024-08-26', 10);

CREATE VIEW vw_pedido_cliente AS SELECT 
    p.pedido_id,
    p.data_pedido,
    p.status,
    p.valor_total,
    p.desconto,
    c.cliente_id,
    c.nome AS nome_cliente,
    c.email,
    c.telefone
FROM pedido p INNER JOIN cliente c ON p.cliente_id = c.cliente_id;

SELECT * FROM vw_pedido_cliente;

CREATE VIEW vw_pedido_produto_detalhes AS SELECT 
    pp.pedido_id,
    pp.produto_id,
    pr.nome AS nome_produto,
    pr.genero,
    pp.quantidade,
    pp.preco_unitario,
    pp.total_item
FROM pedido_produto pp INNER JOIN produto pr ON pp.produto_id = pr.produto_id;

SELECT * FROM vw_pedido_produto_detalhes;

-- 2º aula

SELECT * FROM produto WHERE nome LIKE '%Perfume%';

EXPLAIN SELECT * FROM produto WHERE nome LIKE '%Perfume%';

CREATE INDEX idx_nome_produto ON produto(nome);



ALTER TABLE produto ALTER COLUMN estoque TYPE varchar(20);

CREATE USER "maria@localhost" WITH PASSWORD 'senha123';
GRANT CONNECT ON DATABASE db_revenda_mariaf TO "maria@localhost";
GRANT USAGE ON SCHEMA public TO "maria@localhost";
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "maria@localhost" WITH GRANT OPTION;

CREATE USER "isabela@localhost" WITH PASSWORD 'senha456';
GRANT CONNECT ON DATABASE db_revenda_mariaf TO "isabela@localhost";

EXPLAIN SELECT * FROM produto WHERE nome LIKE '%Perfume%';

SELECT p.pedido_id, p.data_pedido, c.nome
FROM pedido p INNER JOIN cliente c ON p.cliente_id = c.cliente_id;
SELECT p.pedido_id, p.data_pedido, c.nome
FROM pedido p LEFT JOIN cliente c ON p.cliente_id = c.cliente_id;
SELECT p.pedido_id, p.data_pedido, c.nome
FROM pedido p RIGHT JOIN cliente c ON p.cliente_id = c.cliente_id;

SELECT pp.pedido_id, pr.nome, pp.quantidade
FROM pedido_produto pp INNER JOIN produto pr ON pp.produto_id = pr.produto_id;
SELECT pp.pedido_id, pr.nome, pp.quantidade
FROM pedido_produto pp LEFT JOIN produto pr ON pp.produto_id = pr.produto_id;
SELECT pp.pedido_id, pr.nome, pp.quantidade
FROM pedido_produto pp RIGHT JOIN produto pr ON pp.produto_id = pr.produto_id;

SELECT f.nome, p.pedido_id
FROM funcionario f INNER JOIN pedido p ON 1=1 LIMIT 10;
SELECT f.nome, p.pedido_id
FROM funcionario f LEFT JOIN pedido p ON 1=1 LIMIT 10;
SELECT f.nome, p.pedido_id
FROM funcionario f RIGHT JOIN pedido p ON 1=1 LIMIT 10;

SELECT pg.pagamento_id, p.pedido_id, pg.valor
FROM pagamento pg INNER JOIN pedido p ON pg.pedido_id = p.pedido_id;
SELECT pg.pagamento_id, p.pedido_id, pg.valor
FROM pagamento pg LEFT JOIN pedido p ON pg.pedido_id = p.pedido_id;
SELECT pg.pagamento_id, p.pedido_id, pg.valor
FROM pagamento pg RIGHT JOIN pedido p ON pg.pedido_id = p.pedido_id;

UPDATE funcionario SET turno = NULL WHERE cargo = 'Caixa';

