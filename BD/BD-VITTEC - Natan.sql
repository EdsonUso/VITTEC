CREATE DATABASE vittec;
USE vittec;

CREATE TABLE vinicola(
	idVinicola INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    endereco VARCHAR(70),
    responsavel VARCHAR(45),
    qtdSensores INT
);

CREATE TABLE terranova(
	temperaturaMedia DECIMAL (3,1),
	temperaturaMaxima DECIMAL (3,1),
    temperaturaMinima DECIMAL (3,1),
    data DATE
);

CREATE TABLE aurora(
	temperaturaMedia DECIMAL (3,1),
	temperaturaMaxima DECIMAL (3,1),
    temperaturaMinima DECIMAL (3,1),
    data DATE
);

INSERT INTO vinicola (nome, endereco, responsavel, qtdSensores) VALUES
	('Terranova', 'Rua XPTO, 123', 'Marcos da Silva', 4),
    ('Aurora', 'Rua OPTX, 456', 'Mariana Lima', 6);
    
SELECT * FROM vinicola;

INSERT INTO terranova VALUES
	(30.0, 40.0, 20.0, '2024-02-12'),
    (34.7, 37.2, 32.1, '2024-02-13'),
    (29.8, 33.0, 26.5, '2024-02-14');

SELECT * FROM terranova ORDER BY data DESC;

INSERT INTO aurora VALUES
	(36.6, 40.0, 33.2, '2022-05-30'),
    (21.1, 22.5, 19.1, '2022-05-31'),
    (30.8, 40.2, 21.4, '2022-06-01');

SELECT * FROM terranova ORDER BY data DESC;