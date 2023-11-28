-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`customer` (
  `idcustomer` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postcode` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`salesperson` (
  `idsalesperson` INT NOT NULL,
  `staff_name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idsalesperson`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invnum` INT NULL,
  `invoice_date` INT NULL,
  `car` VARCHAR(45) NULL DEFAULT NULL,
  `customer` VARCHAR(45) NULL DEFAULT NULL,
  `salesperson` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idinvoices`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`cars` (
  `idcars` INT NOT NULL,
  `vin` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `car_year` INT NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `customer_idcustomer` INT NOT NULL,
  `salesperson_idsalesperson` INT NOT NULL,
  `invoices_idinvoices` INT NOT NULL,
  PRIMARY KEY (`idcars`, `customer_idcustomer`, `salesperson_idsalesperson`, `invoices_idinvoices`),
  INDEX `fk_cars_customer_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_cars_salesperson1_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  INDEX `fk_cars_invoices1_idx` (`invoices_idinvoices` ASC) VISIBLE,
  CONSTRAINT `fk_cars_customer`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `coches`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_salesperson1`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `coches`.`salesperson` (`idsalesperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_idinvoices`)
    REFERENCES `coches`.`invoices` (`idinvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
