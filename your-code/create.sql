-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_coche
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_coche
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_coche` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_coche` ;

-- -----------------------------------------------------
-- Table `lab_coche`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`customers` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `id_customer` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_coche`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`cars` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `VIN` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` VARCHAR(45) NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_coche`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`salespersons` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `id_sales` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `company` VARCHAR(45) NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `lab_coche`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`invoices` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `id_invoice` VARCHAR(45) NULL DEFAULT NULL,
  `date` VARCHAR(45) NULL DEFAULT NULL,
  `car` VARCHAR(45) NULL DEFAULT NULL,
  `customer` VARCHAR(45) NULL DEFAULT NULL,
  `salesperson` VARCHAR(45) NULL DEFAULT NULL,
  `clientes_id` INT NOT NULL,
  `coche_id` INT NOT NULL,
  `vendedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_facturas_clientes1_idx` (`clientes_id` ASC) VISIBLE,
  INDEX `fk_facturas_coche1_idx` (`coche_id` ASC) VISIBLE,
  INDEX `fk_facturas_vendedor1_idx` (`vendedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `lab_coche`.`customers` (`id`),
  CONSTRAINT `fk_facturas_coche1`
    FOREIGN KEY (`coche_id`)
    REFERENCES `lab_coche`.`cars` (`id`),
  CONSTRAINT `fk_facturas_vendedor1`
    FOREIGN KEY (`vendedor_id`)
    REFERENCES `lab_coche`.`salespersons` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
