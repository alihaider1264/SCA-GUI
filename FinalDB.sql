-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `random_ID` INT NOT NULL,
  `mapping_ID` VARCHAR(45) NULL,
  PRIMARY KEY (`random_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`URL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`URL` (
  `serial_Num` INT NOT NULL,
  `assignment_Num` INT NULL,
  `assignment_URL` VARCHAR(45) NULL,
  `sub_folder` VARCHAR(45) NULL,
  PRIMARY KEY (`serial_Num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignments` (
  `assignment_Num` INT NOT NULL,
  `random_ID` VARCHAR(45) NULL,
  `assignment_Title` VARCHAR(45) NULL,
  `course_ID` VARCHAR(45) NULL,
  `semester_ID` VARCHAR(45) NULL,
  `marks` INT NULL,
  `file1` VARCHAR(45) NULL,
  `file2` VARCHAR(45) NULL,
  `URL_serial_Num` INT NOT NULL,
  PRIMARY KEY (`assignment_Num`),
  INDEX `fk_Assignments_URL1_idx` (`URL_serial_Num` ASC) VISIBLE,
  CONSTRAINT `random_ID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Student` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignments_URL1`
    FOREIGN KEY (`URL_serial_Num`)
    REFERENCES `mydb`.`URL` (`serial_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parameters` (
  `serial_Num` INT NOT NULL,
  `IP_Address` VARCHAR(45) NULL,
  `assingment_Folder` VARCHAR(45) NULL,
  PRIMARY KEY (`serial_Num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Permissions` (
  `permission_alias` INT NOT NULL,
  `random_ID` VARCHAR(45) NOT NULL,
  `assignment_URL` VARCHAR(45) NULL,
  PRIMARY KEY (`permission_alias`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
