CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE tb_produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    fabricante VARCHAR(50),
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Remédios controlados e não controlados'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Vitaminas', 'Suplementos vitamínicos e minerais'),
('Higiene', 'Produtos de higiene pessoal e limpeza'),
('Infantil', 'Produtos específicos para crianças');
INSERT INTO tb_produtos (nome, preco, estoque, fabricante, categoria_id) VALUES
('Dipirona 500mg', 12.90, 100, 'EMS', 1),
('Paracetamol 750mg', 15.50, 80, 'Neo Química', 1),

('Protetor Solar FPS 50', 55.90, 30, 'La Roche', 2),
('Shampoo Anticaspa', 32.90, 45, 'Vichy', 2),

('Vitamina C 1000mg', 45.00, 60, 'Ceweb', 3),
('Complexo B', 38.50, 50, 'Nutrifarma', 3),

('Creme Dental', 8.90, 120, 'Colgate', 4),
('Fralda P', 42.90, 40, 'Pampers', 5);

SELECT * FROM tb_produtos WHERE preco > 50.00 ORDER BY preco ASC;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00 ORDER BY preco ASC;

SELECT * FROM tb_produtos WHERE nome LIKE '%c%' OR nome LIKE '%C%' ORDER BY nome;

SELECT 
    p.id,
    p.nome AS produto,
    p.preco,
    p.estoque,
    p.fabricante,
    c.nome AS categoria,
    c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT 
    p.id,
    p.nome AS produto,
    p.preco,
    p.estoque,
    p.fabricante,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos';

