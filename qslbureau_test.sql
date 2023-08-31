-- MySQL Script generated by MySQL Workbench
-- jue 31 ago 2023 08:57:40 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema qslbureau_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `C_LOCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `C_LOCAL` (
  `IDLOCAL` INT NOT NULL AUTO_INCREMENT,
  `MAXSLOTS` INT NOT NULL,
  `NAME` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`IDLOCAL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `C_STATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `C_STATUS` (
  `IDSTATUS` INT NOT NULL,
  `STATUS` VARCHAR(15) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  `OBJECT` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`IDSTATUS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T_SLOT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T_SLOT` (
  `IDSLOT` INT NOT NULL AUTO_INCREMENT,
  `IDLOCAL` INT NOT NULL,
  `CALLSIGNTO` VARCHAR(45) NULL,
  `SLOTNUMBER` INT NULL,
  `CREATED_AT` DATETIME NULL,
  `CLOSED_AT` DATETIME NULL,
  `IDSTATUS` INT NOT NULL,
  PRIMARY KEY (`IDSLOT`),
  INDEX `fk_T_SLOT_C_LOCAL1_idx` (`IDLOCAL` ASC),
  INDEX `fk_T_SLOT_C_STATUS1_idx` (`IDSTATUS` ASC),
  CONSTRAINT `fk_T_SLOT_C_LOCAL1`
    FOREIGN KEY (`IDLOCAL`)
    REFERENCES `C_LOCAL` (`IDLOCAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_SLOT_C_STATUS1`
    FOREIGN KEY (`IDSTATUS`)
    REFERENCES `C_STATUS` (`IDSTATUS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `C_CAPTURER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `C_CAPTURER` (
  `IDCAPTURER` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL,
  `LASTNAME` VARCHAR(45) NULL,
  `USERNAME` VARCHAR(45) NULL,
  `PASSWORD` VARCHAR(60) NULL,
  `START` DATETIME NULL,
  `END` DATETIME NULL,
  PRIMARY KEY (`IDCAPTURER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `T_QSL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `T_QSL` (
  `IDQSL` INT NOT NULL AUTO_INCREMENT,
  `IDSLOT` INT NOT NULL,
  `IDCAPTURER` INT NOT NULL,
  `TO` VARCHAR(12) NOT NULL,
  `VIA` VARCHAR(12) NULL,
  `DATETIMECAPTURE` DATETIME NOT NULL,
  `IDSTATUS` INT NOT NULL,
  PRIMARY KEY (`IDQSL`),
  INDEX `fk_T_QSL_T_SLOT_idx` (`IDSLOT` ASC),
  INDEX `fk_T_QSL_C_CAPTURER1_idx` (`IDCAPTURER` ASC),
  INDEX `fk_T_QSL_C_STATUS1_idx` (`IDSTATUS` ASC),
  CONSTRAINT `fk_T_QSL_T_SLOT`
    FOREIGN KEY (`IDSLOT`)
    REFERENCES `T_SLOT` (`IDSLOT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_QSL_C_CAPTURER1`
    FOREIGN KEY (`IDCAPTURER`)
    REFERENCES `C_CAPTURER` (`IDCAPTURER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_QSL_C_STATUS1`
    FOREIGN KEY (`IDSTATUS`)
    REFERENCES `C_STATUS` (`IDSTATUS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `D_CAPTURER_LOCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_CAPTURER_LOCAL` (
  `IDCAPTURERLOCAL` INT NOT NULL AUTO_INCREMENT,
  `IDCAPTURER` INT NOT NULL,
  `IDLOCAL` INT NOT NULL,
  `START` DATE NULL,
  `END` DATE NULL,
  PRIMARY KEY (`IDCAPTURERLOCAL`),
  INDEX `fk_D_CAPTURER_LOCAL_C_CAPTURER1_idx` (`IDCAPTURER` ASC),
  INDEX `fk_D_CAPTURER_LOCAL_C_LOCAL1_idx` (`IDLOCAL` ASC),
  CONSTRAINT `fk_D_CAPTURER_LOCAL_C_CAPTURER1`
    FOREIGN KEY (`IDCAPTURER`)
    REFERENCES `C_CAPTURER` (`IDCAPTURER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_D_CAPTURER_LOCAL_C_LOCAL1`
    FOREIGN KEY (`IDLOCAL`)
    REFERENCES `C_LOCAL` (`IDLOCAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `C_CALLSIGNRULE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `C_CALLSIGNRULE` (
  `IDCALLSIGNRULE` INT NOT NULL AUTO_INCREMENT,
  `IDCAPTURER` INT NOT NULL,
  `CALLSIGNTO` VARCHAR(45) NULL,
  `CALLSIGNREDIRECT` VARCHAR(45) NULL,
  `START` DATE NULL,
  `END` DATE NULL,
  PRIMARY KEY (`IDCALLSIGNRULE`),
  INDEX `fk_C_CALLSIGNRULES_C_CAPTURER1_idx` (`IDCAPTURER` ASC),
  CONSTRAINT `fk_C_CALLSIGNRULES_C_CAPTURER1`
    FOREIGN KEY (`IDCAPTURER`)
    REFERENCES `C_CAPTURER` (`IDCAPTURER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `C_ZONERULE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `C_ZONERULE` (
  `IDZONERULE` INT NOT NULL AUTO_INCREMENT,
  `IDCAPTURER` INT NOT NULL,
  `ZONE` VARCHAR(45) NULL,
  `CALLSIGN` VARCHAR(45) NULL,
  `START` DATETIME NULL,
  PRIMARY KEY (`IDZONERULE`),
  INDEX `fk_C_ZONERULE_C_CAPTURER1_idx` (`IDCAPTURER` ASC),
  CONSTRAINT `fk_C_ZONERULE_C_CAPTURER1`
    FOREIGN KEY (`IDCAPTURER`)
    REFERENCES `C_CAPTURER` (`IDCAPTURER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
