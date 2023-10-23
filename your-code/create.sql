-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CARS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Customer ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` INT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Customer ID_UNIQUE` (`Customer ID` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salesperson` (
  `ID` INT NOT NULL,
  `Staff ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Staff ID_UNIQUE` (`Staff ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Invoice Number` INT NOT NULL,
  `Date` DATE NULL,
  `Car` INT NOT NULL,
  `Customer` INT NOT NULL,
  `Sales Person` INT NOT NULL,
  PRIMARY KEY (`ID`, `Car`, `Sales Person`, `Customer`),
  INDEX `Customer ID fk1_idx` (`Customer` ASC) VISIBLE,
  INDEX `Car ID_idx` (`Car` ASC) VISIBLE,
  INDEX `SalesPerson ID_idx` (`Sales Person` ASC) VISIBLE,
  UNIQUE INDEX `Invoice Number_UNIQUE` (`Invoice Number` ASC) VISIBLE,
  CONSTRAINT `Customer ID fk1`
    FOREIGN KEY (`Customer`)
    REFERENCES `lab_mysql`.`Customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Car ID`
    FOREIGN KEY (`Car`)
    REFERENCES `lab_mysql`.`CARS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SalesPerson ID`
    FOREIGN KEY (`Sales Person`)
    REFERENCES `lab_mysql`.`Salesperson` (`Staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
