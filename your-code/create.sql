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
-- Schema publications
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `publications` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
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
-- Table `coches`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`cars` (
  `VIN` INT NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` DATE NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VIN`, `manufacturer`, `model`, `year`, `color`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`customers` (
  `customer_ID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email_adress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state/province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip/postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_ID`, `name`, `phone_number`, `email_adress`, `city`, `state/province`, `country`, `zip/postal_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`sales_persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`sales_persons` (
  `staff_ID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff_ID`, `name`, `store`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`invoices` (
  `invoice_ID` INT NOT NULL,
  `invoice_number` INT NOT NULL,
  `invoice_date` DATE NOT NULL,
  `car` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `sales_person` VARCHAR(45) NOT NULL,
  `cars_VIN` INT NOT NULL,
  `cars_manufacturer` VARCHAR(45) NOT NULL,
  `cars_model` VARCHAR(45) NOT NULL,
  `cars_year` DATE NOT NULL,
  `cars_color` VARCHAR(45) NOT NULL,
  `customers_customer_ID` INT NOT NULL,
  `customers_name` VARCHAR(45) NOT NULL,
  `customers_phone_number` VARCHAR(45) NOT NULL,
  `customers_email_adress` VARCHAR(45) NOT NULL,
  `customers_city` VARCHAR(45) NOT NULL,
  `customers_state/province` VARCHAR(45) NOT NULL,
  `customers_country` VARCHAR(45) NOT NULL,
  `customers_zip/postal_code` VARCHAR(45) NOT NULL,
  `sales_persons_staff_ID` INT NOT NULL,
  `sales_persons_name` VARCHAR(45) NOT NULL,
  `sales_persons_store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoice_ID`, `invoice_number`, `invoice_date`, `car`, `customer`, `sales_person`, `cars_VIN`, `cars_manufacturer`, `cars_model`, `cars_year`, `cars_color`, `customers_customer_ID`, `customers_name`, `customers_phone_number`, `customers_email_adress`, `customers_city`, `customers_state/province`, `customers_country`, `customers_zip/postal_code`, `sales_persons_staff_ID`, `sales_persons_name`, `sales_persons_store`),
  INDEX `fk_invoices_cars_idx` (`cars_VIN` ASC, `cars_manufacturer` ASC, `cars_model` ASC, `cars_year` ASC, `cars_color` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_customer_ID` ASC, `customers_name` ASC, `customers_phone_number` ASC, `customers_email_adress` ASC, `customers_city` ASC, `customers_state/province` ASC, `customers_country` ASC, `customers_zip/postal_code` ASC) VISIBLE,
  INDEX `fk_invoices_sales_persons1_idx` (`sales_persons_staff_ID` ASC, `sales_persons_name` ASC, `sales_persons_store` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_VIN` , `cars_manufacturer` , `cars_model` , `cars_year` , `cars_color`)
    REFERENCES `coches`.`cars` (`VIN` , `manufacturer` , `model` , `year` , `color`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer_ID` , `customers_name` , `customers_phone_number` , `customers_email_adress` , `customers_city` , `customers_state/province` , `customers_country` , `customers_zip/postal_code`)
    REFERENCES `coches`.`customers` (`customer_ID` , `name` , `phone_number` , `email_adress` , `city` , `state/province` , `country` , `zip/postal_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_sales_persons1`
    FOREIGN KEY (`sales_persons_staff_ID` , `sales_persons_name` , `sales_persons_store`)
    REFERENCES `coches`.`sales_persons` (`staff_ID` , `name` , `store`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
