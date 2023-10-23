-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Cars` (
  `VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Salesperson` (
  `staff_ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `Cars_VIN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff_ID`, `Cars_VIN`),
  INDEX `fk_Salesperson_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Salesperson_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `coches`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Customer` (
  `customer_ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` VARCHAR(45) NULL,
  `Cars_VIN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_ID`, `Cars_VIN`),
  INDEX `fk_Customer_Cars_idx` (`Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Cars`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `coches`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Invoices` (
  `invoice_number` INT NOT NULL,
  `car` VARCHAR(45) NULL,
  `client` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  `Cars_VIN` VARCHAR(45) NOT NULL,
  `Salesperson_staff_ID` INT NOT NULL,
  `Salesperson_Cars_VIN` VARCHAR(45) NOT NULL,
  `Customer_customer_ID` INT NOT NULL,
  `Customer_Cars_VIN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoice_number`, `Cars_VIN`, `Salesperson_staff_ID`, `Salesperson_Cars_VIN`, `Customer_customer_ID`, `Customer_Cars_VIN`),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Salesperson1_idx` (`Salesperson_staff_ID` ASC, `Salesperson_Cars_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Customer1_idx` (`Customer_customer_ID` ASC, `Customer_Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `coches`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salesperson1`
    FOREIGN KEY (`Salesperson_staff_ID` , `Salesperson_Cars_VIN`)
    REFERENCES `coches`.`Salesperson` (`staff_ID` , `Cars_VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customer1`
    FOREIGN KEY (`Customer_customer_ID` , `Customer_Cars_VIN`)
    REFERENCES `coches`.`Customer` (`customer_ID` , `Cars_VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`Customer_has_Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Customer_has_Salesperson` (
  `Customer_customer_ID` INT NOT NULL,
  `Customer_Cars_VIN` VARCHAR(45) NOT NULL,
  `Salesperson_staff_ID` INT NOT NULL,
  PRIMARY KEY (`Customer_customer_ID`, `Customer_Cars_VIN`, `Salesperson_staff_ID`),
  INDEX `fk_Customer_has_Salesperson_Salesperson1_idx` (`Salesperson_staff_ID` ASC) VISIBLE,
  INDEX `fk_Customer_has_Salesperson_Customer1_idx` (`Customer_customer_ID` ASC, `Customer_Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_Salesperson_Customer1`
    FOREIGN KEY (`Customer_customer_ID` , `Customer_Cars_VIN`)
    REFERENCES `coches`.`Customer` (`customer_ID` , `Cars_VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Salesperson_Salesperson1`
    FOREIGN KEY (`Salesperson_staff_ID`)
    REFERENCES `coches`.`Salesperson` (`staff_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
