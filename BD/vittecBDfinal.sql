CREATE DATABASE vittecPI;
USE vittecPI; 

-- Dados de cadastro do cliente

CREATE TABLE cadastro ( 
idcadastro INT PRIMARY KEY AUTO_INCREMENT,  
vinicula VARCHAR (45), 
email VARCHAR (45), 
telefone CHAR(20), 
endereco VARCHAR (100), 
CPF_CNPJ_RNE VARCHAR (14),
responsavel VARCHAR (30) 
); 

-- Dados e estrutura da vinicula do cliente 

CREATE TABLE tbVinicula(
idVinicula INT PRIMARY KEY AUTO_INCREMENT, 
nomeVinicula VARCHAR(40), 
cepVinicula CHAR(9) , 
ruaVinicula VARCHAR(40), 
bairroVinicula VARCHAR(40), 
cidadeVinicula VARCHAR(40), 
Lote INT 
); 

-- Dados de estruta do hectare da vinicula do cliente

CREATE TABLE tbHectare(  
idVinHectare INT PRIMARY KEY AUTO_INCREMENT,  
tamanhoHectare INT not null, -- em metros quadrados  
tempMediaHectare DECIMAL (4,2), 
qtdUva INT not null -- toneladas
); 

-- Essa tabela vai conter as informações do tipo de uva específica que o cliente produz

CREATE TABLE tbUva( 
idUva INT PRIMARY KEY AUTO_INCREMENT, 
especieUva VARCHAR(30),
tempUvaMin DECIMAL(4,2), 
tempUvaMax DECIMAL(4,2), 
umiUva FLOAT,
precoUva DECIMAL (6,3), -- em milhões por tonelada
tempAmadu INT -- em meses
); 

-- Exemplo de tabela que aparecerá no Dashboard do cliente, com os dados coletados pelo sensor 

CREATE TABLE viniculaXPTO( 
idVinicula INT PRIMARY KEY AUTO_INCREMENT,
data_hora DATETIME,
temperatura DECIMAL (5,2), 
umidade FLOAT
);

INSERT INTO cadastro VALUES
	(DEFAULT, 'Vinicula XPTO', 'viniculaxpto@gmail.com', '+55 11 12345-6789', 'Rua Haddock Lobo, 595 - Cerqueira César, São Paulo - SP', '12345678901234', 'Fernanda Caramico');
    
INSERT INTO tbVinicula VALUES
	(DEFAULT, 'Vinicula XPTO', '01414-001', 'Rua Haddock Lobo', 'Cerqueira César', 'São Paulo', 30);
    
INSERT INTO tbHectare VALUES
	(DEFAULT, 100, '35.00', 30);
    
INSERT INTO tbUva VALUES
	(DEFAULT, 'Merlot', '15.00', '25.00', '65', '1.1', 4);

INSERT INTO viniculaXPTO VALUES 
	(DEFAULT,'2023-03-17 10:00:00', '34.10', '50'),
    (DEFAULT,'2023-03-17 11:00:00', '31.30', '53'),
    (DEFAULT,'2023-03-17 12:00:00', '29.20', '70');
    
-- select do cliente

SELECT * FROM cadastro;
SELECT telefone FROM cadastro WHERE responsavel LIKE '%Caramico';

SELECT concat('A vinicula ', nomeVinicula, ' está situada na ', ruaVinicula, ', no bairro ', bairroVinicula, ', na cidade de ', cidadeVinicula, ', e possui um total de ', Lote, ' de hectáres.') FROM tbVinicula;

SELECT * FROM tbHectare;

SELECT concat ('A espécie de uva que é cultivada é: ', especieUva, '. Sua temperatura adequada para cultivo, em mínima e máxima, respectivamente, é de ', tempUvaMin, ' e ', tempUvaMax, ' graus. A umidade necessária para o melhor cultivo possível é de ', umiUva, '%. A tonelada da uva está sendo vendida, em média, pelo valor de R$', precoUva, ' milhões e ela demora cerca de ', tempAmadu, ' meses para atingir sua maturação completa.') FROM tbUva;

SELECT * FROM viniculaXPTO;
