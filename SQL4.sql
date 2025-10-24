CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;


-- Tabela de Médicos
CREATE TABLE IF NOT EXISTS MEDICOS (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE
);

-- Tabela de Pacientes
CREATE TABLE IF NOT EXISTS PACIENTES (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

-- Tabela de Consultas
CREATE TABLE IF NOT EXISTS CONSULTAS (
    id_consulta INT PRIMARY KEY,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    data_consulta DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES MEDICOS(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente)
);

-- Inserindo Médicos
INSERT INTO MEDICOS (id_medico, nome, especialidade, crm) VALUES
(1, 'Dra. Ana Silva', 'Cardiologia', 'CRM-12345'),
(2, 'Dr. Carlos Santos', 'Ortopedia', 'CRM-67890'),
(3, 'Dra. Marina Costa', 'Pediatria', 'CRM-54321'),
(4, 'Dr. Roberto Alves', 'Neurologia', 'CRM-98765'),
(5, 'Dra. Beatriz Mendes', 'Cardiologia', 'CRM-11111'),
(6, 'Dr. Fernando Lima', 'Ortopedia', 'CRM-22222'),
(7, 'Dra. Juliana Rocha', 'Dermatologia', 'CRM-33333');

-- Inserindo Pacientes
INSERT INTO PACIENTES (id_paciente, nome, data_nascimento, cidade) VALUES
(1, 'João Oliveira', '1985-03-15', 'São Paulo'),
(2, 'Maria Souza', '1990-07-22', 'Campinas'),
(3, 'Pedro Lima', '2010-11-30', 'Santos'),
(4, 'Ana Paula Ferreira', '1975-05-10', 'São Paulo'),
(5, 'Carlos Eduardo Silva', '2005-12-01', 'Rio de Janeiro'),
(6, 'Luciana Santos', '1988-09-18', 'São Paulo'),
(7, 'Miguel Costa', '2015-02-28', 'Guarulhos'),
(8, 'Patricia Oliveira', '1992-04-14', 'Campinas'),
(9, 'Rafael Martins', '1980-08-25', 'São Paulo'),
(10, 'Fernanda Almeida', '1995-11-07', 'Santos');

-- Inserindo Consultas
INSERT INTO CONSULTAS (id_consulta, id_medico, id_paciente, data_consulta, valor) VALUES
(1, 1, 1, '2024-10-15', 350.00),
(2, 3, 3, '2024-10-16', 280.00),
(3, 1, 2, '2024-10-17', 350.00),
(4, 2, 4, '2024-10-18', 400.00),
(5, 5, 6, '2024-10-19', 350.00),
(6, 1, 9, '2024-10-20', 350.00),
(7, 4, 5, '2024-10-21', 450.00),
(8, 6, 8, '2024-10-22', 400.00),
(9, 7, 10, '2024-10-23', 300.00),
(10, 3, 7, '2024-10-24', 280.00),
(11, 5, 1, '2024-10-25', 350.00),
(12, 2, 2, '2024-10-26', 400.00),
(13, 1, 4, '2024-10-27', 350.00),
(14, 7, 6, '2024-10-28', 300.00),
(15, 4, 9, '2024-10-29', 450.00);


-- 1. Crie um query para retorna apenas o Nome do paciente, nome do médico e data da consulta

SELECT 
    p.nome AS Nome_Paciente,
    m.nome AS Nome_Medico,
    c.data_consulta AS Data_Consulta
FROM 
    CONSULTAS c
JOIN 
    PACIENTES p ON c.id_paciente = p.id_paciente
JOIN 
    MEDICOS m ON c.id_medico = m.id_medico;

-- 2. *Crie uma query para retorna apenas Pacientes de São Paulo com cardiologistas*

SELECT 
    p.nome AS Nome_Paciente,
    p.cidade AS Cidade,
    m.nome AS Nome_Medico,
    m.especialidade AS Especialidade,
    c.data_consulta AS Data_Consulta
FROM 
    CONSULTAS c
JOIN 
    PACIENTES p ON c.id_paciente = p.id_paciente
JOIN 
    MEDICOS m ON c.id_medico = m.id_medico
WHERE 
    p.cidade = 'São Paulo'
    AND m.especialidade = 'Cardiologia';

-- ### Desafio

-- 1. *Qual foi a consulta mais cara realizada? (*Mostrar paciente, médico, especialidade e valor)

SELECT 
    p.nome AS Nome_Paciente,
    m.nome AS Nome_Medico,
    m.especialidade AS Especialidade,
    c.valor AS Valor
FROM 
    CONSULTAS c
JOIN 
    PACIENTES p ON c.id_paciente = p.id_paciente
JOIN 
    MEDICOS m ON c.id_medico = m.id_medico
WHERE 
    c.valor = (SELECT MAX(valor) FROM CONSULTAS);

-- 2. Consultas do último mês com todos os detalhe
SELECT 
    c.id_consulta AS ID_Consulta,
    p.nome AS Nome_Paciente,
    p.cidade AS Cidade,
    m.nome AS Nome_Medico,
    m.especialidade AS Especialidade,
    m.crm AS CRM,
    c.data_consulta AS Data_Consulta,
    c.valor AS Valor
FROM 
    CONSULTAS c
JOIN 
    PACIENTES p ON c.id_paciente = p.id_paciente
JOIN 
    MEDICOS m ON c.id_medico = m.id_medico
WHERE 
    c.data_consulta >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY 
    c.data_consulta DESC;