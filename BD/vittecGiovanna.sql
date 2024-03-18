CREATE DATABASE sprint;

CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (40) NOT NULL,
email VARCHAR (50),
telefone CHAR (12),
estado VARCHAR (30)) AUTO_INCREMENT =1;

INSERT INTO cliente VALUES (DEFAULT,'Anprovin','anprovin@gmail.com','3192300-8790','Minas-Gerais');
INSERT INTO cliente VALUES (DEFAULT,'Abreu Garcia','abreugarcia@gmail.com','1198744-1023','São Paulo'),
(DEFAULT, 'Terranova','terranova@outlook.com','7593478-7845','Bahia'),
(DEFAULT,'Luiz Argenta','luizargenta@outlook.com','5497860-1689','Rio Grande do Sul'),
(DEFAULT,'Miolo','miolovinicolas@gmail.com','5496312-0124','Rio Grande do Sul');

SELECT*FROM cliente;

SELECT nome FROM cliente;

SELECT * FROM cliente
WHERE estado = 'Rio Grande do Sul';


SELECT * FROM cliente
WHERE nome LIKE '%_a';


SELECT email FROM cliente
WHERE email LIKE 't%';

SELECT telefone,nome FROM cliente;

SELECT telefone,nome FROM cliente
WHERE telefone LIKE '5%'
