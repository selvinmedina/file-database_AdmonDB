CREATE DATABASE superhero;

CREATE TABLE superhero.dbo.alignment (
  id INT NOT NULL,
  alignment VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.attribute (
  id INT NOT NULL,
  attribute_name VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.colour (
  id INT NOT NULL,
  colour VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.gender (
  id INT NOT NULL,
  gender VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.publisher (
  id INT NOT NULL,
  publisher_name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.race (
  id INT NOT NULL,
  race VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.superhero (
  id INT NOT NULL,
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
  PRIMARY KEY (id),
  CONSTRAINT fk_sup_align FOREIGN KEY (alignment_id) REFERENCES superhero.dbo.alignment (id),
  CONSTRAINT fk_sup_eyecol FOREIGN KEY (eye_colour_id) REFERENCES superhero.dbo.colour (id),
  CONSTRAINT fk_sup_gen FOREIGN KEY (gender_id) REFERENCES superhero.dbo.gender (id),
  CONSTRAINT fk_sup_haircol FOREIGN KEY (hair_colour_id) REFERENCES superhero.dbo.colour (id),
  CONSTRAINT fk_sup_pub FOREIGN KEY (publisher_id) REFERENCES superhero.dbo.publisher (id),
  CONSTRAINT fk_sup_race FOREIGN KEY (race_id) REFERENCES superhero.dbo.race (id),
  CONSTRAINT fk_sup_skincol FOREIGN KEY (skin_colour_id) REFERENCES superhero.dbo.colour (id)
);

CREATE TABLE superhero.dbo.superpower (
  id INT NOT NULL,
  power_name VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero.dbo.hero_attribute (
  hero_id INT DEFAULT NULL,
  attribute_id INT DEFAULT NULL,
  attribute_value INT DEFAULT NULL,
  CONSTRAINT fk_hat_at FOREIGN KEY (attribute_id) REFERENCES superhero.dbo.attribute (id),
  CONSTRAINT fk_hat_hero FOREIGN KEY (hero_id) REFERENCES superhero.dbo.superhero (id)
);

CREATE TABLE superhero.dbo.hero_power (
  hero_id INT DEFAULT NULL,
  power_id INT DEFAULT NULL,
  CONSTRAINT fk_hpo_hero FOREIGN KEY (hero_id) REFERENCES superhero.dbo.superhero (id),
  CONSTRAINT fk_hpo_po FOREIGN KEY (power_id) REFERENCES superhero.dbo.superpower (id)
);