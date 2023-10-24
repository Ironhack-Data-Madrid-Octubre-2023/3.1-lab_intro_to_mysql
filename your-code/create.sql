USE lab_mysql;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `carspkID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year_` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`carspkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customers` (
  `customerpkID` INT NOT NULL,
  `customer_ID` VARCHAR(5) NULL,
  `name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip_postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`customerpkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salespersons` (
  `salespersonspkID` INT NOT NULL,
  `staff_ID` VARCHAR(10) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salespersonspkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `invoice_ID` INT NULL,
  `invoicepkID` INT NOT NULL,
  `invoice_number` VARCHAR(45) NULL,
  `date` DATE NULL,
  `cars_carspkID` INT NOT NULL,
  `customers_customerpkID` INT NOT NULL,
  `salespersons_salespersonspkID` INT NOT NULL,
  PRIMARY KEY (`invoicepkID`, `cars_carspkID`, `customers_customerpkID`, `salespersons_salespersonspkID`),
  INDEX `fk_invoices_cars_idx` (`cars_carspkID` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_salespersonspkID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_customerpkID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_carspkID`)
    REFERENCES `lab_mysql`.`cars` (`carspkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_salespersonspkID`)
    REFERENCES `lab_mysql`.`salespersons` (`salespersonspkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customerpkID`)
    REFERENCES `lab_mysql`.`customers` (`customerpkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



--CHANGES MADE LATER:
ALTER TABLE `lab_mysql`.`invoices` 
DROP COLUMN `invoice_ID`;
