-- Ordenado, apenas basta rodar o SQL

CREATE DATABASE Farmacia;

USE Farmacia;

CREATE TABLE Produto(
    -- CASO HAJA NECESSIDADE ALTERAR FLOAT PARA BIGDECIMAL
    ID_Produto INTEGER NOT NULL PRIMARY KEY,
    NOME_PRODUTO VARCHAR(50) NOT NULL,
    PRECO FLOAT NOT NULL,
    DATA_FAB DATE NOT NULL,
    DATA_VAL DATE NOT NULL,
    PESO FLOAT,
	-- ALTERAR PARA NOT NULL FUTURAMENTE
    IMAGEM_PROD LONGBLOB,
    QUANTIDADE INTEGER NOT NULL
)  engine InnoDB;


CREATE TABLE Estado(
    ID_Estado INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(50) UNIQUE NOT NULL,
    SIGLA VARCHAR(2) UNIQUE NOT NULL
)  engine InnoDB;

CREATE TABLE Cidade(
    ID_Cidade INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NOME VARCHAR(50) UNIQUE NOT NULL,
    ID_Estado INTEGER NOT NULL,
   FOREIGN KEY(ID_Estado) REFERENCES Estado(ID_Estado)
)  engine InnoDB;


CREATE TABLE Pessoa(
    ID_Pessoa INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ID_Cidade INTEGER NOT NULL,
    RUA VARCHAR(65) NOT NULL,
    NUMERO INTEGER NOT NULL,
    BAIRRO VARCHAR(60) NOT NULL,
    DATA_DE_NASCIMENTO DATE,
    FOREIGN KEY(ID_Cidade) REFERENCES Cidade(ID_Cidade) 
)  engine InnoDB;


CREATE TABLE Usuario(
    ID_Usuario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_Pessoa INTEGER NOT NULL,
    NOME_DE_USUARIO VARCHAR(50) UNIQUE NOT NULL,
    EMAIL VARCHAR(60) NOT NULL,
    SENHA VARCHAR(64) NOT NULL,
    FOREIGN KEY(ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
)  engine InnoDB;

CREATE TABLE Funcionario(
    ID_Funcionario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_Pessoa INTEGER NOT NULL,
    DATA_INICIO_EMPREGO DATE NOT NULL,
    FOREIGN KEY(ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
)  engine InnoDB;

CREATE TABLE Item_Venda(
    ID_ItemVenda  INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    ID_Usuario INTEGER NOT NULL,
    ID_Produto INTEGER NOT NULL,
    ID_Funcionario INTEGER NOT NULL,

    FOREIGN KEY(ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY(ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
)  engine InnoDB;

CREATE TABLE Venda(
    ID_Venda INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ID_ItemVenda INTEGER NOT NULL,
    FOREIGN KEY(ID_ItemVenda) REFERENCES Item_Venda(ID_ItemVenda)
)  engine InnoDB;

CREATE TABLE Comprovante(
    ID_Nota INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_Venda INTEGER NOT NULL,
    FOREIGN KEY(ID_Venda) REFERENCES Venda(ID_Venda)
)  engine InnoDB;
