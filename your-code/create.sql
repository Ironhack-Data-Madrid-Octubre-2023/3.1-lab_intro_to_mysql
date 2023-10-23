-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema exercise
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `exercise` ;

-- -----------------------------------------------------
-- Table `exercise`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise`.`Car` (
  `car_id` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NULL,
  `fabric_name` VARCHAR(25) NULL,
  `model` VARCHAR(10) NULL,
  `car_year` YEAR(4) NULL,
  `color` VARCHAR(20) NULL,
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise`.`Customer` (
  `cust_id` INT NOT NULL AUTO_INCREMENT,
  `cust_name` VARCHAR(20) NULL,
  `cust_telf` CHAR(12) NULL,
  `cust_email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(20) NULL,
  `state` VARCHAR(20) NULL,
  `coutry` VARCHAR(30) NULL,
  `zip_cust` VARCHAR(10) NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise`.`Vendedor` (
  `idVendor` INT NOT NULL AUTO_INCREMENT,
  `Staff_ID` INT NULL,
  `vend_name` VARCHAR(25) NULL,
  `vend_store` VARCHAR(20) NULL,
  PRIMARY KEY (`idVendor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise`.`Invoice` (
  `id_Invoice` INT NOT NULL AUTO_INCREMENT,
  `invoice_num` VARCHAR(10) NULL,
  `invoice_date` VARCHAR(45) NULL,
  `car_invoice` INT NULL,
  `customer` INT NULL,
  `salesperson` INT NULL,
  PRIMARY KEY (`id_Invoice`),
  INDEX `customer_id_idx` (`customer` ASC) VISIBLE,
  INDEX `salesperson_idx` (`salesperson` ASC) VISIBLE,
  INDEX `car_invoice_idx` (`car_invoice` ASC) VISIBLE,
  CONSTRAINT `customer`
    FOREIGN KEY (`customer`)
    REFERENCES `exercise`.`Customer` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `salesperson`
    FOREIGN KEY (`salesperson`)
    REFERENCES `exercise`.`Vendedor` (`idVendor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_invoice`
    FOREIGN KEY (`car_invoice`)
    REFERENCES `exercise`.`Car` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


ALTER TABLE Customer
MODIFY cust_telf VARCHAR(35);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
