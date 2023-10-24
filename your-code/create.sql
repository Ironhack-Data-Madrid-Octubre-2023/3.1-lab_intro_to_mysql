-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema carcompany
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema carcompany
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carcompany` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `carcompany` ;

-- -----------------------------------------------------
-- Table `carcompany`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`cars` (
  `idcars` INT NOT NULL,
  `VIN` CHAR(17) NULL,
  `manufacturer` VARCHAR(15) NULL,
  `model` VARCHAR(20) NULL,
  `year` YEAR(4) NULL,
  `colour` VARCHAR(10) NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`salespeople`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`salespeople` (
  `idsalespeople` INT NOT NULL,
  `staffid` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idsalespeople`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`customers` (
  `idcustomers` INT NOT NULL,
  `customerid` VARCHAR(45) NULL,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `address` VARCHAR(150) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` VARCHAR(15) NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invoicenumber` VARCHAR(45) NULL,
  `date` VARCHAR(15) NULL,
  `cars_idcars` INT NOT NULL,
  `salespeople_idsalespeople` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idinvoices`, `cars_idcars`, `salespeople_idsalespeople`, `customers_idcustomers`),
  INDEX `fk_invoices_cars_idx` (`cars_idcars` ASC) VISIBLE,
  INDEX `fk_invoices_salespeople1_idx` (`salespeople_idsalespeople` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `carcompany`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespeople1`
    FOREIGN KEY (`salespeople_idsalespeople`)
    REFERENCES `carcompany`.`salespeople` (`idsalespeople`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `carcompany`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

