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
-- Table `lab_coche`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`Vendedor` (
  `id` INT NOT NULL,
  `ID_Vendedor` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Empresa` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coche`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`Clientes` (
  `id` INT NOT NULL,
  `ID cliente` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  `CodigoPostal` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coche`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`Facturas` (
  `id` INT NOT NULL,
  `NumeroFactura` VARCHAR(45) NULL,
  `Fecha` VARCHAR(45) NULL,
  `Coche` VARCHAR(45) NULL,
  `Cliente` VARCHAR(45) NULL,
  `Vendedor` VARCHAR(45) NULL,
  `Vendedor_id` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Vendedor_id`, `Clientes_id`),
  INDEX `fk_Facturas_Vendedor1_idx` (`Vendedor_id` ASC) VISIBLE,
  INDEX `fk_Facturas_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Vendedor1`
    FOREIGN KEY (`Vendedor_id`)
    REFERENCES `lab_coche`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facturas_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `lab_coche`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coche`.`Coche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coche`.`Coche` (
  `id` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Fabricante` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Año` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Facturas_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `Facturas_id1`),
  INDEX `fk_Coche_Facturas1_idx` (`Facturas_id1` ASC) VISIBLE,
  CONSTRAINT `fk_Coche_Facturas1`
    FOREIGN KEY (`Facturas_id1`)
    REFERENCES `lab_coche`.`Facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


