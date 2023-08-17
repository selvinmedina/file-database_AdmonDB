CREATE TABLE alignment (
  id NUMBER(11) NOT NULL,
  alignment varchar2(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE attribute (
  id NUMBER(11) NOT NULL,
  attribute_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE colour (
  id NUMBER(11) NOT NULL,
  colour varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE gender (
  id NUMBER(11) NOT NULL,
  gender varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE publisher (
  id NUMBER(11) NOT NULL,
  publisher_name varchar2(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE race (
  id NUMBER(11) NOT NULL,
  race varchar2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superhero (
  id number(11) NOT NULL,
  superhero_name varchar2(200) DEFAULT NULL,
  full_name varchar2(200) DEFAULT NULL,
  gender_id number(11) DEFAULT NULL,
  eye_colour_id number(11) DEFAULT NULL,
  hair_colour_id number(11) DEFAULT NULL,
  skin_colour_id number(11) DEFAULT NULL,
  race_id number(11) DEFAULT NULL,
  publisher_id number(11) DEFAULT NULL,
  alignment_id number(11) DEFAULT NULL,
  height_cm number(11) DEFAULT NULL,
  weight_kg number(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sup_align FOREIGN KEY (alignment_id) REFERENCES alignment (id),
  CONSTRAINT fk_sup_eyecol FOREIGN KEY (eye_colour_id) REFERENCES colour (id),
  CONSTRAINT fk_sup_gen FOREIGN KEY (gender_id) REFERENCES gender (id),
  CONSTRAINT fk_sup_haircol FOREIGN KEY (hair_colour_id) REFERENCES colour (id),
  CONSTRAINT fk_sup_pub FOREIGN KEY (publisher_id) REFERENCES publisher (id),
  CONSTRAINT fk_sup_race FOREIGN KEY (race_id) REFERENCES race (id),
  CONSTRAINT fk_sup_skincol FOREIGN KEY (skin_colour_id) REFERENCES colour (id)
);


CREATE TABLE hero_attribute (
  hero_id number(11) DEFAULT NULL,
  attribute_id number(11) DEFAULT NULL,
  attribute_value number(11) DEFAULT NULL,
  CONSTRAINT fk_hat_at FOREIGN KEY (attribute_id) REFERENCES attribute (id),
  CONSTRAINT fk_hat_hero FOREIGN KEY (hero_id) REFERENCES superhero (id)
);

CREATE TABLE superpower (
  id number(11) NOT NULL,
  power_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE hero_power (
  hero_id NUMBER(11) DEFAULT NULL,
  power_id NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_hpo_hero FOREIGN KEY (hero_id) REFERENCES superhero (id),
  CONSTRAINT fk_hpo_po FOREIGN KEY (power_id) REFERENCES superpower (id)
);

