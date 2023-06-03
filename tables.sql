DROP TABLE IF EXISTS `refacademicas`.`article_author` ;
DROP TABLE IF EXISTS `refacademicas`.`article_keyword` ;
DROP TABLE IF EXISTS `refacademicas`.`author` ;
DROP TABLE IF EXISTS `refacademicas`.`article_collection` ;

DROP TABLE IF EXISTS `refacademicas`.`quote` ;
DROP TABLE IF EXISTS `refacademicas`.`article` ;
DROP TABLE IF EXISTS `refacademicas`.`keyword` ;
DROP TABLE IF EXISTS `refacademicas`.`collection` ;


-- -----------------------------------------------------
-- Table `refacademicas`.`author`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`author` (
  `author_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `email` VARCHAR(45) NULL,
  `phone_number` VARCHAR(16) NULL,
  `institution` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `refacademicas`.`article`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`article` (
  `article_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `page_num` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `abstract` MEDIUMTEXT NULL,
  PRIMARY KEY (`article_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `refacademicas`.`keyword`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`keyword` (
  `keyword_id` INT NOT NULL,
  `word` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `refacademicas`.`quote`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`quote` (
  `quote_id` INT NOT NULL,
  `origin_article_id` INT NOT NULL,
  `cited_article_id` INT NULL,
  PRIMARY KEY (`quote_id`),
  FOREIGN KEY (origin_article_id) REFERENCES article(article_id) ON DELETE CASCADE,
  FOREIGN KEY (cited_article_id) REFERENCES article(article_id) ON DELETE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `refacademicas`.`collection`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`collection` (
  `collection_id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`collection_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `refacademicas`.`article_author`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`article_author` (
  `article_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`article_id`,`author_id`),
  FOREIGN KEY (article_id) REFERENCES article(article_id) ON DELETE CASCADE,
  FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `refacademicas`.`article_keyword`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`article_keyword` (
  `article_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`article_id`,`keyword_id`),
  FOREIGN KEY (article_id) REFERENCES article(article_id) ON DELETE CASCADE,
  FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id) ON DELETE CASCADE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `refacademicas`.`article_collection`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `refacademicas`.`article_collection` (
  `article_id` INT NOT NULL,
  `collection_id` INT NOT NULL,
  FOREIGN KEY (article_id) REFERENCES article(article_id) ON DELETE CASCADE,
  FOREIGN KEY (collection_id) REFERENCES collection(collection_id) ON DELETE CASCADE)
ENGINE = InnoDB;

