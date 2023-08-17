CREATE DATABASE universities;


CREATE TABLE universities.dbo.country (
  id INT NOT NULL,
  country_name VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE universities.dbo.ranking_system (
  id INT NOT NULL,
  system_name VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE universities.dbo.ranking_criteria (
  id INT NOT NULL,
  ranking_system_id INT DEFAULT NULL,
  criteria_name VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_rc_rs FOREIGN KEY (ranking_system_id) REFERENCES universities.dbo.ranking_system (id)
);

CREATE TABLE universities.dbo.university (
  id INT NOT NULL,
  country_id INT DEFAULT NULL,
  university_name VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_uni_cnt FOREIGN KEY (country_id) REFERENCES universities.dbo.country (id)
);

CREATE TABLE universities.dbo.university_year (
  university_id INT DEFAULT NULL,
  year INT DEFAULT NULL,
  num_students INT DEFAULT NULL,
  student_staff_ratio decimal(6,2) DEFAULT NULL,
  pct_international_students INT DEFAULT NULL,
  pct_female_students INT DEFAULT NULL,
  CONSTRAINT fk_uy_uni FOREIGN KEY (university_id) REFERENCES universities.dbo.university (id)
);

CREATE TABLE universities.dbo.university_ranking_year (
  university_id INT DEFAULT NULL,
  ranking_criteria_id INT DEFAULT NULL,
  year INT DEFAULT NULL,
  score INT DEFAULT NULL,
  CONSTRAINT fk_ury_rc FOREIGN KEY (ranking_criteria_id) REFERENCES universities.dbo.ranking_criteria (id),
  CONSTRAINT fk_ury_uni FOREIGN KEY (university_id) REFERENCES universities.dbo.university (id)
);