-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------StudentURLStudentStudent------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `random_ID` INT PRIMARY KEY AUTO_INCREMENT,
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
  `random_ID` VARCHAR(45) NOT NULL,
  `assignment_Title` VARCHAR(45) NULL,
  `course_ID` VARCHAR(45) NULL,
  `semester_ID` VARCHAR(45) NULL,
  `marks` INT NULL,
  `file1` VARCHAR(45) NULL,
  `file2` VARCHAR(45) NULL,
  `URL_serial_Num` INT NOT NULL,
  PRIMARY KEY (`assignment_Num`),
  INDEX `fk_Assignments_URL1_idx` (`URL_serial_Num` ASC) VISIBLE,
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

  PRIMARY KEY (`serial_Num`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT IGNORE INTO Student(random_ID, mapping_ID) 
VALUES (00001, 'lastname@fredonia.edu');
INSERT IGNORE INTO Student(random_ID, mapping_ID) 
VALUES (10101, 'bren0193@fredonia.edu');
INSERT IGNORE INTO Student(random_ID, mapping_ID) 
VALUES (21212, 'firstname@fredonia.edu');

INSERT IGNORE INTO Assignments(assignment_Num, random_ID, assignment_Title, course_ID, semester_ID, marks, file1, file2, URL_serial_Num)
VALUES (01, 00001, 'Assignment 1', '101', 'SPR2023', 100, 'file1.cpp', 'file2.cpp', 1212);
INSERT IGNORE INTO Assignments(assignment_Num, random_ID, assignment_Title, course_ID, semester_ID, marks, file1, file2, URL_serial_Num)
VALUES (02, 00002, 'Assignment 2', '101', 'SPR2023', 70, 'file1.cpp', 'file2.cpp', 2121);
INSERT IGNORE INTO Assignments(assignment_Num, random_ID, assignment_Title, course_ID, semester_ID, marks, file1, file2, URL_serial_Num)
VALUES (03, 00003, 'Assignment 3', '101', 'FALL2023', 89, 'file3.cpp', 'file4.cpp', 0101);

INSERT IGNORE INTO URL(serial_Num, assignment_Num, assignment_URL, sub_folder)
VALUES (1212, 01, 'example.com/1212', '/subfolder1');
INSERT IGNORE INTO URL(serial_Num, assignment_Num, assignment_URL, sub_folder)
VALUES (2121, 02, 'example.com/2121', '/subfolderb1');
INSERT IGNORE INTO URL(serial_Num, assignment_Num, assignment_URL, sub_folder)
VALUES (0101, 03, 'example.com/0101', '/subfolderc1');

INSERT IGNORE INTO Parameters(serial_Num, IP_Address)
VALUES (1212, '192.161.0.0');
INSERT IGNORE INTO Parameters(serial_Num, IP_Address)
VALUES (2121, '192.161.0.1');
INSERT IGNORE INTO Parameters(serial_Num, IP_Address)
VALUES (0101, '192.161.1.1');


SELECT * FROM Student;

