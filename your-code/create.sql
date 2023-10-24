-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars_db` DEFAULT CHARACTER SET latin1 ;
USE `cars_db` ;

-- -----------------------------------------------------
-- Table `cars_db`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Cars` (
  `idCars` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Customers` (
  `idCustomers` INT NOT NULL,
  `cust_number` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `ZIP` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Salespersons` (
  `idSales` INT NOT NULL,
  `staff_number` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idSales`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `invoice_number` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `Cars_idCars` INT NOT NULL,
  `Customers_idCustomers` INT NOT NULL,
  `Salespersons_idSales` INT NOT NULL,
  PRIMARY KEY (`idInvoices`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_idCars` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_idSales` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idCustomers` ASC),
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_idCars`)
    REFERENCES `cars_db`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_idSales`)
    REFERENCES `cars_db`.`Salespersons` (`idSales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `cars_db`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
