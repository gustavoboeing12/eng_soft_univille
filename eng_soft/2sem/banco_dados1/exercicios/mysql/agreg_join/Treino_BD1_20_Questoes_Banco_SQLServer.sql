-- BANCO DE DADOS I | BASE PRATICA DAS 20 QUESTOES (SQL SERVER 2016 SP1+)
-- Banco SEPARADO: Treino_BD1_20_Questoes. Nao modifica Aula_DML nem a base da prova.
-- ATENCAO: executar TODO este arquivo novamente RECRIA os objetos deste banco e
-- apaga alteracoes de treino realizadas nele. Salve seu trabalho .sql antes.
-- Cada questao do PDF tem dados INDEPENDENTES; prepare a questao ANTES de executar a solucao.
-- Exemplo no SSMS: USE Treino_BD1_20_Questoes; EXEC dbo.PrepararQuestao 10;
--                         -- agora execute a sua resposta para a questao 10
-- Para explorar o banco completo (resultados diferentes do PDF): EXEC dbo.PrepararQuestao 0;
-- Na questao 09, dbo.Monitoria nao existe de proposito; o aluno devera cria-la.

IF DB_ID(N'Treino_BD1_20_Questoes') IS NULL
BEGIN
    EXEC(N'CREATE DATABASE Treino_BD1_20_Questoes');
END;
GO
USE Treino_BD1_20_Questoes;
GO

-- Esquema 'apoio': guarda os dados originais e os conjuntos de cada questao.
-- O aluno deve escrever suas consultas usando dbo.Aluno, dbo.Turma,
-- dbo.Matricula e dbo.Pagamento, nao as tabelas de apoio.
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'apoio')
    EXEC(N'CREATE SCHEMA apoio');
GO

-- Reinstalacao apenas dentro deste banco de treinamento.
DROP TABLE IF EXISTS dbo.Monitoria;
DROP TABLE IF EXISTS dbo.Pagamento;
DROP TABLE IF EXISTS dbo.Matricula;
DROP TABLE IF EXISTS dbo.Turma;
DROP TABLE IF EXISTS dbo.Aluno;
DROP TABLE IF EXISTS apoio.QuestaoPagamento;
DROP TABLE IF EXISTS apoio.QuestaoMatricula;
DROP TABLE IF EXISTS apoio.QuestaoTurma;
DROP TABLE IF EXISTS apoio.QuestaoAluno;
DROP TABLE IF EXISTS apoio.BasePagamento;
DROP TABLE IF EXISTS apoio.BaseMatricula;
DROP TABLE IF EXISTS apoio.BaseTurma;
DROP TABLE IF EXISTS apoio.BaseAluno;
GO

