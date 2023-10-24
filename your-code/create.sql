-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema carcompany
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema carcompany
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carcompany` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `carcompany` ;

-- -----------------------------------------------------
-- Table `carcompany`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`cars` (
  `car_id` INT NOT NULL,
  `VIN` CHAR(17) NULL,
  `manufacturer` VARCHAR(15) NULL,
  `model` VARCHAR(20) NULL,
  `year` YEAR(4) NULL,
  `colour` VARCHAR(10) NULL,
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`customers` (
  `customer_id` INT NOT NULL,
  `firstname` VARCHAR(20) NULL,
  `lastname` VARCHAR(100) NULL,
  `phonenumber` VARCHAR(15) NULL,
  `email` VARCHAR(100) NULL,
  `address` VARCHAR(150) NULL,
  `city` VARCHAR(50) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zipcode` VARCHAR(15) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`salespeople`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`salespeople` (
  `salespersonid` INT NOT NULL,
  `firstname` VARCHAR(20) NULL,
  `lastname` VARCHAR(100) NULL,
  `store` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`salespersonid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carcompany`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcompany`.`invoices` (
  `invoiceid` INT NOT NULL,
  `invoicenumber` CHAR(15) NULL,
  `cars_car_id` INT NOT NULL,
  `salespeople_salespersonid` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`invoiceid`, `cars_car_id`, `salespeople_salespersonid`, `customers_customer_id`),
  INDEX `fk_invoices_cars_idx` (`cars_car_id` ASC) VISIBLE,
  INDEX `fk_invoices_salespeople1_idx` (`salespeople_salespersonid` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_car_id`)
    REFERENCES `carcompany`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespeople1`
    FOREIGN KEY (`salespeople_salespersonid`)
    REFERENCES `carcompany`.`salespeople` (`salespersonid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `carcompany`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;