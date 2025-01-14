CREATE DATABASE superhero;
CREATE TABLE superhero.alignment (
  id INT NOT NULL AUTO_INCREMENT,
  alignment varchar(10) DEFAULT NULL,
  CONSTRAINT pk_alignment PRIMARY KEY (id)
);

CREATE TABLE superhero.attribute (
  id INT NOT NULL AUTO_INCREMENT,
  attribute_name varchar(200) DEFAULT NULL,
  CONSTRAINT pk_attribute PRIMARY KEY (id)
);

CREATE TABLE superhero.colour (
  id INT NOT NULL AUTO_INCREMENT,
  colour varchar(20) DEFAULT NULL,
  CONSTRAINT pk_colour PRIMARY KEY (id)
);

CREATE TABLE superhero.comic (
  id INT NOT NULL AUTO_INCREMENT,
  comic_name VARCHAR(200) DEFAULT NULL,
  issue INT DEFAULT NULL,
  publish_month INT DEFAULT NULL,
  publish_year INT DEFAULT NULL,
  CONSTRAINT pk_comic PRIMARY KEY (id)
);

CREATE TABLE superhero.gender (
  id INT NOT NULL AUTO_INCREMENT,
  gender varchar(20) DEFAULT NULL,
  CONSTRAINT pk_gender PRIMARY KEY (id)
);

CREATE TABLE superhero.publisher (
  id INT NOT NULL AUTO_INCREMENT,
  publisher_name varchar(50) DEFAULT NULL,
  CONSTRAINT pk_publisher PRIMARY KEY (id)
);

CREATE TABLE superhero.race (
  id INT NOT NULL AUTO_INCREMENT,
  race varchar(100) DEFAULT NULL,
  CONSTRAINT pk_race PRIMARY KEY (id)
);

CREATE TABLE superhero.superhero (
  id INT NOT NULL AUTO_INCREMENT,
  superhero_name VARCHAR(200) DEFAULT NULL,
  full_name VARCHAR(200) DEFAULT NULL,
  gender_id INT DEFAULT NULL,
  eye_colour_id INT DEFAULT NULL,
  hair_colour_id INT DEFAULT NULL,
  skin_colour_id INT DEFAULT NULL,
  race_id INT DEFAULT NULL,
  publisher_id INT DEFAULT NULL,
  alignment_id INT DEFAULT NULL,
  height_cm INT DEFAULT NULL,
  weight_kg INT DEFAULT NULL,
  CONSTRAINT pk_superhero PRIMARY KEY (id),
  CONSTRAINT fk_sup_align FOREIGN KEY (alignment_id) REFERENCES superhero.alignment (id),
  CONSTRAINT fk_sup_eyecol FOREIGN KEY (eye_colour_id) REFERENCES superhero.colour (id),
  CONSTRAINT fk_sup_gen FOREIGN KEY (gender_id) REFERENCES superhero.gender (id),
  CONSTRAINT fk_sup_haircol FOREIGN KEY (hair_colour_id) REFERENCES superhero.colour (id),
  CONSTRAINT fk_sup_pub FOREIGN KEY (publisher_id) REFERENCES superhero.publisher (id),
  CONSTRAINT fk_sup_race FOREIGN KEY (race_id) REFERENCES superhero.race (id),
  CONSTRAINT fk_sup_skincol FOREIGN KEY (skin_colour_id) REFERENCES superhero.colour (id)
);

CREATE TABLE superhero.superpower (
  id INT NOT NULL AUTO_INCREMENT,
  power_name varchar(200) DEFAULT NULL,
  CONSTRAINT pk_superpower PRIMARY KEY (id)
);

CREATE TABLE superhero.hero_attribute (
  hero_id INT DEFAULT NULL,
  attribute_id INT DEFAULT NULL,
  attribute_value INT DEFAULT NULL,
  CONSTRAINT fk_hat_at FOREIGN KEY (attribute_id) REFERENCES attribute (id),
  CONSTRAINT fk_hat_hero FOREIGN KEY (hero_id) REFERENCES superhero (id)
);

CREATE TABLE superhero.hero_power (
  hero_id INT DEFAULT NULL,
  power_id INT DEFAULT NULL,
  CONSTRAINT fk_hpo_hero FOREIGN KEY (hero_id) REFERENCES superhero.superhero (id),
  CONSTRAINT fk_hpo_po FOREIGN KEY (power_id) REFERENCES superhero.superpower (id)
);
