-- MySQL Script generated by MySQL Workbench
-- Thu Dec  2 11:00:27 2021
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`experts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`experts` (
  `id` INT NOT NULL,
  `occupation` VARCHAR(45) NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experts_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_experts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`surveys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`surveys` ;

CREATE TABLE IF NOT EXISTS `mydb`.`surveys` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `open` DATETIME NULL,
  `close` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_surveys_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_surveys_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`reports` (
  `id` INT NOT NULL,
  `text` VARCHAR(300) NOT NULL,
  `date` DATETIME NOT NULL,
  `surveys_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reports_surveys1_idx` (`surveys_id` ASC) VISIBLE,
  INDEX `fk_reports_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_reports_surveys1`
    FOREIGN KEY (`surveys_id`)
    REFERENCES `mydb`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reports_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`questions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`questions` (
  `id` INT NOT NULL,
  `text` VARCHAR(300) NOT NULL,
  `type` VARCHAR(45) NULL,
  `surveys_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_questions_surveys_idx` (`surveys_id` ASC) VISIBLE,
  CONSTRAINT `fk_questions_surveys`
    FOREIGN KEY (`surveys_id`)
    REFERENCES `mydb`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`responses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`responses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`responses` (
  `id` INT NOT NULL,
  `text` VARCHAR(300) NOT NULL,
  `questions_id` INT NOT NULL,
  `experts_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_responses_questions1_idx` (`questions_id` ASC) VISIBLE,
  INDEX `fk_responses_experts1_idx` (`experts_id` ASC) VISIBLE,
  CONSTRAINT `fk_responses_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_responses_experts1`
    FOREIGN KEY (`experts_id`)
    REFERENCES `mydb`.`experts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
