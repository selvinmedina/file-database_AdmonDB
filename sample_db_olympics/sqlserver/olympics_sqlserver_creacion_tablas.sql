CREATE DATABASE olympics;
GO

CREATE TABLE olympics.dbo.medal (
  id INT NOT NULL,
  medal_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE olympics.dbo.noc_region (
  id INT NOT NULL,
  noc varchar(5) DEFAULT NULL,
  region_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE olympics.dbo.sport (
  id INT NOT NULL,
  sport_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE olympics.dbo.city (
  id INT NOT NULL,
  city_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE olympics.dbo.event (
  id INT NOT NULL,
  sport_id INT DEFAULT NULL,
  event_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_ev_sp FOREIGN KEY (sport_id) REFERENCES olympics.dbo.sport (id)
);

CREATE TABLE olympics.dbo.games (
  id INT NOT NULL,
  games_year INT DEFAULT NULL,
  games_name varchar(100) DEFAULT NULL,
  season varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE olympics.dbo.games_city (
  games_id INT DEFAULT NULL,
  city_id INT DEFAULT NULL,
  CONSTRAINT fk_gci_city FOREIGN KEY (city_id) REFERENCES olympics.dbo.city (id),
  CONSTRAINT fk_gci_gam FOREIGN KEY (games_id) REFERENCES olympics.dbo.games (id)
);

CREATE TABLE olympics.dbo.person (
  id INT NOT NULL,
  full_name varchar(500) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  height INT DEFAULT NULL,
  weight INT DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE olympics.dbo.person_region (
  person_id INT DEFAULT NULL,
  region_id INT DEFAULT NULL,
  CONSTRAINT fk_per_per FOREIGN KEY (person_id) REFERENCES olympics.dbo.person (id),
  CONSTRAINT fk_per_reg FOREIGN KEY (region_id) REFERENCES olympics.dbo.noc_region (id)
);

CREATE TABLE olympics.dbo.games_competitor (
  id INT NOT NULL,
  games_id INT DEFAULT NULL,
  person_id INT DEFAULT NULL,
  age INT DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_gc_gam FOREIGN KEY (games_id) REFERENCES olympics.dbo.games (id),
  CONSTRAINT fk_gc_per FOREIGN KEY (person_id) REFERENCES olympics.dbo.person (id)
);

CREATE TABLE competitor_event (
  event_id INT DEFAULT NULL,
  competitor_id INT DEFAULT NULL,
  medal_id INT DEFAULT NULL,
  CONSTRAINT fk_ce_com FOREIGN KEY (competitor_id) REFERENCES olympics.dbo.games_competitor (id),
  CONSTRAINT fk_ce_ev FOREIGN KEY (event_id) REFERENCES olympics.dbo.event (id),
  CONSTRAINT fk_ce_med FOREIGN KEY (medal_id) REFERENCES olympics.dbo.medal (id)
);