-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `publications` DEFAULT CHARACTER SET latin1 ;
-- -----------------------------------------------------
-- Schema cars_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars_db` DEFAULT CHARACTER SET latin1 ;
USE `publications` ;

-- -----------------------------------------------------
-- Table `publications`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`authors` (
  `au_id` VARCHAR(11) NOT NULL,
  `au_lname` VARCHAR(40) NOT NULL,
  `au_fname` VARCHAR(20) NOT NULL,
  `phone` CHAR(12) NOT NULL,
  `address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  `contract` TINYINT(4) NOT NULL,
  PRIMARY KEY (`au_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`stores` (
  `stor_id` CHAR(4) NOT NULL,
  `stor_name` VARCHAR(40) NULL DEFAULT NULL,
  `stor_address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`stor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`discounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`discounts` (
  `discounttype` VARCHAR(40) NOT NULL,
  `stor_id` CHAR(4) NULL DEFAULT NULL,
  `lowqty` SMALLINT(6) NULL DEFAULT NULL,
  `highqty` SMALLINT(6) NULL DEFAULT NULL,
  `discount` DECIMAL(4,2) NOT NULL,
  INDEX `discounts_stor_id` (`stor_id` ASC),
  CONSTRAINT `discounts_ibfk_1`
    FOREIGN KEY (`stor_id`)
    REFERENCES `publications`.`stores` (`stor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`jobs` (
  `job_id` SMALLINT(6) NOT NULL,
  `job_desc` VARCHAR(50) NOT NULL,
  `min_lvl` SMALLINT(6) NOT NULL,
  `max_lvl` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`publishers` (
  `pub_id` CHAR(4) NOT NULL,
  `pub_name` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`pub_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`employee` (
  `emp_id` CHAR(9) NOT NULL,
  `fname` VARCHAR(20) NOT NULL,
  `minit` CHAR(1) NULL DEFAULT NULL,
  `lname` VARCHAR(30) NOT NULL,
  `job_id` SMALLINT(6) NOT NULL,
  `job_lvl` SMALLINT(6) NULL DEFAULT NULL,
  `pub_id` CHAR(4) NOT NULL,
  `hire_date` DATETIME NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `employee_job_id` (`job_id` ASC),
  INDEX `employee_pub_id` (`pub_id` ASC),
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`job_id`)
    REFERENCES `publications`.`jobs` (`job_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`pub_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`pub_info` (
  `pub_id` CHAR(4) NOT NULL,
  `logo` LONGBLOB NULL DEFAULT NULL,
  `pr_info` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`pub_id`),
  CONSTRAINT `pub_info_ibfk_1`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`titles` (
  `title_id` VARCHAR(6) NOT NULL,
  `title` VARCHAR(80) NOT NULL,
  `type` CHAR(12) NOT NULL,
  `pub_id` CHAR(4) NULL DEFAULT NULL,
  `price` DECIMAL(19,4) NULL DEFAULT NULL,
  `advance` DECIMAL(19,4) NULL DEFAULT NULL,
  `royalty` INT(11) NULL DEFAULT NULL,
  `ytd_sales` INT(11) NULL DEFAULT NULL,
  `notes` VARCHAR(200) NULL DEFAULT NULL,
  `pubdate` DATETIME NOT NULL,
  PRIMARY KEY (`title_id`),
  INDEX `titles_pub_id` (`pub_id` ASC),
  CONSTRAINT `titles_ibfk_1`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`roysched`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`roysched` (
  `title_id` VARCHAR(6) NOT NULL,
  `lorange` INT(11) NULL DEFAULT NULL,
  `hirange` INT(11) NULL DEFAULT NULL,
  `royalty` INT(11) NULL DEFAULT NULL,
  INDEX `roysched_title_id` (`title_id` ASC),
  CONSTRAINT `roysched_ibfk_1`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`sales` (
  `stor_id` CHAR(4) NOT NULL,
  `ord_num` VARCHAR(20) NOT NULL,
  `ord_date` DATETIME NOT NULL,
  `qty` SMALLINT(6) NOT NULL,
  `payterms` VARCHAR(12) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`stor_id`, `ord_num`, `title_id`),
  INDEX `sales_title_id` (`title_id` ASC),
  CONSTRAINT `sales_ibfk_1`
    FOREIGN KEY (`stor_id`)
    REFERENCES `publications`.`stores` (`stor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_2`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `publications`.`titleauthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`titleauthor` (
  `au_id` VARCHAR(11) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  `au_ord` TINYINT(4) NULL DEFAULT NULL,
  `royaltyper` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`au_id`, `title_id`),
  INDEX `titleauthor_title_id` (`title_id` ASC),
  CONSTRAINT `titleauthor_ibfk_1`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `titleauthor_ibfk_2`
    FOREIGN KEY (`au_id`)
    REFERENCES `publications`.`authors` (`au_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `cars_db` ;

-- -----------------------------------------------------
-- Table `cars_db`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Cars` (
  `idcars` INT NOT NULL,
  `VIN` INT NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` DATE NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idcars`),
  UNIQUE INDEX `idCars_UNIQUE` (`idcars` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Customers` (
  `idcustomer` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT NULL,
  PRIMARY KEY (`idcustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idcustomer` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Stores` (
  `idstore` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idstore`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Salespersons` (
  `idstaff` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `Stores_id_store` INT NOT NULL,
  PRIMARY KEY (`idstaff`),
  UNIQUE INDEX `idSalespersons_UNIQUE` (`idstaff` ASC),
  INDEX `fk_Salespersons_Stores1_idx` (`Stores_id_store` ASC),
  CONSTRAINT `fk_Salespersons_Stores1`
    FOREIGN KEY (`Stores_id_store`)
    REFERENCES `cars_db`.`Stores` (`idstore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_db`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_db`.`Invoices` (
  `idinvoice` INT NOT NULL,
  `number` INT NULL,
  `date` DATETIME NULL,
  `Stores_idstore` INT NOT NULL,
  `Salespersons_idstaff` INT NOT NULL,
  `Cars_idcars` INT NOT NULL,
  `Customers_idcustomer` INT NOT NULL,
  PRIMARY KEY (`idinvoice`),
  UNIQUE INDEX `id_invoice_UNIQUE` (`idinvoice` ASC),
  INDEX `fk_Invoices_Stores_idx` (`Stores_idstore` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_idstaff` ASC),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_idcars` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idcustomer` ASC),
  CONSTRAINT `fk_Invoices_Stores`
    FOREIGN KEY (`Stores_idstore`)
    REFERENCES `cars_db`.`Stores` (`idstore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_idstaff`)
    REFERENCES `cars_db`.`Salespersons` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_idcars`)
    REFERENCES `cars_db`.`Cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idcustomer`)
    REFERENCES `cars_db`.`Customers` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
