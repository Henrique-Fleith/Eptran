CREATE DATABASE MeuBancoDeDados;

USE MeuBancoDeDados;

CREATE TABLE Usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, -- Garantir emails únicos
    senha VARCHAR(255) NOT NULL,
    registro DATE NOT NULL DEFAULT CURRENT_DATE, -- Definir data atual como padrão
    tipo_escolaridade VARCHAR(50),
    genero VARCHAR(20),
    data_nascimento DATE,
    CHECK (LENGTH(senha) >= 8) -- Garantir que a senha tenha pelo menos 8 caracteres
);

CREATE INDEX idx_nome_usuario ON Usuario (nome);

CREATE TABLE Atividade (
    atividade_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    tipo_atividade VARCHAR(50) NOT NULL
);

CREATE INDEX idx_nome_atividade ON Atividade (nome);

CREATE TABLE Certificacao (
    certificado_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    criterios TEXT,
    data_emissao DATE NOT NULL,
    data_expiracao DATE NOT NULL CHECK (data_expiracao > data_emissao), -- Garantir que a data de expiração seja posterior à data de emissão
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX idx_nome_certificacao ON Certificacao (nome);

CREATE TABLE Acao (
    acao_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Definir data e hora atual como padrão
    pontuacao INT NOT NULL CHECK (pontuacao >= 0), -- Garantir que a pontuação seja não negativa
    atividade_id INT,
    user_id INT,
    FOREIGN KEY (atividade_id) REFERENCES Atividade(atividade_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX idx_nome_acao ON Acao (nome);



