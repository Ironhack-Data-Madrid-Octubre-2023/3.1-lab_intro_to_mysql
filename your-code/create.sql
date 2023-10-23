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
  `invoices_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_number` INT NULL,
  `date` DATETIME NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  PRIMARY KEY (`invoices_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Customers` (
  `customers_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `customer_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/ province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/ postal_code` INT NULL,
  `Invoices_invoices_id` INT NOT NULL,
  PRIMARY KEY (`customers_id`, `Invoices_invoices_id`),
  INDEX `fk_Customers_Invoices1_idx` (`Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Invoices1`
    FOREIGN KEY (`Invoices_invoices_id`)
    REFERENCES `cars`.`Invoices` (`invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Cars` (
  `cars_id` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `car_year` DATETIME NULL,
  `color` VARCHAR(45) NULL,
  `Customers_customers_id` INT NOT NULL,
  `Invoices_invoices_id` INT NOT NULL,
  PRIMARY KEY (`cars_id`, `Customers_customers_id`, `Invoices_invoices_id`),
  INDEX `fk_Cars_Customers_idx` (`Customers_customers_id` ASC) VISIBLE,
  INDEX `fk_Cars_Invoices1_idx` (`Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Customers`
    FOREIGN KEY (`Customers_customers_id`)
    REFERENCES `cars`.`Customers` (`customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cars_Invoices1`
    FOREIGN KEY (`Invoices_invoices_id`)
    REFERENCES `cars`.`Invoices` (`invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Salespersons` (
  `salespersons_id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` VARCHAR(45) NULL,
  `staff_name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `Invoices_invoices_id` INT NOT NULL,
  PRIMARY KEY (`salespersons_id`, `Invoices_invoices_id`),
  INDEX `fk_Salespersons_Invoices1_idx` (`Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Salespersons_Invoices1`
    FOREIGN KEY (`Invoices_invoices_id`)
    REFERENCES `cars`.`Invoices` (`invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Customers_has_Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Customers_has_Salespersons` (
  `Customers_customers_id` INT NOT NULL,
  `Customers_Invoices_invoices_id` INT NOT NULL,
  `Salespersons_salespersons_id` INT NOT NULL,
  PRIMARY KEY (`Customers_customers_id`, `Customers_Invoices_invoices_id`, `Salespersons_salespersons_id`),
  INDEX `fk_Customers_has_Salespersons_Salespersons1_idx` (`Salespersons_salespersons_id` ASC) VISIBLE,
  INDEX `fk_Customers_has_Salespersons_Customers1_idx` (`Customers_customers_id` ASC, `Customers_Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_has_Salespersons_Customers1`
    FOREIGN KEY (`Customers_customers_id` , `Customers_Invoices_invoices_id`)
    REFERENCES `cars`.`Customers` (`customers_id` , `Invoices_invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Salespersons_Salespersons1`
    FOREIGN KEY (`Salespersons_salespersons_id`)
    REFERENCES `cars`.`Salespersons` (`salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars`.`Cars_has_Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`Cars_has_Salespersons` (
  `Cars_cars_id` INT NOT NULL,
  `Cars_Customers_customers_id` INT NOT NULL,
  `Cars_Invoices_invoices_id` INT NOT NULL,
  `Salespersons_salespersons_id` INT NOT NULL,
  PRIMARY KEY (`Cars_cars_id`, `Cars_Customers_customers_id`, `Cars_Invoices_invoices_id`, `Salespersons_salespersons_id`),
  INDEX `fk_Cars_has_Salespersons_Salespersons1_idx` (`Salespersons_salespersons_id` ASC) VISIBLE,
  INDEX `fk_Cars_has_Salespersons_Cars1_idx` (`Cars_cars_id` ASC, `Cars_Customers_customers_id` ASC, `Cars_Invoices_invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_has_Salespersons_Cars1`
    FOREIGN KEY (`Cars_cars_id` , `Cars_Customers_customers_id` , `Cars_Invoices_invoices_id`)
    REFERENCES `cars`.`Cars` (`cars_id` , `Customers_customers_id` , `Invoices_invoices_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cars_has_Salespersons_Salespersons1`
    FOREIGN KEY (`Salespersons_salespersons_id`)
    REFERENCES `cars`.`Salespersons` (`salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
