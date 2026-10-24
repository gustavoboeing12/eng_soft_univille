-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 24/10/2026 às 20:14
-- Versão do servidor: 8.0.42
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `universidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `ra` int NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `idade` int NOT NULL,
  `email` varchar(35) COLLATE utf8mb4_general_ci NOT NULL,
  `data_cad` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`ra`),
  UNIQUE KEY `UQ_email_aluno` (`email`)
) ;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`ra`, `nome`, `idade`, `email`, `data_cad`) VALUES
(1001, 'Cassio', 21, 'richamelio@gmail.com', '2026-10-20'),
(1002, 'Ana', 17, 'Ana@gmail.com', '2026-10-21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `nota` decimal(10,0) NOT NULL,
  `id_turma` int NOT NULL,
  `ra` int NOT NULL,
  PRIMARY KEY (`ra`,`id_turma`),
  KEY `fk_id_turma` (`id_turma`)
) ;

--
-- Despejando dados para a tabela `matricula`
--

INSERT INTO `matricula` (`nota`, `id_turma`, `ra`) VALUES
(9, 1234, 1001),
(9, 1234, 1002);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `id_turma` int NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`id_turma`, `nome`) VALUES
(1234, 'Banco de dados 1'),
(1235, 'Algoritmos 1');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_id_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`),
  ADD CONSTRAINT `fk_ra` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
