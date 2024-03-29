-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/03/2024 às 17:58
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `farmacia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `ID_Cidade` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `ID_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`ID_Cidade`, `NOME`, `ID_Estado`) VALUES
(1, 'Santa Cruz do Rio Pardo', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comprovante`
--

CREATE TABLE `comprovante` (
  `ID_Nota` int(11) NOT NULL,
  `ID_Venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `SIGLA` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`ID_Estado`, `NOME`, `SIGLA`) VALUES
(1, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `ID_Funcionario` int(11) NOT NULL,
  `ID_Pessoa` int(11) NOT NULL,
  `DATA_INICIO_EMPREGO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `ID_ItemVenda` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `ID_Funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `ID_Pessoa` int(11) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `ID_Cidade` int(11) NOT NULL,
  `RUA` varchar(65) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `BAIRRO` varchar(60) NOT NULL,
  `DATA_DE_NASCIMENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`ID_Pessoa`, `CPF`, `NOME`, `ID_Cidade`, `RUA`, `NUMERO`, `BAIRRO`, `DATA_DE_NASCIMENTO`) VALUES
(1, '000.000.000-00', 'admin1', 1, 'Rua Exemplo', 0, 'Bairro Exemplo', '2000-02-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `ID_Produto` int(11) NOT NULL,
  `NOME_PRODUTO` varchar(50) NOT NULL,
  `PRECO` float NOT NULL,
  `DATA_FAB` date NOT NULL,
  `DATA_VAL` date NOT NULL,
  `PESO` float DEFAULT NULL,
  `IMAGEM_PROD` longblob DEFAULT NULL,
  `QUANTIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Pessoa` int(11) NOT NULL,
  `NOME_DE_USUARIO` varchar(50) NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `SENHA` varchar(64) NOT NULL,
  `NIVEL_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `ID_Pessoa`, `NOME_DE_USUARIO`, `EMAIL`, `SENHA`, `NIVEL_USUARIO`) VALUES
(1, 1, 'admin1', 'admin1@example.com', 'admin1', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `ID_Venda` int(11) NOT NULL,
  `ID_ItemVenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`ID_Cidade`),
  ADD UNIQUE KEY `NOME` (`NOME`),
  ADD KEY `ID_Estado` (`ID_Estado`);

--
-- Índices de tabela `comprovante`
--
ALTER TABLE `comprovante`
  ADD PRIMARY KEY (`ID_Nota`),
  ADD KEY `ID_Venda` (`ID_Venda`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`),
  ADD UNIQUE KEY `NOME` (`NOME`),
  ADD UNIQUE KEY `SIGLA` (`SIGLA`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID_Funcionario`),
  ADD KEY `ID_Pessoa` (`ID_Pessoa`);

--
-- Índices de tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`ID_ItemVenda`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Produto` (`ID_Produto`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`ID_Pessoa`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD KEY `ID_Cidade` (`ID_Cidade`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `NOME_DE_USUARIO` (`NOME_DE_USUARIO`),
  ADD KEY `ID_Pessoa` (`ID_Pessoa`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`ID_Venda`),
  ADD KEY `ID_ItemVenda` (`ID_ItemVenda`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `ID_Cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `comprovante`
--
ALTER TABLE `comprovante`
  MODIFY `ID_Nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `ID_Funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `ID_ItemVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `ID_Pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `ID_Venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estado` (`ID_Estado`);

--
-- Restrições para tabelas `comprovante`
--
ALTER TABLE `comprovante`
  ADD CONSTRAINT `comprovante_ibfk_1` FOREIGN KEY (`ID_Venda`) REFERENCES `venda` (`ID_Venda`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `pessoa` (`ID_Pessoa`);

--
-- Restrições para tabelas `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`),
  ADD CONSTRAINT `item_venda_ibfk_3` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionario` (`ID_Funcionario`);

--
-- Restrições para tabelas `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`ID_Cidade`) REFERENCES `cidade` (`ID_Cidade`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `pessoa` (`ID_Pessoa`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`ID_ItemVenda`) REFERENCES `item_venda` (`ID_ItemVenda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