-- Tabelas dos exercicios: mesmos nomes, colunas, tipos e constraints do PDF.
CREATE TABLE dbo.Aluno (
    ra INT NOT NULL CONSTRAINT PK_Aluno PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL CONSTRAINT CK_Aluno_Idade CHECK (idade BETWEEN 16 AND 100),
    cidade VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL CONSTRAINT UQ_Aluno_Email UNIQUE,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE dbo.Turma (
    id_turma INT NOT NULL CONSTRAINT PK_Turma PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    carga_horaria INT NOT NULL CONSTRAINT CK_Turma_CargaHoraria CHECK (carga_horaria > 0)
);

CREATE TABLE dbo.Matricula (
    id_matricula INT NOT NULL CONSTRAINT PK_Matricula PRIMARY KEY,
    ra_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    nota DECIMAL(4,2) NULL CONSTRAINT CK_Matricula_Nota CHECK (nota BETWEEN 0 AND 10),
    situacao VARCHAR(20) NOT NULL CONSTRAINT DF_Matricula_Situacao DEFAULT ('Ativa'),
    CONSTRAINT UQ_Matricula_Aluno_Turma UNIQUE (ra_aluno, id_turma),
    CONSTRAINT FK_Matricula_Aluno FOREIGN KEY (ra_aluno) REFERENCES dbo.Aluno(ra),
    CONSTRAINT FK_Matricula_Turma FOREIGN KEY (id_turma) REFERENCES dbo.Turma(id_turma)
);

CREATE TABLE dbo.Pagamento (
    id_pagamento INT NOT NULL CONSTRAINT PK_Pagamento PRIMARY KEY,
    ra_aluno INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL CONSTRAINT CK_Pagamento_Valor CHECK (valor > 0),
    data_pagamento DATE NULL,
    situacao VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Pagamento_Aluno FOREIGN KEY (ra_aluno) REFERENCES dbo.Aluno(ra)
);
GO

-- Registros-base preservados em tabelas de apoio para recarga individual.
SELECT TOP (0) * INTO apoio.BaseAluno FROM dbo.Aluno;
SELECT TOP (0) * INTO apoio.BaseTurma FROM dbo.Turma;
SELECT TOP (0) * INTO apoio.BaseMatricula FROM dbo.Matricula;
SELECT TOP (0) * INTO apoio.BasePagamento FROM dbo.Pagamento;
ALTER TABLE apoio.BaseAluno ADD CONSTRAINT PK_BaseAluno PRIMARY KEY (ra);
ALTER TABLE apoio.BaseTurma ADD CONSTRAINT PK_BaseTurma PRIMARY KEY (id_turma);
ALTER TABLE apoio.BaseMatricula ADD CONSTRAINT PK_BaseMatricula PRIMARY KEY (id_matricula);
ALTER TABLE apoio.BasePagamento ADD CONSTRAINT PK_BasePagamento PRIMARY KEY (id_pagamento);
GO
INSERT INTO apoio.BaseAluno (ra, nome, idade, cidade, email, data_nascimento, data_cadastro)
VALUES
    (1001, 'Ana Costa', 22, 'Joinville', 'ANA.COSTA@EXEMPLO.COM', '2004-09-12', '2026-08-01'),
    (1002, 'Bruno Lima', 19, 'Joinville', 'BRUNO@EXEMPLO.COM', '2007-10-03', '2026-08-03'),
    (1003, 'Carla Souza', 25, 'Blumenau', 'CARLA@EXEMPLO.COM', '2001-09-25', '2026-08-07'),
    (1004, 'Daniel Alves', 24, 'Joinville', 'DANIEL@EXEMPLO.COM', '2002-09-08', '2026-08-10'),
    (1005, 'Elisa Martins', 21, 'Jaragua do Sul', 'ELISA@EXEMPLO.COM', '2005-12-21', '2026-08-12'),
    (1006, 'Felipe Rocha', 26, 'Joinville', 'FELIPE@EXEMPLO.COM', '2000-05-19', '2026-08-15'),
    (1007, 'Giovana Dias', 20, 'Joinville', 'GIOVANA@EXEMPLO.COM', '2006-09-21', '2026-08-17');

INSERT INTO apoio.BaseTurma (id_turma, nome, turno, carga_horaria)
VALUES
    (10, 'Banco de Dados I', 'Noite', 80),
    (20, 'Algoritmos', 'Manha', 60),
    (30, 'IA Aplicada', 'Noite', 40),
    (40, 'Redes', 'Tarde', 40);

INSERT INTO apoio.BaseMatricula (id_matricula, ra_aluno, id_turma, data_matricula, nota, situacao)
VALUES
    (2001, 1001, 10, '2026-09-01', '8.50', 'Concluida'),
    (2002, 1002, 10, '2026-09-02', NULL, 'Ativa'),
    (2003, 1003, 20, '2026-09-03', '6.00', 'Concluida'),
    (2004, 1004, 10, '2026-09-04', '7.50', 'Concluida'),
    (2005, 1005, 30, '2026-09-05', '9.00', 'Concluida'),
    (2006, 1001, 20, '2026-09-06', '7.00', 'Concluida'),
    (2007, 1006, 30, '2026-09-07', NULL, 'Ativa'),
    (2008, 1004, 20, '2026-09-08', '5.00', 'Concluida'),
    (2009, 1006, 10, '2026-09-09', '9.00', 'Concluida'),
    (2010, 1005, 10, '2026-09-10', '8.00', 'Concluida'),
    (2011, 1003, 30, '2026-09-11', '8.00', 'Concluida'),
    (2012, 1002, 20, '2026-09-12', NULL, 'Ativa');

INSERT INTO apoio.BasePagamento (id_pagamento, ra_aluno, valor, data_pagamento, situacao)
VALUES
    (9001, 1001, '200.00', '2026-09-12', 'Pago'),
    (9002, 1002, '150.00', NULL, 'Pendente'),
    (9003, 1003, '300.00', '2026-09-15', 'Pago'),
    (9004, 1004, '250.00', '2026-10-03', 'Pago'),
    (9005, 1005, '100.00', '2026-10-04', 'Pago'),
    (9006, 1001, '120.00', '2026-10-06', 'Pago'),
    (9007, 1006, '180.00', NULL, 'Pendente');

CREATE TABLE apoio.QuestaoAluno (
    numero TINYINT NOT NULL,
    ra INT NOT NULL,
    CONSTRAINT PK_QuestaoAluno PRIMARY KEY (numero, ra),
    CONSTRAINT FK_QuestaoAluno_Base FOREIGN KEY (ra) REFERENCES apoio.BaseAluno(ra)
);

INSERT INTO apoio.QuestaoAluno (numero, ra) VALUES
    (0, 1001),
    (0, 1002),
    (0, 1003),
    (0, 1004),
    (0, 1005),
    (0, 1006),
    (0, 1007),
    (1, 1001),
    (1, 1002),
    (1, 1003),
    (1, 1004),
    (1, 1005),
    (1, 1006),
    (2, 1001),
    (2, 1002),
    (2, 1003),
    (2, 1004),
    (2, 1005),
    (2, 1006),
    (2, 1007),
    (3, 1001),
    (3, 1003),
    (3, 1004),
    (4, 1001),
    (4, 1002),
    (4, 1003),
    (4, 1004),
    (4, 1007),
    (5, 1001),
    (5, 1002),
    (5, 1003),
    (5, 1004),
    (5, 1005),
    (5, 1006),
    (6, 1001),
    (6, 1002),
    (6, 1003),
    (6, 1004),
    (6, 1005),
    (6, 1006),
    (7, 1001),
    (8, 1002),
    (8, 1004),
    (8, 1006),
    (10, 1001),
    (10, 1002),
    (10, 1003),
    (10, 1004),
    (10, 1005),
    (10, 1006),
    (11, 1001),
    (11, 1002),
    (11, 1005),
    (11, 1006),
    (12, 1001),
    (12, 1003),
    (12, 1004),
    (12, 1005),
    (12, 1006),
    (13, 1001),
    (13, 1002),
    (13, 1003),
    (13, 1004),
    (13, 1005),
    (14, 1001),
    (14, 1002),
    (14, 1003),
    (14, 1004),
    (14, 1005),
    (15, 1001),
    (15, 1002),
    (15, 1003),
    (15, 1004),
    (15, 1005),
    (15, 1006),
    (16, 1001),
    (16, 1002),
    (16, 1003),
    (16, 1004),
    (16, 1005),
    (16, 1006),
    (17, 1001),
    (17, 1002),
    (17, 1003),
    (17, 1004),
    (17, 1005),
    (17, 1006),
    (18, 1001),
    (18, 1003),
    (18, 1004),
    (18, 1005),
    (18, 1006),
    (19, 1001),
    (19, 1002),
    (19, 1003),
    (19, 1004),
    (19, 1005),
    (19, 1006),
    (20, 1001),
    (20, 1002),
    (20, 1003),
    (20, 1004),
    (20, 1005),
    (20, 1006);

CREATE TABLE apoio.QuestaoTurma (
    numero TINYINT NOT NULL,
    id_turma INT NOT NULL,
    CONSTRAINT PK_QuestaoTurma PRIMARY KEY (numero, id_turma),
    CONSTRAINT FK_QuestaoTurma_Base FOREIGN KEY (id_turma) REFERENCES apoio.BaseTurma(id_turma)
);

INSERT INTO apoio.QuestaoTurma (numero, id_turma) VALUES
    (0, 10),
    (0, 20),
    (0, 30),
    (0, 40),
    (5, 10),
    (5, 20),
    (6, 10),
    (6, 20),
    (6, 30),
    (9, 10),
    (10, 10),
    (10, 20),
    (11, 10),
    (11, 20),
    (11, 30),
    (12, 10),
    (12, 20),
    (12, 30),
    (14, 10),
    (14, 20),
    (14, 30),
    (15, 10),
    (15, 20),
    (15, 30),
    (16, 10),
    (16, 20),
    (16, 30),
    (18, 10),
    (18, 20),
    (18, 30),
    (19, 10),
    (19, 20),
    (19, 30),
    (20, 10),
    (20, 20),
    (20, 30);

CREATE TABLE apoio.QuestaoMatricula (
    numero TINYINT NOT NULL,
    id_matricula INT NOT NULL,
    CONSTRAINT PK_QuestaoMatricula PRIMARY KEY (numero, id_matricula),
    CONSTRAINT FK_QuestaoMatricula_Base FOREIGN KEY (id_matricula) REFERENCES apoio.BaseMatricula(id_matricula)
);

INSERT INTO apoio.QuestaoMatricula (numero, id_matricula) VALUES
    (0, 2001),
    (0, 2002),
    (0, 2003),
    (0, 2004),
    (0, 2005),
    (0, 2006),
    (0, 2007),
    (0, 2008),
    (0, 2009),
    (0, 2010),
    (0, 2011),
    (0, 2012),
    (5, 2001),
    (5, 2002),
    (5, 2003),
    (5, 2004),
    (5, 2009),
    (5, 2010),
    (6, 2001),
    (6, 2002),
    (6, 2003),
    (6, 2004),
    (6, 2005),
    (6, 2006),
    (6, 2007),
    (6, 2008),
    (6, 2009),
    (6, 2010),
    (6, 2011),
    (6, 2012),
    (10, 2001),
    (10, 2002),
    (10, 2003),
    (10, 2004),
    (10, 2009),
    (10, 2010),
    (11, 2001),
    (11, 2002),
    (11, 2005),
    (11, 2007),
    (11, 2012),
    (12, 2001),
    (12, 2003),
    (12, 2004),
    (12, 2005),
    (12, 2006),
    (12, 2007),
    (12, 2009),
    (12, 2010),
    (12, 2011),
    (14, 2001),
    (14, 2002),
    (14, 2003),
    (14, 2004),
    (14, 2005),
    (14, 2006),
    (14, 2008),
    (14, 2010),
    (15, 2001),
    (15, 2002),
    (15, 2003),
    (15, 2004),
    (15, 2005),
    (15, 2006),
    (15, 2007),
    (15, 2008),
    (15, 2009),
    (15, 2010),
    (15, 2011),
    (15, 2012),
    (16, 2001),
    (16, 2002),
    (16, 2003),
    (16, 2004),
    (16, 2005),
    (16, 2006),
    (16, 2007),
    (16, 2008),
    (16, 2009),
    (16, 2010),
    (16, 2011),
    (16, 2012),
    (18, 2001),
    (18, 2003),
    (18, 2004),
    (18, 2005),
    (18, 2006),
    (18, 2007),
    (18, 2009),
    (18, 2010),
    (18, 2011),
    (19, 2001),
    (19, 2002),
    (19, 2003),
    (19, 2004),
    (19, 2005),
    (19, 2006),
    (19, 2007),
    (19, 2008),
    (19, 2009),
    (19, 2010),
    (19, 2011),
    (19, 2012),
    (20, 2001),
    (20, 2002),
    (20, 2003),
    (20, 2004),
    (20, 2005),
    (20, 2006),
    (20, 2007),
    (20, 2008),
    (20, 2009),
    (20, 2010),
    (20, 2011),
    (20, 2012);

CREATE TABLE apoio.QuestaoPagamento (
    numero TINYINT NOT NULL,
    id_pagamento INT NOT NULL,
    CONSTRAINT PK_QuestaoPagamento PRIMARY KEY (numero, id_pagamento),
    CONSTRAINT FK_QuestaoPagamento_Base FOREIGN KEY (id_pagamento) REFERENCES apoio.BasePagamento(id_pagamento)
);

INSERT INTO apoio.QuestaoPagamento (numero, id_pagamento) VALUES
    (0, 9001),
    (0, 9002),
    (0, 9003),
    (0, 9004),
    (0, 9005),
    (0, 9006),
    (0, 9007),
    (8, 9002),
    (8, 9004),
    (8, 9007),
    (13, 9001),
    (13, 9002),
    (13, 9003),
    (13, 9004),
    (13, 9005),
    (13, 9006),
    (17, 9001),
    (17, 9002),
    (17, 9003),
    (17, 9004),
    (17, 9005),
    (17, 9006),
    (17, 9007);

GO

-- Recarrega, para cada questao, APENAS o conjunto ilustrativo do enunciado.
-- Alunos e turmas necessarios para satisfazer FKs podem aparecer como apoio.
-- Nao interferem nas consultas da questao, porque o subconjunto principal e exato.
CREATE OR ALTER PROCEDURE dbo.PrepararQuestao
    @Numero TINYINT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    IF @Numero IS NULL OR @Numero NOT BETWEEN 0 AND 20
    BEGIN
        THROW 50001, 'Informe uma questao entre 1 e 20, ou 0 para a base completa.', 1;
    END;

    -- Para a questao 09, o aluno precisa criar dbo.Monitoria do zero.
    -- Ao preparar outra questao, removemos a tabela criada em um treino anterior.
    IF OBJECT_ID(N'dbo.Monitoria', N'U') IS NOT NULL
        DROP TABLE dbo.Monitoria;

    BEGIN TRY
        BEGIN TRANSACTION;
        DELETE FROM dbo.Pagamento;
        DELETE FROM dbo.Matricula;
        DELETE FROM dbo.Turma;
        DELETE FROM dbo.Aluno;

        INSERT INTO dbo.Aluno (ra, nome, idade, cidade, email, data_nascimento, data_cadastro)
        SELECT a.ra, a.nome, a.idade, a.cidade, a.email, a.data_nascimento, a.data_cadastro
        FROM apoio.BaseAluno AS a
        INNER JOIN apoio.QuestaoAluno AS q ON q.ra = a.ra AND q.numero = @Numero;

        INSERT INTO dbo.Turma (id_turma, nome, turno, carga_horaria)
        SELECT t.id_turma, t.nome, t.turno, t.carga_horaria
        FROM apoio.BaseTurma AS t
        INNER JOIN apoio.QuestaoTurma AS q ON q.id_turma = t.id_turma AND q.numero = @Numero;

        INSERT INTO dbo.Matricula (id_matricula, ra_aluno, id_turma, data_matricula, nota, situacao)
        SELECT m.id_matricula, m.ra_aluno, m.id_turma, m.data_matricula, m.nota, m.situacao
        FROM apoio.BaseMatricula AS m
        INNER JOIN apoio.QuestaoMatricula AS q ON q.id_matricula = m.id_matricula AND q.numero = @Numero;

        INSERT INTO dbo.Pagamento (id_pagamento, ra_aluno, valor, data_pagamento, situacao)
        SELECT p.id_pagamento, p.ra_aluno, p.valor, p.data_pagamento, p.situacao
        FROM apoio.BasePagamento AS p
        INNER JOIN apoio.QuestaoPagamento AS q ON q.id_pagamento = p.id_pagamento AND q.numero = @Numero;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;

    SELECT @Numero AS questao_preparada,
           (SELECT COUNT(*) FROM dbo.Aluno) AS alunos,
           (SELECT COUNT(*) FROM dbo.Turma) AS turmas,
           (SELECT COUNT(*) FROM dbo.Matricula) AS matriculas,
           (SELECT COUNT(*) FROM dbo.Pagamento) AS pagamentos;
END;
GO

-- Deixa o banco pronto para explorar. Para comparar com o PDF, use a questao desejada.
EXEC dbo.PrepararQuestao 0;
GO
