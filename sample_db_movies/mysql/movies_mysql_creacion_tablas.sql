
CREATE DATABASE movies;
use movies;

CREATE TABLE movies.country (
  country_id INT NOT NULL AUTO_INCREMENT,
  country_iso_code VARCHAR(10) DEFAULT NULL,
  country_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_country PRIMARY KEY (country_id)
);

CREATE TABLE movies.gender (
  gender_id INT NOT NULL,
  gender VARCHAR(20) DEFAULT NULL,
  CONSTRAINT pk_gender PRIMARY KEY (gender_id)
);

CREATE TABLE movies.genre (
  genre_id INT NOT NULL,
  genre_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_genre PRIMARY KEY (genre_id)
);

CREATE TABLE movies.language (
  language_id INT NOT NULL AUTO_INCREMENT,
  language_code VARCHAR(10) DEFAULT NULL,
  language_name VARCHAR(500) DEFAULT NULL,
  CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE movies.language_role (
  role_id INT NOT NULL,
  language_role VARCHAR(20) DEFAULT NULL,
  CONSTRAINT pk_langrole PRIMARY KEY (role_id)
);

CREATE TABLE movies.department (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_department PRIMARY KEY (department_id)
);

CREATE TABLE movies.keyword (
  keyword_id INT NOT NULL,
  keyword_name varchar(100) DEFAULT NULL,
  CONSTRAINT pk_keyword PRIMARY KEY (keyword_id)
);

CREATE TABLE movies.person (
  person_id INT NOT NULL,
  person_name varchar(500) DEFAULT NULL,
  CONSTRAINT pk_person PRIMARY KEY (person_id)
);

CREATE TABLE movies.production_company (
  company_id INT NOT NULL,
  company_name varchar(200) DEFAULT NULL,
  CONSTRAINT pk_prodcomp PRIMARY KEY (company_id)
);

CREATE TABLE movies.movie (
  movie_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(1000) DEFAULT NULL,
  budget INT DEFAULT NULL,
  homepage VARCHAR(1000) DEFAULT NULL,
  overview VARCHAR(1000) DEFAULT NULL,
  popularity DECIMAL(12,6) DEFAULT NULL,
  release_date DATE DEFAULT NULL,
  revenue BIGINT(20) DEFAULT NULL,
  runtime INT DEFAULT NULL,
  movie_status VARCHAR(50) DEFAULT NULL,
  tagline VARCHAR(1000) DEFAULT NULL,
  vote_average DECIMAL(4,2) DEFAULT NULL,
  vote_count INT DEFAULT NULL,
  CONSTRAINT pk_movie PRIMARY KEY (movie_id)
);

CREATE TABLE movies.movie_cast (
  movie_id INT DEFAULT NULL,
  person_id INT DEFAULT NULL,
  character_name varchar(400) DEFAULT NULL,
  gender_id INT DEFAULT NULL,
  cast_order int(5) DEFAULT NULL,
  CONSTRAINT fk_mca_gender FOREIGN KEY (gender_id) REFERENCES movies.gender (gender_id),
  CONSTRAINT fk_mca_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id),
  CONSTRAINT fk_mca_per FOREIGN KEY (person_id) REFERENCES movies.person (person_id)
);

CREATE TABLE movies.movie_company (
  movie_id INT DEFAULT NULL,
  company_id INT DEFAULT NULL,
  CONSTRAINT fk_mc_comp FOREIGN KEY (company_id) REFERENCES movies.production_company (company_id),
  CONSTRAINT fk_mc_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id)
);

CREATE TABLE movies.movie_crew (
  movie_id INT DEFAULT NULL,
  person_id INT DEFAULT NULL,
  department_id INT DEFAULT NULL,
  job VARCHAR(200) DEFAULT NULL,
  CONSTRAINT fk_mcr_dept FOREIGN KEY (department_id) REFERENCES movies.department (department_id),
  CONSTRAINT fk_mcr_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id),
  CONSTRAINT fk_mcr_per FOREIGN KEY (person_id) REFERENCES movies.person (person_id)
);

CREATE TABLE movies.movie_genres (
  movie_id INT DEFAULT NULL,
  genre_id INT DEFAULT NULL,
  CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id) REFERENCES movies.genre (genre_id),
  CONSTRAINT fk_mg_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id)
);

CREATE TABLE movies.movie_keywords (
  movie_id INT DEFAULT NULL,
  keyword_id INT DEFAULT NULL,
  CONSTRAINT fk_mk_keyword FOREIGN KEY (keyword_id) REFERENCES movies.keyword (keyword_id),
  CONSTRAINT fk_mk_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id)
);

CREATE TABLE movies.movie_languages (
  movie_id INT DEFAULT NULL,
  language_id INT DEFAULT NULL,
  language_role_id INT DEFAULT NULL,
  CONSTRAINT fk_ml_lang FOREIGN KEY (language_id) REFERENCES movies.language (language_id),
  CONSTRAINT fk_ml_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id),
  CONSTRAINT fk_ml_role FOREIGN KEY (language_role_id) REFERENCES movies.language_role (role_id)
);

CREATE TABLE movies.production_country (
  movie_id INT DEFAULT NULL,
  country_id INT DEFAULT NULL,
  CONSTRAINT fk_pc_country FOREIGN KEY (country_id) REFERENCES movies.country (country_id),
  CONSTRAINT fk_pc_movie FOREIGN KEY (movie_id) REFERENCES movies.movie (movie_id)
);
