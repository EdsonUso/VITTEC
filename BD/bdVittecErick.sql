CREATE DATABASE vittec;

USE vittec;


-- Tabela onde serão inseridos dados sobre a vinicula/empresa contratante do sistema
CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(50) NOT NULL,
    emailCliente VARCHAR(70) NOT NULL,
    telefoneCliente VARCHAR(11),
    preferenciaContatoCliente VARCHAR(8) DEFAULT 'email',
    CONSTRAINT chkPreferenciaContato CHECK (preferenciaContatoCliente IN ('email', 'telefone')),
    responsavelCliente VARCHAR(50) NOT NULL,
    estadoEscritorioCliente CHAR(2) NOT NULL,
    cidadeEscritorioCliente VARCHAR(50) NOT NULL,
    logEscritorioCliente VARCHAR(50) NOT NULL,
    numEscritorioCliente INT NOT NULL
);

-- Tabela sobre o tipo da uva plantada nas parreiras do cliente
CREATE TABLE tipoUva(
    idTipoUva INT PRIMARY KEY AUTO_INCREMENT,
    nomeTipoUva VARCHAR(30) NOT NULL,
    valorQuiloTipoUva DECIMAL(3,2)
);

-- Tabela com dados sobre a plantação do cliente
CREATE TABLE plantacao(
    idPlantacao INT PRIMARY KEY AUTO_INCREMENT,
    nomeTipoUva VARCHAR(30) NOT NULL, -- Futuramente será alterada para chave estrangeira
    nomeCliente VARCHAR(50) NOT NULL, -- Futuramente será alterada para chave estrangeira
    tamanhoPlantacao DECIMAL(6,2),
    qtdParreiras INT NOT NULL
);

-- Tabela com dados sobre doenças que podem afetar a plantação
CREATE TABLE doenca(
    idDoenca INT PRIMARY KEY AUTO_INCREMENT,
    nomeDoenca VARCHAR(20),
    tempDoenca DECIMAL(4,2),
    umidDoenca DECIMAL(4,2),
    caracteristicasDoenca VARCHAR(100)
);

-- Tabela com dados sobre a(s) parreira(s)
CREATE TABLE parreira(
    idParreira INT PRIMARY KEY AUTO_INCREMENT,
    idPlantacao INT NOT NULL, -- Futuramente será alterada para chave estrangeira
    nomeDoenca VARCHAR(20) DEFAULT NULL, -- Futuramente será alterada para chave estrangeira
    tempParreira DECIMAL(4,2) NOT NULL,
    umidParreira DECIMAL(4,2) NOT NULL,
    dataHoraLeituraParreira DATETIME NOT NULL
);

-- Inserção de dados na tabela cliente
INSERT INTO cliente (nomeCliente, emailCliente, telefoneCliente, preferenciaContatoCliente, responsavelCliente, estadoEscritorioCliente, cidadeEscritorioCliente, logEscritorioCliente, numEscritorioCliente) 
VALUES  ('Vinícola XYZ', 'vinicolaxyz@example.com', '12345678900', 'email', 'João Silva', 'SP', 'São Paulo', 'Rua Principal', 123),
        ('Vinícola ABC', 'vinicolaabc@example.com', '9876543210', 'telefone', 'Maria Oliveira', 'RS', 'Porto Alegre', 'Rua Secundária', 456),
        ('Vinícola DEF', 'vinicoladef@example.com', '5554443333', 'telefone', 'Pedro Santos', 'SP', 'Campinas', 'Avenida Principal', 789);

-- Retorna os meios de contatos do cliente, junto do meio de contato preferido
SELECT emailCliente, telefoneCliente, preferenciaContatoCliente as "Meio de contato preferido" FROM cliente;

-- Inserção de dados na tabela de tipos de uva
INSERT INTO tipoUva (nomeTipoUva, valorQuiloTipoUva) 
VALUES ('Cabernet Sauvignon', 5.50),
       ('Merlot', 4.75),
       ('Chardonnay', 6.20);

-- Seleciona os nomes dos tipos de uva registrados no sistema
SELECT nomeTipoUva FROM tipoUva;

-- Inserção de dados na tabela de plantações
INSERT INTO plantacao (nomeTipoUva, nomeCliente, tamanhoPlantacao, qtdParreiras) 
VALUES ('Cabernet Sauvignon', 'Vinícola XYZ', 500.00, 1000),
       ('Merlot', 'Vinícola XYZ', 300.00, 600);

-- Seleciona o identificador da plantação, junto do vinicola dona da mesma
SELECT idPlantacao, nomeCliente FROM plantacao;

-- Inserção de dados na tabela de doenças 
INSERT INTO doenca (nomeDoenca, tempDoenca, umidDoenca, caracteristicasDoenca) 
VALUES ('Míldio', 25.5, 70.0, 'Manchas nas folhas'),
       ('Oídio', 28.0, 65.0, 'Pó branco nas folhas');

-- Seleciona o nome das doenças cadastradas, junto de suas caracteristicas
SELECT nomeDoenca, caracteristicasDoenca FROM doenca;

-- Inserção de dados na tabela das parreiras
INSERT INTO parreira (idPlantacao, nomeDoenca, tempParreira, umidParreira, dataHoraLeituraParreira) 
VALUES (1, 'Míldio', 24.0, 75.0, '2024-03-20 10:00:00'),
       (2, NULL, 26.5, 68.0, '2024-03-20 10:15:00');

-- Seleciona o identificador, temperatura e umidade da parreira, junto da data e horário em que a leitura foi realizada
SELECT idParreira, tempParreira, umidParreira, dataHoraLeituraParreira FROM parreira;