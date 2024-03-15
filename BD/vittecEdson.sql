CREATE DATABASE vittec;

USE vittec;

CREATE TABLE tbUsuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(40) not null,
    emailUsuario VARCHAR(60) not null,
    senhaUsuario VARCHAR(30) not null
);




-- UMA VINICULA PODE TER VARIOS HECTARES, MAS UM HECTAR SÓ PODE TER UMA VINICULA --
CREATE TABLE tbVinicula( -- Dados de cadastro e estrutura da vinicula do usuario
	idVinicula INT PRIMARY KEY AUTO_INCREMENT,
    nomeVinicula VARCHAR(40),
    cepVinicula CHAR(9) , -- Mais um espaço para o ifem
    ruaVinicula VARCHAR(40),
    bairroVinicula VARCHAR(40),
    cidadeVinicula VARCHAR(40),
    quantidadeHectarVinicula INT
);

-- UM TIPO DE UVA PODE ESTAR EM VARIOS HECTARES, MAS UM HECTARE SÓ PODE TER UM TIPO DE UVA --
CREATE TABLE tbHectare( -- Dados de estruta do hectare da vinicula do usuario/
	idHectare INT PRIMARY KEY AUTO_INCREMENT, 
    tamanhoHectare DECIMAL (4,2) not null, 
    tempMinHectare DECIMAL (4,2), -- Como a temperatura vai ser calculada pelo ambiente, acredito que deve ficar armazenado na tabela do hectare
    tempMediaHectare DECIMAL (4,2), -- E por questões do que vai aparecer na dashboard, acho que deve existir campos dividos entre min, media
    tempMaxHectare DECIMAL (4,2), -- e max
    qtdUva INT not null
);

-- UMA VINICULA PODE TER VARIOS HECTARES, MAS UM HECTAR SÓ PODE TER UMA VINICULA --

CREATE TABLE tbUva(
	idUva INT PRIMARY KEY AUTO_INCREMENT,
    especieUva VARCHAR(30), -- Especie/Nome da uva 
    tempUva DECIMAL(4,2), -- TEMPERATURA CORRETA PARA UVA
    precoUva DECIMAL (4,2),
    tempAmadu DATETIME -- tempo para a uva amadurecer
);

-- UM TIPO DE UVA PODE ESTAR EM VARIOS HECTARES, MAS UM HECTARE SÓ PODE TER UM TIPO DE UVA --

CREATE TABLE tbColheita (
	idColheita INT PRIMARY KEY AUTO_INCREMENT, 
    dataColheita DATETIME
);

INSERT INTO tbUsuario VALUES
	(default, 'Carlos', 'carlos@gmail.com', '12345678');
    
INSERT INTO tbVinicula VALUES
	(default, 'Vinhos Fodas', '08151-170', 'Rua Horrivel', 'Bairro Pior', 'São Paulo', 10);
    
INSERT INTO tbHectare VALUES 
	(default, 20.22, 07.05, 09.10, 09.58, 2000);
    
INSERT INTO tbUva VALUES 	
	(default, 'Especie Boa', 09.60, 20.10, '2024-09-11 20:58');
    
SELECT * FROM tbUva;

