-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab-cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab-cars` ;

-- -----------------------------------------------------
-- Table `lab-cars`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-cars`.`cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL DEFAULT NULL,
  `Manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `Model` VARCHAR(45) NULL DEFAULT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab-cars`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-cars`.`customers` (
  `ID` INT NOT NULL,
  `Customer ID` VARCHAR(45) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Adress` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State/Province` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Postal` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab-cars`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-cars`.`salesperson` (
  `ID` INT NOT NULL,
  `Staff ID` VARCHAR(45) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab-cars`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-cars`.`invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Car` VARCHAR(45) NULL,
  `Sales Person` VARCHAR(45) NULL,
  `customers_ID` INT NOT NULL,
  `salesperson_ID` INT NOT NULL,
  `cars_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_invoices_customers_idx` (`customers_ID` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_ID` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customers`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab-cars`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_ID`)
    REFERENCES `lab-cars`.`salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_ID`)
    REFERENCES `lab-cars`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
