CREATE DATABASE vittec;
USE vittec;

CREATE TABLE cadastro (
idcadastro INT PRIMARY KEY AUTO_INCREMENT, 
vinicula VARCHAR (45),
email VARCHAR (45),
senha CHAR (9),
telefone CHAR(20),
endereco VARCHAR (100),
cpf_cnpj CHAR (14)
);

SELECT * FROM cadastro;

INSERT INTO cadastro VALUES 
	(DEFAULT, 'Uvinhas 10', 'uvinhas010@gmail.com', '123456789', '+55 11 65879-4654', 'Rua das Uvas, nº10 - Jardim Avu, Uvanopólis, RS', '123456789-1'),
    (DEFAULT, 'Sua Uva', 'suauva@gmail.com', '987654321', '+55 11 32155-8914', 'Alameda da Uva, nº112 - Jardim Parreiras, Parreiropólis, RS', '123456789-2'),
    (DEFAULT, 'Doce uva', 'uvadoce010@gmail.com', '123987465', '+55 11 32715-1548', 'Rua Doce, nº34 - Jardim Uvalândia, Terra das Uvas, RS', '123456789-3');
    
SELECT * FROM cadastro;

SELECT vinicula, email FROM cadastro WHERE idcadastro = 2;


CREATE TABLE vinicula (
tipo_uva VARCHAR (45) PRIMARY KEY, 
data_hora DATETIME,
temperatura DECIMAL (5,2), 
umidade FLOAT
);

SELECT * FROM vinicula;

INSERT INTO vinicula VALUES 
	('Uva Verde', '2023-03-17 10:00:00', '34.10', '50');
    
SELECT * FROM vinicula;

SELECT * FROM vinicula WHERE tipo_uva LIKE 'Uva Verde';


CREATE TABLE uva (
fkCadastro INT, 
fkTipo_uva VARCHAR (45),
temperatura_c DECIMAL (5,2),
umidade_c FLOAT,
CONSTRAINT fkCadastro FOREIGN KEY (fkCadastro)
	REFERENCES cadastro(idcadastro),
CONSTRAINT fkTipo_uva FOREIGN KEY (fkTipo_uva)
	REFERENCES vinicula(tipo_uva)    
);

SELECT * FROM uva;

INSERT INTO uva VALUES 
	(1, 'Uva Verde', '36.50', '60');

SELECT * FROM uva;

SELECT * FROM uva JOIN vinicula
	ON tipo_uva = fkTipo_uva;
    

