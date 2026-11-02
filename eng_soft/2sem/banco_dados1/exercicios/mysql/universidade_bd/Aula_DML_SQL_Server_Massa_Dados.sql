-- =============================================================
-- BANCO DE DADOS I | MASSA DE DADOS PARA PRATICAR DML | SQL SERVER
-- Compativel com SQL Server 2016+ e SSMS.
-- Base INDEPENDENTE: nao altera o banco Aula_Integridade.
-- ATENCAO: executar novamente RECRIA as 3 tabelas de Aula_DML.
--              Perdera mudancas feitas na base de treinamento.
-- =============================================================

-- 1. CRIAR BANCO (caso nao exista)
IF DB_ID(N'Aula_DML') IS NULL
BEGIN
    EXEC(N'CREATE DATABASE Aula_DML');
END;
GO

USE Aula_DML;
GO

-- 2. LIMPAR APENAS AS TABELAS DE TREINAMENTO
-- Ordem importa: Matricula depende de Aluno e Turma.
DROP TABLE IF EXISTS dbo.Matricula;
DROP TABLE IF EXISTS dbo.Turma;
DROP TABLE IF EXISTS dbo.Aluno;
GO

-- 3. RECRIAR TABELAS (mesmo esquema da aula de integridade)
CREATE TABLE dbo.Aluno (
    ra INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL,
    email VARCHAR(150) NOT NULL,
    data_cadastro DATE NOT NULL
        CONSTRAINT DF_Aluno_Data DEFAULT (CONVERT(DATE, GETDATE())),
    CONSTRAINT PK_Aluno PRIMARY KEY (ra),
    CONSTRAINT UQ_Aluno_Email UNIQUE (email),
    CONSTRAINT CK_Aluno_Idade CHECK (idade >= 0)
);

CREATE TABLE dbo.Turma (
    id_turma INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Turma PRIMARY KEY (id_turma)
);

CREATE TABLE dbo.Matricula (
    ra_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nota DECIMAL(4,2) NULL,
    CONSTRAINT PK_Matricula PRIMARY KEY (ra_aluno, id_turma),
    CONSTRAINT FK_Matricula_Aluno FOREIGN KEY (ra_aluno)
        REFERENCES dbo.Aluno(ra),
    CONSTRAINT FK_Matricula_Turma FOREIGN KEY (id_turma)
        REFERENCES dbo.Turma(id_turma),
    CONSTRAINT CK_Matricula_Nota CHECK (nota BETWEEN 0 AND 10)
);
GO

-- 4. MASSA DE ALUNOS (30 alunos; alguns sem matricula)
-- data_cadastro varia entre 2025 e 2026 para exercicios com datas.
INSERT INTO dbo.Aluno (ra, nome, idade, email, data_cadastro)
VALUES
    (2001, 'Ana Lima', 20, 'ana.lima@universidade.edu.br', '2025-03-04'),
    (2002, 'Pedro Souza', 22, 'pedro.souza@universidade.edu.br', '2025-05-07'),
    (2003, 'Carla Mendes', 19, 'carla.mendes@universidade.edu.br', '2025-07-10'),
    (2004, 'Bruno Oliveira', 24, 'bruno.oliveira@universidade.edu.br', '2025-09-13'),
    (2005, 'Mariana Costa', 21, 'mariana.costa@universidade.edu.br', '2025-11-16'),
    (2006, 'Lucas Ferreira', 23, 'lucas.ferreira@universidade.edu.br', '2025-01-19'),
    (2007, 'Julia Santos', 20, 'julia.santos@universidade.edu.br', '2025-03-22'),
    (2008, 'Rafael Martins', 26, 'rafael.martins@universidade.edu.br', '2025-05-25'),
    (2009, 'Beatriz Almeida', 18, 'beatriz.almeida@universidade.edu.br', '2025-07-02'),
    (2010, 'Gabriel Ribeiro', 25, 'gabriel.ribeiro@universidade.edu.br', '2025-09-05'),
    (2011, 'Camila Rocha', 22, 'camila.rocha@universidade.edu.br', '2025-11-08'),
    (2012, 'Felipe Barbosa', 27, 'felipe.barbosa@universidade.edu.br', '2025-01-11'),
    (2013, 'Larissa Gomes', 21, 'larissa.gomes@universidade.edu.br', '2026-09-14'),
    (2014, 'Mateus Carvalho', 24, 'mateus.carvalho@universidade.edu.br', '2026-02-17'),
    (2015, 'Isabela Nunes', 19, 'isabela.nunes@universidade.edu.br', '2026-04-20'),
    (2016, 'Thiago Pereira', 23, 'thiago.pereira@universidade.edu.br', '2026-06-23'),
    (2017, 'Amanda Dias', 20, 'amanda.dias@universidade.edu.br', '2026-08-26'),
    (2018, 'Diego Castro', 28, 'diego.castro@universidade.edu.br', '2026-01-03'),
    (2019, 'Fernanda Lopes', 22, 'fernanda.lopes@universidade.edu.br', '2026-03-06'),
    (2020, 'Henrique Araujo', 26, 'henrique.araujo@universidade.edu.br', '2026-05-09'),
    (2021, 'Patricia Moreira', 29, 'patricia.moreira@universidade.edu.br', '2026-07-12'),
    (2022, 'Eduardo Lima', 21, 'eduardo.lima@universidade.edu.br', '2026-09-15'),
    (2023, 'Bianca Freitas', 24, 'bianca.freitas@universidade.edu.br', '2026-02-18'),
    (2024, 'Vinicius Teixeira', 25, 'vinicius.teixeira@universidade.edu.br', '2026-04-21'),
    (2025, 'Sofia Cardoso', 18, 'sofia.cardoso@universidade.edu.br', '2026-06-24'),
    (2026, 'Daniel Batista', 30, 'daniel.batista@universidade.edu.br', '2026-08-01'),
    (2027, 'Leticia Farias', 20, 'leticia.farias@universidade.edu.br', '2026-01-04'),
    (2028, 'Gustavo Neves', 23, 'gustavo.neves@universidade.edu.br', '2026-03-07'),
    (2029, 'Natalia Vieira', 22, 'natalia.vieira@universidade.edu.br', '2026-05-10'),
    (2030, 'Caio Rodrigues', 19, 'caio.rodrigues@universidade.edu.br', '2026-07-13');

