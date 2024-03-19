CREATE DATABASE vittec;

USE vittec;

CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(50) NOT NULL,
    emailCliente VARCHAR(70) NOT NULL,
    telefoneCliente VARCHAR(11),
    preferenciaContatoCliente VARCHAR(8) DEFAULT 'email',
    CONSTRAINT chkPreferenciaContato CHECK (preferenciaContatoCliente IN ('email', 'telefone'))
    responsavelCliente VARCHAR(50) NOT NULL
    estadoEscritorioCliente CHAR(2) NOT NULL,
    cidadeEscritorioCliente VARCHAR(50) NOT NULL,
    logEscritorioCliente VARCHAR(50) NOT NULL,
    numEscritorioCliente INT NOT NULL
);

CREATE TABLE tipoUva(
    idTipoUva INT PRIMARY KEY AUTO_INCREMENT,
    nomeTipoUva VARCHAR(30) NOT NULL,
    valorQuiloTipoUva DECIMAL(3,2)
);

CREATE TABLE plantacao(
    idPlantacao INT PRIMARY KEY AUTO_INCREMENT,
    nomeTipoUva VARCHAR(30) NOT NULL, --Futuramente será alterada para chave estrangeira
    nomeCliente VARCHAR(50) NOT NULL --Futuramente será alterada para chave estrangeira
    tamanhoPlantacao DECIMAL(6,2)
    qtdParreiras INT NOT NULL
);

CREATE TABLE doenca(
    idDoenca INT PRIMARY KEY AUTO_INCREMENT,
    nomeDoenca VARCHAR(20),
    tempDoenca DECIMAL(4,2),
    umidDoenca DECIMAL(4,2)
    caracteristicasDoenca VARCHAR(100)
);

CREATE TABLE parreira(
    idParreira INT PRIMARY KEY AUTO_INCREMENT,
    idPlantacao INT NOT NULL, --Futuramente será alterada para chave estrangeira
    nomeDoenca VARCHAR(20) DEFAULT NULL --Futuramente será alterada para chave estrangeira
    tempParreira DECIMAL(4,2) NOT NULL,
    umidParreira DECIMAL(4,2) NOT NULL,
    dataHoraLeituraParreira DATETIME NOT NULL
);