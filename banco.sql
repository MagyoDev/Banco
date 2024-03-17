-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/03/2024 às 19:52
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
-- Banco de dados: `banco`
create database banco;
use banco;
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nome`, `email`, `cidade`, `estado`) VALUES
(1, 'João Silva', 'joaosilva@email.com', 'São Paulo', 'SP'),
(2, 'Maria Oliveira', 'mariaoliveira@email.com', 'Rio de Janeiro', 'RJ'),
(3, 'Pedro Souza', 'pedrosouza@email.com', 'Belo Horizonte', 'MG'),
(4, 'Ana Costa', 'anacosta@email.com', 'Salvador', 'BA'),
(5, 'Carlos Santos', 'carloshsantos@email.com', 'Curitiba', 'PR'),
(6, 'Fernanda Lima', 'fernandalim@email.com', 'Brasília', 'DF'),
(7, 'Roberto Dias', 'robertodias@email.com', 'Fortaleza', 'CE'),
(8, 'Eduardo Pereira', 'eduardopereira@email.com', 'Recife', 'PE'),
(9, 'Gabriela Reis', 'gabrielareis@email.com', 'Porto Alegre', 'RS'),
(10, 'Marcelo Campos', 'marcelocampos@email.com', 'Manaus', 'AM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `nome`, `categoria`, `preco`) VALUES
(1, 'Notebook', 'Eletrônicos', 2000.00),
(2, 'Smartphone', 'Eletrônicos', 1500.00),
(3, 'Smartwatch', 'Eletrônicos', 500.00),
(4, 'Camisa', 'Vestuário', 100.00),
(5, 'Calça', 'Vestuário', 150.00),
(6, 'Tênis', 'Vestuário', 200.00),
(7, 'Livro', 'Livros', 50.00),
(8, 'Caneta', 'Papelaria', 10.00),
(9, 'Lápis', 'Papelaria', 5.00),
(10, 'Borracha', 'Papelaria', 2.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `venda_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`venda_id`, `cliente_id`, `produto_id`, `data_venda`, `valor_venda`) VALUES
(1, 1, 1, '2023-01-01', 100.00),
(2, 2, 2, '2023-02-02', 200.00),
(3, 3, 3, '2023-03-03', 300.00),
(4, 4, 1, '2023-04-04', 400.00),
(5, 5, 2, '2023-05-05', 500.00),
(6, 6, 3, '2023-06-06', 600.00),
(7, 7, 1, '2023-07-07', 700.00),
(8, 8, 2, '2023-08-08', 800.00),
(9, 9, 3, '2023-09-09', 900.00),
(10, 10, 1, '2023-10-10', 1000.00);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vendascommeses`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vendascommeses` (
`venda_id` int(11)
,`cliente_id` int(11)
,`produto_id` int(11)
,`mes_descritivo` varchar(69)
,`valor_venda` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vendasdetalhadas`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vendasdetalhadas` (
`venda_id` int(11)
,`nome_cliente` varchar(255)
,`email` varchar(255)
,`cidade` varchar(255)
,`estado` varchar(2)
,`nome_produto` varchar(255)
,`categoria` varchar(255)
,`preco_unitario` decimal(10,2)
,`data_venda` date
,`valor_venda` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_relatorio_vendas`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_relatorio_vendas` (
`venda_id` int(11)
,`nome_cliente` varchar(255)
,`email` varchar(255)
,`cidade` varchar(255)
,`nome_produto` varchar(255)
,`categoria` varchar(255)
,`preco` decimal(10,2)
,`data_venda` date
,`valor_venda` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vendascommeses`
--
DROP TABLE IF EXISTS `vendascommeses`;

CREATE  VIEW `vendascommeses`  AS SELECT `vendas`.`venda_id` AS `venda_id`, `vendas`.`cliente_id` AS `cliente_id`, `vendas`.`produto_id` AS `produto_id`, date_format(`vendas`.`data_venda`,'%M %Y') AS `mes_descritivo`, `vendas`.`valor_venda` AS `valor_venda` FROM `vendas` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vendasdetalhadas`
--
DROP TABLE IF EXISTS `vendasdetalhadas`;

CREATE  VIEW `vendasdetalhadas`  AS SELECT `v`.`venda_id` AS `venda_id`, `c`.`nome` AS `nome_cliente`, `c`.`email` AS `email`, `c`.`cidade` AS `cidade`, `c`.`estado` AS `estado`, `p`.`nome` AS `nome_produto`, `p`.`categoria` AS `categoria`, `p`.`preco` AS `preco_unitario`, `v`.`data_venda` AS `data_venda`, `v`.`valor_venda` AS `valor_venda` FROM ((`vendas` `v` join `clientes` `c` on(`v`.`cliente_id` = `c`.`cliente_id`)) join `produtos` `p` on(`v`.`produto_id` = `p`.`produto_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_relatorio_vendas`
--
DROP TABLE IF EXISTS `vw_relatorio_vendas`;

CREATE  VIEW `vw_relatorio_vendas`  AS SELECT `vendasdetalhadas`.`venda_id` AS `venda_id`, `vendasdetalhadas`.`nome_cliente` AS `nome_cliente`, `vendasdetalhadas`.`email` AS `email`, `vendasdetalhadas`.`cidade` AS `cidade`, `vendasdetalhadas`.`nome_produto` AS `nome_produto`, `vendasdetalhadas`.`categoria` AS `categoria`, `vendasdetalhadas`.`preco_unitario` AS `preco`, `vendasdetalhadas`.`data_venda` AS `data_venda`, `vendasdetalhadas`.`valor_venda` AS `valor_venda` FROM `vendasdetalhadas` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`venda_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `venda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
