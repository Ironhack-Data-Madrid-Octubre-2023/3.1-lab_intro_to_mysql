-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `publications` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema prueba
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`facturas` (
  `id` INT NOT NULL,
  `numero de facturas` INT NULL,
  `vendedor` VARCHAR(45) NULL,
  `producto` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`facturas_has_table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`facturas_has_table1` (
  `facturas_id` INT NOT NULL,
  `table1_id` INT NOT NULL,
  PRIMARY KEY (`facturas_id`, `table1_id`),
  INDEX `fk_facturas_has_table1_table11_idx` (`table1_id` ASC) VISIBLE,
  INDEX `fk_facturas_has_table1_facturas_idx` (`facturas_id` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_has_table1_facturas`
    FOREIGN KEY (`facturas_id`)
    REFERENCES `mydb`.`facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_has_table1_table11`
    FOREIGN KEY (`table1_id`)
    REFERENCES `mydb`.`table1` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

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
  `contract` TINYINT NOT NULL,
  PRIMARY KEY (`au_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


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
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`discounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`discounts` (
  `discounttype` VARCHAR(40) NOT NULL,
  `stor_id` CHAR(4) NULL DEFAULT NULL,
  `lowqty` SMALLINT NULL DEFAULT NULL,
  `highqty` SMALLINT NULL DEFAULT NULL,
  `discount` DECIMAL(4,2) NOT NULL,
  INDEX `discounts_stor_id` (`stor_id` ASC) VISIBLE,
  CONSTRAINT `discounts_ibfk_1`
    FOREIGN KEY (`stor_id`)
    REFERENCES `publications`.`stores` (`stor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`jobs` (
  `job_id` SMALLINT NOT NULL,
  `job_desc` VARCHAR(50) NOT NULL,
  `min_lvl` SMALLINT NOT NULL,
  `max_lvl` SMALLINT NOT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


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
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`employee` (
  `emp_id` CHAR(9) NOT NULL,
  `fname` VARCHAR(20) NOT NULL,
  `minit` CHAR(1) NULL DEFAULT NULL,
  `lname` VARCHAR(30) NOT NULL,
  `job_id` SMALLINT NOT NULL,
  `job_lvl` SMALLINT NULL DEFAULT NULL,
  `pub_id` CHAR(4) NOT NULL,
  `hire_date` DATETIME NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `employee_job_id` (`job_id` ASC) VISIBLE,
  INDEX `employee_pub_id` (`pub_id` ASC) VISIBLE,
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
DEFAULT CHARACTER SET = utf8mb3;


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
DEFAULT CHARACTER SET = utf8mb3;


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
  `royalty` INT NULL DEFAULT NULL,
  `ytd_sales` INT NULL DEFAULT NULL,
  `notes` VARCHAR(200) NULL DEFAULT NULL,
  `pubdate` DATETIME NOT NULL,
  PRIMARY KEY (`title_id`),
  INDEX `titles_pub_id` (`pub_id` ASC) VISIBLE,
  CONSTRAINT `titles_ibfk_1`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`roysched`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`roysched` (
  `title_id` VARCHAR(6) NOT NULL,
  `lorange` INT NULL DEFAULT NULL,
  `hirange` INT NULL DEFAULT NULL,
  `royalty` INT NULL DEFAULT NULL,
  INDEX `roysched_title_id` (`title_id` ASC) VISIBLE,
  CONSTRAINT `roysched_ibfk_1`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`sales` (
  `stor_id` CHAR(4) NOT NULL,
  `ord_num` VARCHAR(20) NOT NULL,
  `ord_date` DATETIME NOT NULL,
  `qty` SMALLINT NOT NULL,
  `payterms` VARCHAR(12) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`stor_id`, `ord_num`, `title_id`),
  INDEX `sales_title_id` (`title_id` ASC) VISIBLE,
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
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`titleauthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`titleauthor` (
  `au_id` VARCHAR(11) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  `au_ord` TINYINT NULL DEFAULT NULL,
  `royaltyper` INT NULL DEFAULT NULL,
  PRIMARY KEY (`au_id`, `title_id`),
  INDEX `titleauthor_title_id` (`title_id` ASC) VISIBLE,
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
DEFAULT CHARACTER SET = utf8mb3;

USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`invoices` (
  `invoiceID` INT NOT NULL,
  `invoicenumber` INT NULL,
  `date` DATETIME NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  PRIMARY KEY (`invoiceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`cars` (
  `carID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  `invoices_invoiceID` INT NOT NULL,
  PRIMARY KEY (`carID`, `invoices_invoiceID`),
  INDEX `fk_cars_invoices1_idx` (`invoices_invoiceID` ASC) VISIBLE,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_invoiceID`)
    REFERENCES `coches`.`invoices` (`invoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`customers` (
  `customerID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phonenumber` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postalcode` VARCHAR(45) NULL,
  `invoices_invoiceID` INT NOT NULL,
  PRIMARY KEY (`customerID`, `invoices_invoiceID`),
  INDEX `fk_customers_invoices1_idx` (`invoices_invoiceID` ASC) VISIBLE,
  CONSTRAINT `fk_customers_invoices1`
    FOREIGN KEY (`invoices_invoiceID`)
    REFERENCES `coches`.`invoices` (`invoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`salespersons` (
  `staffID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `invoices_invoiceID` INT NOT NULL,
  PRIMARY KEY (`staffID`, `invoices_invoiceID`),
  INDEX `fk_salespersons_invoices1_idx` (`invoices_invoiceID` ASC) VISIBLE,
  CONSTRAINT `fk_salespersons_invoices1`
    FOREIGN KEY (`invoices_invoiceID`)
    REFERENCES `coches`.`invoices` (`invoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
