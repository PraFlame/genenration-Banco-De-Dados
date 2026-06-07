CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;
CREATE TABLE tb_classes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);
CREATE TABLE tb_personagens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel INT DEFAULT 1,
    poder_ataque INT DEFAULT 0,
    poder_defesa INT DEFAULT 0,
    classe_id INT NOT NULL,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Mestre das armas corpo a corpo, alta resistência e defesa'),
('Mago', 'Manipulador de energias arcanas, alto dano mágico em área'),
('Arqueiro', 'Especialista em ataques à distância e precisão milimétrica'),
('Ladino', 'Agilidade e furtividade, especialista em ataques críticos'),
('Paladino', 'Guerreiro sagrado que mescla combate físico e curas');
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id) VALUES
('Conan, o Bárbaro', 15, 2500, 2800, 1),
('Xena, a Princesa Guerreira', 12, 2200, 2400, 1),

('Merlin, o Sábio', 20, 3500, 1200, 2),
('Morgana, a Feiticeira', 18, 3200, 1000, 2),

('Legolas, o Elfo', 14, 2800, 1500, 3),
('Robin Hood', 10, 2100, 1300, 3),

('Garrett, o Mestre dos Ladrões', 11, 2300, 900, 4),
('Carmen Sandiego', 9, 1900, 800, 4),

('Arthur Pendragon', 16, 2700, 2600, 5);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%" OR nome LIKE "%C%";

SELECT 
    p.id AS personagem_id,
    p.nome AS personagem,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    c.id AS classe_id,
    c.nome AS classe,
    c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
ORDER BY c.nome, p.nivel DESC;

SELECT 
    p.id AS personagem_id,
    p.nome AS personagem,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    c.nome AS classe,
    c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro'  -- ou c.id = 3
ORDER BY p.nivel DESC;

