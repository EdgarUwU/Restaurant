-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `restaurante` ;

-- -----------------------------------------------------
-- Table `restaurante`.`cantantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`cantantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `contrasena` VARCHAR(200) NOT NULL,
  `info` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurante`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`canciones` (
  `id` INT NOT NULL,
  `id_cantantes` INT NOT NULL,
  `sound` VARCHAR(200) NOT NULL,
  `info` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sound_UNIQUE` (`sound` ASC) VISIBLE,
  INDEX `fk_cantantes_idx` (`id_cantantes` ASC) VISIBLE,
  CONSTRAINT `fk_cantantes`
    FOREIGN KEY (`id_cantantes`)
    REFERENCES `restaurante`.`cantantes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurante`.`peticiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`peticiones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_canciones` INT NOT NULL,
  `info` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_canciones_idx` (`id_canciones` ASC) VISIBLE,
  CONSTRAINT `fk_canciones`
    FOREIGN KEY (`id_canciones`)
    REFERENCES `restaurante`.`canciones` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
