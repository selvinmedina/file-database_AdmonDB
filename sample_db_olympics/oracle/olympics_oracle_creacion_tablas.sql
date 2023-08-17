CREATE SCHEMA olympics
USE olympics;

CREATE TABLE medal (
  id NUMBER(11) NOT NULL,
  medal_name varchar2(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE noc_region (
  id NUMBER(11) NOT NULL,
  noc varchar2(5) DEFAULT NULL,
  region_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sport (
  id NUMBER(11) NOT NULL,
  sport_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE city (
  id NUMBER(11) NOT NULL,
  city_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE event (
  id NUMBER(11) NOT NULL,
  sport_id NUMBER(11) DEFAULT NULL,
  event_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_ev_sp FOREIGN KEY (sport_id) REFERENCES sport (id)
);

CREATE TABLE games (
  id NUMBER(11) NOT NULL,
  games_year NUMBER(11) DEFAULT NULL,
  games_name varchar2(100) DEFAULT NULL,
  season varchar2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE games_city (
  games_id NUMBER(11) DEFAULT NULL,
  city_id NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_gci_city FOREIGN KEY (city_id) REFERENCES city (id),
  CONSTRAINT fk_gci_gam FOREIGN KEY (games_id) REFERENCES games (id)
);

CREATE TABLE person (
  id NUMBER(11) NOT NULL,
  full_name varchar2(500) DEFAULT NULL,
  gender varchar2(10) DEFAULT NULL,
  height NUMBER(11) DEFAULT NULL,
  weight NUMBER(11) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE person_region (
  person_id NUMBER(11) DEFAULT NULL,
  region_id NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_per_per FOREIGN KEY (person_id) REFERENCES person (id),
  CONSTRAINT fk_per_reg FOREIGN KEY (region_id) REFERENCES noc_region (id)
);

CREATE TABLE games_competitor (
  id NUMBER(11) NOT NULL,
  games_id NUMBER(11) DEFAULT NULL,
  person_id NUMBER(11) DEFAULT NULL,
  age NUMBER(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_gc_gam FOREIGN KEY (games_id) REFERENCES games (id),
  CONSTRAINT fk_gc_per FOREIGN KEY (person_id) REFERENCES person (id)
);

CREATE TABLE competitor_event (
  event_id NUMBER(11) DEFAULT NULL,
  competitor_id NUMBER(11) DEFAULT NULL,
  medal_id NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_ce_com FOREIGN KEY (competitor_id) REFERENCES games_competitor (id),
  CONSTRAINT fk_ce_ev FOREIGN KEY (event_id) REFERENCES event (id),
  CONSTRAINT fk_ce_med FOREIGN KEY (medal_id) REFERENCES medal (id)
);