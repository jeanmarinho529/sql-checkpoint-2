-- MySQL Script generated by MySQL Workbench
-- dom 03 abr 2022 15:47:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema delivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema delivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `delivery` ;
USE `delivery` ;

-- -----------------------------------------------------
-- Table `delivery`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`vehicles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`drivers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` CHAR(11) NOT NULL,
  `phone` VARCHAR(13) NULL,
  `user_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  INDEX `fk_drivers_users_idx` (`user_id` ASC),
  INDEX `fk_drivers_status_idx` (`status_id` ASC),
  INDEX `fk_drivers_vehicles_idx` (`vehicle_id` ASC),
  CONSTRAINT `fk_drivers_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `delivery`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drivers_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `delivery`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drivers_vehicles`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `delivery`.`vehicles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` CHAR(14) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(13) NULL,
  `user_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC),
  INDEX `fk_stores_users_idx` (`user_id` ASC),
  INDEX `fk_stores_status_idx` (`status_id` ASC),
  CONSTRAINT `fk_stores_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `delivery`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stores_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `delivery`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  `client_name` VARCHAR(150) NOT NULL,
  `client_phone` VARCHAR(13) NULL,
  `driver_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_drivers_idx` (`driver_id` ASC),
  INDEX `fk_orders_stores_idx` (`store_id` ASC),
  INDEX `fk_orders_status_idx` (`status_id` ASC),
  CONSTRAINT `fk_orders_drivers`
    FOREIGN KEY (`driver_id`)
    REFERENCES `delivery`.`drivers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_stores`
    FOREIGN KEY (`store_id`)
    REFERENCES `delivery`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `delivery`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery`.`orders_x_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery`.`orders_x_products` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `fk_orders_has_products_products_idx` (`product_id` ASC),
  INDEX `fk_orders_has_products_orders_idx` (`order_id` ASC),
  CONSTRAINT `fk_orders_has_products_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `delivery`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `delivery`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
