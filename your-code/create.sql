-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_dealership_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_dealership_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_dealership_company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_dealership_company` ;

-- -----------------------------------------------------
-- Table `car_dealership_company`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `Invoice ID` VARCHAR(45) NULL,
  `Invoice number` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Car` VARCHAR(45) NULL,
  `Customer` VARCHAR(45) NULL,
  `salesperson related to each car sale` VARCHAR(45) NULL,
  PRIMARY KEY (`idInvoices`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Cars` (
  `idCars` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Invoices_idInvoices` INT NOT NULL,
  PRIMARY KEY (`idCars`, `Invoices_idInvoices`),
  INDEX `fk_Cars_Invoices1_idx` (`Invoices_idInvoices` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices`)
    REFERENCES `car_dealership_company`.`Invoices` (`idInvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Customers` (
  `idCustomers` INT NOT NULL,
  ` The customer ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Phone number` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Zip/postal` VARCHAR(45) NULL,
  `Invoices_idInvoices` INT NOT NULL,
  PRIMARY KEY (`idCustomers`, `Invoices_idInvoices`),
  INDEX `fk_Customers_Invoices1_idx` (`Invoices_idInvoices` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices`)
    REFERENCES `car_dealership_company`.`Invoices` (`idInvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Salespersons` (
  `idSalespersons` INT NOT NULL,
  `Staff ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  `Invoices_idInvoices` INT NOT NULL,
  PRIMARY KEY (`idSalespersons`, `Invoices_idInvoices`),
  INDEX `fk_Salespersons_Invoices1_idx` (`Invoices_idInvoices` ASC) VISIBLE,
  CONSTRAINT `fk_Salespersons_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices`)
    REFERENCES `car_dealership_company`.`Invoices` (`idInvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
