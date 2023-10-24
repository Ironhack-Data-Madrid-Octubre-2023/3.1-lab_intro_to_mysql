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
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state/province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postalcode` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`salesperson` (
  `idstaff` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idstaff`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invnumb` INT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `car` VARCHAR(45) NULL DEFAULT NULL,
  `customer` VARCHAR(45) NULL DEFAULT NULL,
  `salesperson` VARCHAR(45) NULL DEFAULT NULL,
  `customer_idcustomer` INT NOT NULL,
  `salesperson_idstaff` INT NOT NULL,
  PRIMARY KEY (`idinvoices`, `customer_idcustomer`, `salesperson_idstaff`),
  INDEX `fk_invoices_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_idstaff` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `coches`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_idstaff`)
    REFERENCES `coches`.`salesperson` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`cars` (
  `VIN` INT NOT NULL,
  `MANUFACTURER` VARCHAR(45) NULL DEFAULT NULL,
  `MODEL` VARCHAR(45) NULL DEFAULT NULL,
  `CAR_YEAR` DATETIME NULL DEFAULT NULL,
  `COLOR` VARCHAR(45) NULL DEFAULT NULL,
  `invoices_idinvoices` INT NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`VIN`, `invoices_idinvoices`, `customer_idcustomer`),
  INDEX `fk_cars_invoices1_idx` (`invoices_idinvoices` ASC) VISIBLE,
  INDEX `fk_cars_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_idinvoices`)
    REFERENCES `coches`.`invoices` (`idinvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `coches`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`salesperson_has_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`salesperson_has_customer` (
  `salesperson_idstaff` INT NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`salesperson_idstaff`, `customer_idcustomer`),
  INDEX `fk_salesperson_has_customer_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_salesperson_has_customer_salesperson_idx` (`salesperson_idstaff` ASC) VISIBLE,
  CONSTRAINT `fk_salesperson_has_customer_salesperson`
    FOREIGN KEY (`salesperson_idstaff`)
    REFERENCES `coches`.`salesperson` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesperson_has_customer_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `coches`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coches`.`salesperson_has_invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`salesperson_has_invoices` (
  `salesperson_idstaff` INT NOT NULL,
  `invoices_idinvoices` INT NOT NULL,
  `invoices_customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`salesperson_idstaff`, `invoices_idinvoices`, `invoices_customer_idcustomer`),
  INDEX `fk_salesperson_has_invoices_invoices1_idx` (`invoices_idinvoices` ASC, `invoices_customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_salesperson_has_invoices_salesperson1_idx` (`salesperson_idstaff` ASC) VISIBLE,
  CONSTRAINT `fk_salesperson_has_invoices_salesperson1`
    FOREIGN KEY (`salesperson_idstaff`)
    REFERENCES `coches`.`salesperson` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salesperson_has_invoices_invoices1`
    FOREIGN KEY (`invoices_idinvoices` , `invoices_customer_idcustomer`)
    REFERENCES `coches`.`invoices` (`idinvoices` , `customer_idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