-- 5. MASSA DE TURMAS (8 turmas; a turma 80 nao possui matriculas)
INSERT INTO dbo.Turma (id_turma, nome)
VALUES
    (10, 'Banco de Dados I'),
    (20, 'Algoritmos'),
    (30, 'Engenharia de Software'),
    (40, 'Desenvolvimento Web'),
    (50, 'Fundamentos de IA'),
    (60, 'Banco de Dados II'),
    (70, 'Arquitetura de Software'),
    (80, 'Seguranca da Informacao');

-- 6. MASSA DE MATRICULAS (notas altas, baixas e NULL)
-- Cada par (ra_aluno, id_turma) e unico.
INSERT INTO dbo.Matricula (ra_aluno, id_turma, nota)
VALUES
    (2001, 10, 9.50),
    (2001, 40, 7.00),
    (2002, 20, NULL),
    (2002, 50, 9.00),
    (2002, 70, 6.00),
    (2003, 30, 5.00),
    (2003, 60, 8.00),
    (2004, 40, 3.00),
    (2004, 70, 7.50),
    (2004, 20, 8.75),
    (2005, 50, NULL),
    (2005, 10, 5.50),
    (2005, 40, 3.00),
    (2006, 60, 4.00),
    (2006, 20, 6.50),
    (2006, 40, NULL),
    (2007, 70, 7.00),
    (2007, 30, 9.50),
    (2008, 10, 9.00),
    (2008, 40, 6.00),
    (2008, 60, 7.00),
    (2009, 20, 8.00),
    (2009, 50, 10.00),
    (2010, 30, 7.50),
    (2010, 60, 8.75),
    (2010, 10, 8.00),
    (2010, 20, 10.00),
    (2011, 40, 5.50),
    (2011, 70, 3.00),
    (2012, 50, 6.50),
    (2012, 10, NULL),
    (2012, 30, 5.50),
    (2013, 60, 9.50),
    (2013, 20, 4.00),
    (2014, 70, 6.00),
    (2014, 30, 7.00),
    (2014, 50, 9.50),
    (2015, 10, 10.00),
    (2015, 40, 9.00),
    (2015, 70, 6.00),
    (2016, 20, 8.75),
    (2016, 50, 8.00),
    (2016, 70, 10.00),
    (2017, 30, 3.00),
    (2017, 60, 7.50),
    (2018, 40, NULL),
    (2018, 70, 5.50),
    (2018, 20, 3.00),
    (2019, 50, 4.00),
    (2019, 10, 6.50),
    (2020, 60, 7.00),
    (2020, 20, 9.50),
    (2020, 40, 4.00),
    (2020, 50, 6.50),
    (2021, 70, 9.00),
    (2021, 30, 6.00),
    (2022, 10, 8.00),
    (2022, 40, 10.00),
    (2022, 60, 9.00),
    (2023, 20, 7.50),
    (2023, 50, 8.75),
    (2024, 30, 5.50),
    (2024, 60, 3.00),
    (2024, 10, 7.50),
    (2025, 40, 6.50),
    (2025, 70, NULL),
    (2025, 30, 5.50),
    (2026, 50, 9.50),
    (2026, 10, 4.00),
    (2026, 30, 6.50);

-- 7. CONFERENCIA DA MASSA
SELECT COUNT(*) AS total_alunos FROM dbo.Aluno;
SELECT COUNT(*) AS total_turmas FROM dbo.Turma;
SELECT COUNT(*) AS total_matriculas FROM dbo.Matricula;
SELECT COUNT(*) AS matriculas_sem_nota
FROM dbo.Matricula WHERE nota IS NULL;

-- Consulta de exemplo: alunos, turmas e notas
SELECT a.ra, a.nome AS aluno, t.nome AS turma, m.nota
FROM dbo.Matricula AS m
INNER JOIN dbo.Aluno AS a ON a.ra = m.ra_aluno
INNER JOIN dbo.Turma AS t ON t.id_turma = m.id_turma
ORDER BY a.nome, t.nome;

-- FIM DA PREPARACAO.
-- Para praticar UPDATE/DELETE, use o outro arquivo de exercicios.
