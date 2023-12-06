SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_game_store` DEFAULT CHARACTER SET utf8 ;
USE `online_game_store` ;

-- -----------------------------------------------------
-- Table `online_game_store`.`developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`developer` (
  `developer_id` INT NOT NULL,
  `developer_name` VARCHAR(45) NULL,
  `about_description` TEXT NULL,
  `developer_url` VARCHAR(45) NULL,
  PRIMARY KEY (`developer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`rating_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`rating_type` (
  `rating_type_id` INT NOT NULL,
  `rating_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`rating_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`review_rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`review_rating` (
  `review_rating_id` INT NOT NULL,
  `review_rating_type` VARCHAR(45) NULL,
  `rating_type_rating_type_id` INT NOT NULL,
  PRIMARY KEY (`review_rating_id`),
  INDEX `fk_review_rating_rating_type1_idx` (`rating_type_rating_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_rating_rating_type1`
    FOREIGN KEY (`rating_type_rating_type_id`)
    REFERENCES `online_game_store`.`rating_type` (`rating_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`game` (
  `game_id` INT NOT NULL,
  `game_title` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `age_requirement` BIT(1) NULL,
  `image_list_id` INT NOT NULL,
  `store_library_store_library_id` INT NOT NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  `developer_id` INT NOT NULL,
  `release_date` DATE NULL,
  `dlc_id` INT NOT NULL,
  `review_rating_id` INT NOT NULL,
  `minium_system_requirement` TEXT NULL,
  `recommend_system_requirement` TEXT NULL,
  PRIMARY KEY (`game_id`),
  INDEX `fk_game_developer1_idx` (`developer_id` ASC) VISIBLE,
  INDEX `fk_game_game1_idx` (`dlc_id` ASC) VISIBLE,
  INDEX `fk_game_review_rating1_idx` (`review_rating_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `online_game_store`.`developer` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_game1`
    FOREIGN KEY (`dlc_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_review_rating1`
    FOREIGN KEY (`review_rating_id`)
    REFERENCES `online_game_store`.`review_rating` (`review_rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`role` (
  `role_id` INT NOT NULL,
  `role_name` VARCHAR(45) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`user_account` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `role_role_id` INT NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_user_account_detail_role1_idx` (`role_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_account_detail_role1`
    FOREIGN KEY (`role_role_id`)
    REFERENCES `online_game_store`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`user` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `birthday` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_user_account_detail1_idx` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_user_user_account_detail1`
    FOREIGN KEY (`email`)
    REFERENCES `online_game_store`.`user_account` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`cart` (
  `cart_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `fk_cart_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `online_game_store`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`bundle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`bundle` (
  `bundle_id` INT NOT NULL,
  `price` VARCHAR(45) NULL,
  PRIMARY KEY (`bundle_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`image_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`image_type` (
  `image_type_id` INT NOT NULL,
  `image_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`image_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`image` (
  `image_id` INT NOT NULL,
  `url` VARCHAR(45) NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  `game_game_id` INT NOT NULL,
  `image_type_image_type_id` INT NOT NULL,
  PRIMARY KEY (`image_id`),
  INDEX `fk_image_game1_idx` (`game_game_id` ASC) VISIBLE,
  INDEX `fk_image_image_type1_idx` (`image_type_image_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_image_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_image_type1`
    FOREIGN KEY (`image_type_image_type_id`)
    REFERENCES `online_game_store`.`image_type` (`image_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`video` (
  `video_id` INT NOT NULL,
  `url` VARCHAR(45) NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  `game_game_id` INT NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`tag` (
  `tag_id` INT NOT NULL,
  `tag_name` VARCHAR(45) NULL,
  `short_description` VARCHAR(45) NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`game_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`game_tag` (
  `game_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`game_id`, `tag_id`),
  INDEX `fk_game_has_tags_tags1_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_game_has_tags_game1_idx` (`game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_tags_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `online_game_store`.`tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`game_in_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`game_in_cart` (
  `cart_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `amount` INT NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`cart_id`, `game_id`),
  INDEX `fk_cart_has_game_game1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_cart_has_game_cart1_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_has_game_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `online_game_store`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`bundle_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`bundle_has_game` (
  `game_id` INT NOT NULL,
  `bundle_id` INT NOT NULL,
  PRIMARY KEY (`game_id`, `bundle_id`),
  INDEX `fk_game_has_bundle_bundle1_idx` (`bundle_id` ASC) VISIBLE,
  INDEX `fk_game_has_bundle_game1_idx` (`game_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_bundle_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_bundle_bundle1`
    FOREIGN KEY (`bundle_id`)
    REFERENCES `online_game_store`.`bundle` (`bundle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_game_store`.`user_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_game_store`.`user_has_game` (
  `user_user_id` INT NOT NULL,
  `game_game_id` INT NOT NULL,
  `is_deleted` BIT(1) NULL DEFAULT 0,
  `is_bought` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_user_id`, `game_game_id`),
  INDEX `fk_user_has_game_game1_idx` (`game_game_id` ASC) VISIBLE,
  INDEX `fk_user_has_game_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_game_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `online_game_store`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_game_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `online_game_store`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
