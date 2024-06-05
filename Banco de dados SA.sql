CREATE DATABASE MeuBancoDeDados;

USE MeuBancoDeDados;

CREATE TABLE Usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    registro DATE NOT NULL,
    tipo_escolaridade VARCHAR(50),
    genero VARCHAR(20),
    data_nascimento DATE
);

CREATE TABLE Atividade (
    atividade_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    tipo_atividade VARCHAR(50) NOT NULL
);

CREATE TABLE Certificação (
    certificado_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    criterios TEXT,
    data_emissao DATE NOT NULL,
    data_expiracao DATE NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

CREATE TABLE Ação (
    acao_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_hora DATETIME NOT NULL,
    pontuacao INT NOT NULL,
    atividade_id INT,
    user_id INT,
    FOREIGN KEY (atividade_id) REFERENCES Atividade(atividade_id),
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);



