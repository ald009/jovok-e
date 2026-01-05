-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Jovok_e
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Jovok_e
-- -----------------------------------------------------
drop database if exists Jovok_e;

CREATE SCHEMA IF NOT EXISTS `Jovok_e` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci ;
USE `Jovok_e` ;

-- -----------------------------------------------------
-- Table `Jovok_e`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`teams` (
  `idteams` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(255) NOT NULL COMMENT 'Csapat neve',
  `sport_type` VARCHAR(255) NOT NULL COMMENT 'Sport típusa',
  `home_city` VARCHAR(255) NOT NULL COMMENT 'Város',
  `level` SET('hobbi', 'amatőr', 'félprofi') NOT NULL COMMENT 'Szintje a csapatnak (hobbi, amatőr,félprofi)',
  PRIMARY KEY (`idteams`),
  UNIQUE INDEX `team_name_UNIQUE` (`team_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`captains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`captains` (
  `idcaptains` INT NOT NULL AUTO_INCREMENT,
  `captain_name` VARCHAR(255) NOT NULL COMMENT 'Kapitány neve',
  PRIMARY KEY (`idcaptains`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`players` (
  `idplayers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL COMMENT 'név',
  `email` VARCHAR(100) NOT NULL COMMENT 'player email',
  `phone_number` VARCHAR(45) NOT NULL COMMENT 'telefonszám stringben\n',
  `reliability_rate` TINYINT NOT NULL DEFAULT 100 COMMENT 'megbízhatósági százalék\n',
  PRIMARY KEY (`idplayers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`teams_has_captains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`teams_has_captains` (
  `teams_idteams` INT NOT NULL,
  `captains_idcaptains` INT NOT NULL,
  PRIMARY KEY (`teams_idteams`, `captains_idcaptains`),
  INDEX `fk_teams_has_captains_captains1_idx` (`captains_idcaptains` ASC) VISIBLE,
  INDEX `fk_teams_has_captains_teams_idx` (`teams_idteams` ASC) VISIBLE,
  CONSTRAINT `fk_teams_has_captains_teams`
    FOREIGN KEY (`teams_idteams`)
    REFERENCES `Jovok_e`.`teams` (`idteams`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_has_captains_captains1`
    FOREIGN KEY (`captains_idcaptains`)
    REFERENCES `Jovok_e`.`captains` (`idcaptains`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`positions` (
  `idpositions` INT NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(45) NOT NULL COMMENT 'pozíció',
  PRIMARY KEY (`idpositions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`players_has_positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`players_has_positions` (
  `players_idplayers` INT NOT NULL,
  `positions_idpositions` INT NOT NULL,
  PRIMARY KEY (`players_idplayers`, `positions_idpositions`),
  INDEX `fk_players_has_positions_positions1_idx` (`positions_idpositions` ASC) VISIBLE,
  INDEX `fk_players_has_positions_players1_idx` (`players_idplayers` ASC) VISIBLE,
  CONSTRAINT `fk_players_has_positions_players1`
    FOREIGN KEY (`players_idplayers`)
    REFERENCES `Jovok_e`.`players` (`idplayers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_has_positions_positions1`
    FOREIGN KEY (`positions_idpositions`)
    REFERENCES `Jovok_e`.`positions` (`idpositions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`events` (
  `idevents` INT NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NOT NULL COMMENT 'esemény kezdete',
  `end_date` DATETIME NOT NULL COMMENT 'esemény vége',
  `min_participation` TINYINT NOT NULL DEFAULT 10 COMMENT 'minimum létszám',
  `max_participation` TINYINT NOT NULL DEFAULT 16 COMMENT 'maximum létszám',
  `event_type` SET('Edzés', 'Mérkőzés') NOT NULL,
  `place` VARCHAR(200) NOT NULL COMMENT 'Esemény helyszíne',
  `price` VARCHAR(255) NULL COMMENT 'egyéb költségek',
  `text_messega` MEDIUMTEXT NULL COMMENT 'egyéb szöveg',
  `expected_members` TINYINT NOT NULL DEFAULT 10 COMMENT 'várható létszám',
  `real_members` TINYINT NULL COMMENT 'Tényleges részvétel',
  PRIMARY KEY (`idevents`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`teams_has_players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`teams_has_players` (
  `teams_idteams` INT NOT NULL,
  `players_idplayers` INT NOT NULL,
  PRIMARY KEY (`teams_idteams`, `players_idplayers`),
  INDEX `fk_teams_has_players_players1_idx` (`players_idplayers` ASC) VISIBLE,
  INDEX `fk_teams_has_players_teams1_idx` (`teams_idteams` ASC) VISIBLE,
  CONSTRAINT `fk_teams_has_players_teams1`
    FOREIGN KEY (`teams_idteams`)
    REFERENCES `Jovok_e`.`teams` (`idteams`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_has_players_players1`
    FOREIGN KEY (`players_idplayers`)
    REFERENCES `Jovok_e`.`players` (`idplayers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`reply` (
  `idreply` INT NOT NULL AUTO_INCREMENT,
  `state` SET('Jön', 'Talán', 'Nem jön') NOT NULL COMMENT '3 lehetőség közül egyiket választja, ez lesz a reply',
  `replytext` TEXT NULL COMMENT 'Egyéb információ',
  `replytimestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'a reply időbélyege',
  `players_idplayers` INT NOT NULL,
  PRIMARY KEY (`idreply`, `players_idplayers`),
  INDEX `fk_reply_players1_idx` (`players_idplayers` ASC) VISIBLE,
  CONSTRAINT `fk_reply_players1`
    FOREIGN KEY (`players_idplayers`)
    REFERENCES `Jovok_e`.`players` (`idplayers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`events_has_reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`events_has_reply` (
  `events_idevents` INT NOT NULL,
  `reply_idreply` INT NOT NULL,
  `reply_players_idplayers` INT NOT NULL,
  `messages` TEXT NULL COMMENT 'playerek közötti beszélgetés, elérhető ebből a player és az event tábla is, nem hiszem hogy így kéne amúgy',
  `team_post` VARCHAR(200) NULL COMMENT 'Csapat beosztás',
  PRIMARY KEY (`events_idevents`, `reply_idreply`, `reply_players_idplayers`),
  INDEX `fk_events_has_reply_reply1_idx` (`reply_idreply` ASC, `reply_players_idplayers` ASC) VISIBLE,
  INDEX `fk_events_has_reply_events1_idx` (`events_idevents` ASC) VISIBLE,
  CONSTRAINT `fk_events_has_reply_events1`
    FOREIGN KEY (`events_idevents`)
    REFERENCES `Jovok_e`.`events` (`idevents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_reply_reply1`
    FOREIGN KEY (`reply_idreply` , `reply_players_idplayers`)
    REFERENCES `Jovok_e`.`reply` (`idreply` , `players_idplayers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`events_has_captains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`events_has_captains` (
  `events_idevents` INT NOT NULL,
  `captains_idcaptains` INT NOT NULL,
  PRIMARY KEY (`events_idevents`, `captains_idcaptains`),
  INDEX `fk_events_has_captains_captains1_idx` (`captains_idcaptains` ASC) VISIBLE,
  INDEX `fk_events_has_captains_events1_idx` (`events_idevents` ASC) VISIBLE,
  CONSTRAINT `fk_events_has_captains_events1`
    FOREIGN KEY (`events_idevents`)
    REFERENCES `Jovok_e`.`events` (`idevents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_captains_captains1`
    FOREIGN KEY (`captains_idcaptains`)
    REFERENCES `Jovok_e`.`captains` (`idcaptains`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jovok_e`.`events_has_reply_has_captains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jovok_e`.`events_has_reply_has_captains` (
  `events_has_reply_events_idevents` INT NOT NULL,
  `events_has_reply_reply_idreply` INT NOT NULL,
  `events_has_reply_reply_players_idplayers` INT NOT NULL,
  `captains_idcaptains` INT NOT NULL,
  PRIMARY KEY (`events_has_reply_events_idevents`, `events_has_reply_reply_idreply`, `events_has_reply_reply_players_idplayers`, `captains_idcaptains`),
  INDEX `fk_events_has_reply_has_captains_captains1_idx` (`captains_idcaptains` ASC) VISIBLE,
  INDEX `fk_events_has_reply_has_captains_events_has_reply1_idx` (`events_has_reply_events_idevents` ASC, `events_has_reply_reply_idreply` ASC, `events_has_reply_reply_players_idplayers` ASC) VISIBLE,
  CONSTRAINT `fk_events_has_reply_has_captains_events_has_reply1`
    FOREIGN KEY (`events_has_reply_events_idevents` , `events_has_reply_reply_idreply` , `events_has_reply_reply_players_idplayers`)
    REFERENCES `Jovok_e`.`events_has_reply` (`events_idevents` , `reply_idreply` , `reply_players_idplayers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_reply_has_captains_captains1`
    FOREIGN KEY (`captains_idcaptains`)
    REFERENCES `Jovok_e`.`captains` (`idcaptains`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
