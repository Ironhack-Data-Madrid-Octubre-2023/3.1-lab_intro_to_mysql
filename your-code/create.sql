-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_sql_cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_sql_cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_sql_cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_sql_cars` ;

-- -----------------------------------------------------
-- Table `lab_sql_cars`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_cars`.`Customers` (
  `ID` INT NOT NULL,
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
  INDEX `Customer ID` (`Customer ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_cars`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_cars`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `VIN` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_cars`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_cars`.`Salesperson` (
  `ID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `Staff ID` (`StaffID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_cars`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_cars`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` INT NULL,
  `Date` DATE NULL,
  `Car` INT NULL,
  `Customer` INT NULL,
  `Sales Person` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Customer ID fk1_idx` (`Customer` ASC) VISIBLE,
  INDEX `Car ID fk2_idx` (`Car` ASC) VISIBLE,
  INDEX `Sales Person ID fk3_idx` (`Sales Person` ASC) VISIBLE,
  CONSTRAINT `Customer ID fk1`
    FOREIGN KEY (`Customer`)
    REFERENCES `lab_sql_cars`.`Customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Car ID fk2`
    FOREIGN KEY (`Car`)
    REFERENCES `lab_sql_cars`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Sales Person ID fk3`
    FOREIGN KEY (`Sales Person`)
    REFERENCES `lab_sql_cars`.`Salesperson` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
