-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ciclos_propedeuticos_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ciclos_propedeuticos_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ciclos_propedeuticos_2` DEFAULT CHARACTER SET utf8 ;
USE `ciclos_propedeuticos_2` ;

-- -----------------------------------------------------
-- Table `ciclos_propedeuticos_2`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclos_propedeuticos_2`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '																																																	';


-- -----------------------------------------------------
-- Table `ciclos_propedeuticos_2`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclos_propedeuticos_2`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `second_last_name` VARCHAR(50) NOT NULL,
  `card_id` VARCHAR(13) NOT NULL,
  `birth_date` DATE NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(10) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol_id` INT NOT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT 0,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rol_rol_id` (`rol_id` ASC),
  CONSTRAINT `fk_rol_rol_id`
    FOREIGN KEY (`rol_id`)
    REFERENCES `ciclos_propedeuticos_2`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '																																																	';


-- -----------------------------------------------------
-- Table `ciclos_propedeuticos_2`.`cycle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclos_propedeuticos_2`.`cycle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `ciclos_propedeuticos_2`.`degree_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclos_propedeuticos_2`.`degree_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `from` VARCHAR(45) NOT NULL,
  `degree_project_name` VARCHAR(45) NOT NULL,
  `observation` VARCHAR(255) NULL DEFAULT 'Sin Observaciones',
  `state` TINYINT(1) NULL DEFAULT 1 COMMENT 'estado de la solicitud de grado',
  `degree_date` DATE NULL COMMENT 'fecha de graduacion proporcionada por el coordinador',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ciclos_propedeuticos_2`.`user_cycle_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ciclos_propedeuticos_2`.`user_cycle_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `cycle_id` INT NOT NULL,
  `request_degree_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_cycle_request_user1_idx` (`user_id` ASC),
  INDEX `fk_user_cycle_request_cycle1_idx` (`cycle_id` ASC),
  INDEX `fk_user_cycle_request_degree_request1_idx` (`request_degree_id` ASC),
  CONSTRAINT `fk_user_cycle_request_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ciclos_propedeuticos_2`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_cycle_request_cycle1`
    FOREIGN KEY (`cycle_id`)
    REFERENCES `ciclos_propedeuticos_2`.`cycle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_cycle_request_degree_request1`
    FOREIGN KEY (`request_degree_id`)
    REFERENCES `ciclos_propedeuticos_2`.`degree_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
