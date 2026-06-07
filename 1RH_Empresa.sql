CREATE DATABASE rh_empresa; -- 1. Criando bd
USE rh_empresa;

CREATE TABLE colaboradores ( -- 2.criando atributos
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_contratacao DATE NOT NULL
);

INSERT INTO colaboradores (nome, cargo, salario, data_contratacao) VALUES -- 3. inserindo registros
('Ana Carolina Silva', 'Desenvolvedora Pleno', 4500.00, '2022-03-15'),
('Bruno Souza Lima', 'Analista de Suporte', 1800.00, '2023-01-10'),
('Carla Fernanda Santos', 'Gerente de Projetos', 7500.00, '2021-08-22'),
('Daniel Alves Pereira', 'Estagiário de TI', 1200.00, '2024-02-01'),
('Fernanda Oliveira Rocha', 'Coordenadora de RH', 6200.00, '2020-11-05'),
('Gustavo Henrique Costa', 'Desenvolvedor Júnior', 2200.00, '2023-06-20');

SELECT * FROM Colaboradores WHERE salario > 2000.00 ORDER BY salario DESC; -- 4.Selecionando salario maiores que 2000


SELECT * FROM Colaboradores WHERE salario < 2000.00 ORDER BY salario ASC; -- 5.Selecionando salario menores que 2000

UPDATE colaboradores  -- 6.update
SET cargo = "Analista de suporte"
WHERE id = 4;

UPDATE colaboradores  -- 6.update
SET salario = 1800.00
WHERE id = 4;
