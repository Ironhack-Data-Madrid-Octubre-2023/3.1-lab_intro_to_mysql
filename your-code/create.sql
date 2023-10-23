-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cars` ;

-- -----------------------------------------------------
-- Table `cars`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Invoices` (
  `invoices id` INT NOT NULL,
  `invoice number` INT NULL,
  `date` DATETIME NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  `Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`invoices id`, `Salespersons_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Customers` (
  `id` INT NOT NULL,
  `customer id` INT NULL,
  `name` VARCHAR(45) NULL,
  `phone number` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/ province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/ postal code` INT NULL,
  `Invoices_invoices id` INT NOT NULL,
  `Invoices_Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Invoices_invoices id`, `Invoices_Salespersons_id`),
  INDEX `fk_Customers_Invoices1_idx` (`Invoices_invoices id` ASC, `Invoices_Salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Invoices1`
    FOREIGN KEY (`Invoices_invoices id` , `Invoices_Salespersons_id`)
    REFERENCES `cars`.`Invoices` (`invoices id` , `Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Cars` (
  `cars id` INT NOT NULL,
  `VIN` INT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` DATETIME NULL,
  `color` VARCHAR(45) NULL,
  `Invoices_invoices id` INT NOT NULL,
  `Invoices_Salespersons_id` INT NOT NULL,
  `Customers_id` INT NOT NULL,
  `Customers_Invoices_invoices id` INT NOT NULL,
  `Customers_Invoices_Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`cars id`, `Invoices_invoices id`, `Invoices_Salespersons_id`, `Customers_id`, `Customers_Invoices_invoices id`, `Customers_Invoices_Salespersons_id`),
  INDEX `fk_Cars_Invoices1_idx` (`Invoices_invoices id` ASC, `Invoices_Salespersons_id` ASC) VISIBLE,
  INDEX `fk_Cars_Customers1_idx` (`Customers_id` ASC, `Customers_Invoices_invoices id` ASC, `Customers_Invoices_Salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Invoices1`
    FOREIGN KEY (`Invoices_invoices id` , `Invoices_Salespersons_id`)
    REFERENCES `cars`.`Invoices` (`invoices id` , `Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cars_Customers1`
    FOREIGN KEY (`Customers_id` , `Customers_Invoices_invoices id` , `Customers_Invoices_Salespersons_id`)
    REFERENCES `cars`.`Customers` (`id` , `Invoices_invoices id` , `Invoices_Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Salespersons` (
  `id` INT NOT NULL,
  `staff id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `Invoices_invoices id` INT NOT NULL,
  `Invoices_Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Invoices_invoices id`, `Invoices_Salespersons_id`),
  INDEX `fk_Salespersons_Invoices1_idx` (`Invoices_invoices id` ASC, `Invoices_Salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_Salespersons_Invoices1`
    FOREIGN KEY (`Invoices_invoices id` , `Invoices_Salespersons_id`)
    REFERENCES `cars`.`Invoices` (`invoices id` , `Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Customers_has_Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Customers_has_Salespersons` (
  `Customers_customers id` INT NOT NULL,
  `Salespersons_salespersons id` INT NOT NULL,
  PRIMARY KEY (`Customers_customers id`, `Salespersons_salespersons id`),
  INDEX `fk_Customers_has_Salespersons_Salespersons1_idx` (`Salespersons_salespersons id` ASC) VISIBLE,
  INDEX `fk_Customers_has_Salespersons_Customers_idx` (`Customers_customers id` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_has_Salespersons_Customers`
    FOREIGN KEY (`Customers_customers id`)
    REFERENCES `cars`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Salespersons_Salespersons1`
    FOREIGN KEY (`Salespersons_salespersons id`)
    REFERENCES `cars`.`Salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Cars_has_Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Cars_has_Salespersons` (
  `Cars_cars id` INT NOT NULL,
  `Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`Cars_cars id`, `Salespersons_id`),
  INDEX `fk_Cars_has_Salespersons_Salespersons1_idx` (`Salespersons_id` ASC) VISIBLE,
  INDEX `fk_Cars_has_Salespersons_Cars1_idx` (`Cars_cars id` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_has_Salespersons_Cars1`
    FOREIGN KEY (`Cars_cars id`)
    REFERENCES `cars`.`Cars` (`cars id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cars_has_Salespersons_Salespersons1`
    FOREIGN KEY (`Salespersons_id`)
    REFERENCES `cars`.`Salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
