-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Produtos'
-- Produtos da Frutaria
-- ---

DROP TABLE IF EXISTS `Produtos`;
		
CREATE TABLE `Produtos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome do produto` INTEGER NULL DEFAULT NULL,
  `Preço` INTEGER NULL DEFAULT NULL,
  `Estoque` INTEGER NULL DEFAULT NULL,
  `id categoria` INTEGER NULL DEFAULT NULL,
  `Id fornecedor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Produtos da Frutaria';

-- ---
-- Table 'Categorias'
-- 
-- ---

DROP TABLE IF EXISTS `Categorias`;
		
CREATE TABLE `Categorias` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome categoria` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Fornecedor'
-- 
-- ---

DROP TABLE IF EXISTS `Fornecedor`;
		
CREATE TABLE `Fornecedor` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome Fornecedor` INTEGER NULL DEFAULT NULL,
  `Contato` INTEGER NULL DEFAULT NULL,
  `Endereço` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Vendas'
-- 
-- ---

DROP TABLE IF EXISTS `Vendas`;
		
CREATE TABLE `Vendas` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Data da venda` INTEGER NULL DEFAULT NULL,
  `Total da venda` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Venda de produtos'
-- 
-- ---

DROP TABLE IF EXISTS `Venda de produtos`;
		
CREATE TABLE `Venda de produtos` (
  `IdVendas` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `IdProdutos` INTEGER NULL DEFAULT NULL,
  `Quantidade vendida` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ()
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Produtos` ADD FOREIGN KEY (id categoria) REFERENCES `Categorias` (`id`);
ALTER TABLE `Produtos` ADD FOREIGN KEY (Id fornecedor) REFERENCES `Fornecedor` (`id`);
ALTER TABLE `Venda de produtos` ADD FOREIGN KEY (IdVendas) REFERENCES `Vendas` (`id`);
ALTER TABLE `Venda de produtos` ADD FOREIGN KEY (IdProdutos) REFERENCES `Produtos` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Produtos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Categorias` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Fornecedor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Vendas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Venda de produtos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Produtos` (`id`,`Nome do produto`,`Preço`,`Estoque`,`id categoria`,`Id fornecedor`) VALUES
-- ('','','','','','');
-- INSERT INTO `Categorias` (`id`,`Nome categoria`) VALUES
-- ('','');
-- INSERT INTO `Fornecedor` (`id`,`Nome Fornecedor`,`Contato`,`Endereço`) VALUES
-- ('','','','');
-- INSERT INTO `Vendas` (`id`,`Data da venda`,`Total da venda`) VALUES
-- ('','','');
-- INSERT INTO `Venda de produtos` (`IdVendas`,`IdProdutos`,`Quantidade vendida`) VALUES
-- ('','','');