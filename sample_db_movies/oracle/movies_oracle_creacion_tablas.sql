CREATE TABLE country (
  country_id NUMBER(10) NOT NULL,
  country_iso_code varchar2(10) DEFAULT NULL,
  country_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (country_id)
);

CREATE TABLE gender (
  gender_id NUMBER(10) NOT NULL,
  gender varchar2(20) DEFAULT NULL,
  PRIMARY KEY (gender_id)
);

CREATE TABLE genre (
  genre_id NUMBER(10) NOT NULL,
  genre_name varchar2(100) DEFAULT NULL,
  PRIMARY KEY (genre_id)
);

CREATE TABLE language (
  language_id NUMBER(10) NOT NULL,
  language_code varchar2(10) DEFAULT NULL,
  language_name varchar2(500) DEFAULT NULL,
  PRIMARY KEY (language_id)
);

CREATE TABLE language_role (
  role_id NUMBER(10) NOT NULL,
  language_role varchar2(20) DEFAULT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE department (
  department_id NUMBER(10) NOT NULL,
  department_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (department_id)
);



































