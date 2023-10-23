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
