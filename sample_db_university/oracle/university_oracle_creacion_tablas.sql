CREATE TABLE country (
  id NUMBER(11) NOT NULL,
  country_name VARCHAR2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE ranking_system (
  id NUMBER(11) NOT NULL,
  system_name VARCHAR2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ranking_criteria (
  id NUMBER(11) NOT NULL,
  ranking_system_id NUMBER(11) DEFAULT NULL,
  criteria_name VARCHAR2(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_rc_rs FOREIGN KEY (ranking_system_id) REFERENCES ranking_system (id)
);

CREATE TABLE university (
  id NUMBER(11) NOT NULL,
  country_id NUMBER(11) DEFAULT NULL,
  university_name VARCHAR2(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_uni_cnt FOREIGN KEY (country_id) REFERENCES country (id)
);

CREATE TABLE university_year (
  university_id NUMBER(11) DEFAULT NULL,
  year NUMBER(11) DEFAULT NULL,
  num_students NUMBER(11) DEFAULT NULL,
  student_staff_ratio decimal(6,2) DEFAULT NULL,
  pct_international_students NUMBER(11) DEFAULT NULL,
  pct_female_students NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_uy_uni FOREIGN KEY (university_id) REFERENCES university (id)
);

CREATE TABLE university_ranking_year (
  university_id NUMBER(11) DEFAULT NULL,
  ranking_criteria_id NUMBER(11) DEFAULT NULL,
  year NUMBER(11) DEFAULT NULL,
  score NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_ury_rc FOREIGN KEY (ranking_criteria_id) REFERENCES ranking_criteria (id),
  CONSTRAINT fk_ury_uni FOREIGN KEY (university_id) REFERENCES university (id)
);