-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema daily_diary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema daily_diary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `daily_diary` DEFAULT CHARACTER SET utf8mb3 ;
USE `daily_diary` ;

-- -----------------------------------------------------
-- Table `daily_diary`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `daily_diary`.`users` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `daily_diary`.`diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `daily_diary`.`diary` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `content` VARCHAR(10000) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `month` INT NULL DEFAULT NULL,
  `day` INT NULL DEFAULT NULL,
  `users_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_diary_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_diary_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `daily_diary`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `daily_diary`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `daily_diary`.`files` (
  `org_name` VARCHAR(100) NULL DEFAULT NULL,
  `save_forder` VARCHAR(45) NULL DEFAULT NULL,
  `change_name` VARCHAR(100) NULL DEFAULT NULL,
  `diary_no` INT NOT NULL,
  INDEX `fk_files_diary1_idx` (`diary_no` ASC) VISIBLE,
  CONSTRAINT `fk_files_diary1`
    FOREIGN KEY (`diary_no`)
    REFERENCES `daily_diary`.`diary` (`no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `daily_diary`.`temp_certi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `daily_diary`.`temp_certi` (
  `id` VARCHAR(45) NOT NULL,
  `certif` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
