CREATE DATABASE db_generation_pizzaria_legal;
USE db_generation_pizzaria_legal;
CREATE TABLE tb_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT,
    eh_doce BOOLEAN NOT NULL  -- TRUE = doce, FALSE = salgada
);
CREATE TABLE tb_pizzas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    tamanho ENUM('P', 'M', 'G', 'GG') DEFAULT 'G',
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (categoria, descricao, eh_doce) VALUES
('Salgada Tradicional', 'Pizzas com ingredientes clássicos como queijo, molho e carnes', FALSE),
('Salgada Especial', 'Pizzas com ingredientes diferenciados e combos especiais', FALSE),
('Doce Tradicional', 'Sobremesas em forma de pizza com chocolate e frutas', TRUE),
('Doce Gourmet', 'Pizzas doces com ingredientes premium e finalização especial', TRUE),
('Vegana', 'Pizzas sem ingredientes de origem animal, opção saudável', FALSE);
INSERT INTO tb_pizzas (nome, descricao, preco, tamanho, categoria_id) VALUES
('Margherita', 'Molho de tomate, mussarela, manjericão fresco', 42.90, 'M', 1),
('Calabresa', 'Molho de tomate, calabresa fatiada, cebola, azeitonas', 48.90, 'G', 1),
('Portuguesa', 'Presunto, mussarela, ovos, cebola, azeitonas, ervilhas', 55.90, 'G', 1),

('Frango com Catupiry', 'Frango desfiado, catupiry original, milho, batata palha', 62.90, 'G', 2),
('Pepperoni', 'Pepperoni importado, mussarela, molho especial', 59.90, 'G', 2),

('Brigadeiro', 'Cobertura de brigadeiro, granulado de chocolate, leite condensado', 52.90, 'M', 3),
('Romeu e Julieta', 'Goiabada cascão, queijo mussarela, cobertura de açúcar', 49.90, 'M', 3),

('Chocolate Belga', 'Chocolate belga 70% coco, morangos frescos, calda de framboesa', 79.90, 'G', 4);

SELECT * FROM tb_pizzas WHERE preco > 45.00 ORDER BY preco ASC;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00 ORDER BY preco ASC;

SELECT * FROM tb_pizzas WHERE nome LIKE '%m%' OR nome LIKE '%M%' ORDER BY nome;

SELECT 
    p.id AS pizza_id,
    p.nome AS pizza,
    p.descricao AS ingredientes,
    p.preco,
    p.tamanho,
    c.id AS categoria_id,
    c.categoria AS tipo_pizza,
    c.descricao AS info_categoria,
    CASE 
        WHEN c.eh_doce = TRUE THEN 'Doce 🍰'
        ELSE 'Salgada 🍕'
    END AS classificacao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
ORDER BY c.categoria, p.preco;

SELECT 
    p.id AS pizza_id,
    p.nome AS pizza,
    p.descricao AS ingredientes,
    p.preco,
    p.tamanho,
    c.categoria AS tipo_pizza,
    CASE 
        WHEN c.eh_doce = TRUE THEN '🍰 Doce'
        ELSE '🍕 Salgada'
    END AS classificacao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.eh_doce = TRUE  -- Busca todas as pizzas doces
ORDER BY p.preco DESC;

