CREATE DATABASE movies;

CREATE TABLE movies.dbo.country (
  country_id INT NOT NULL,
  country_iso_code varchar(10) DEFAULT NULL,
  country_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (country_id)
);

CREATE TABLE movies.dbo.gender (
  gender_id INT NOT NULL,
  gender VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (gender_id)
);

CREATE TABLE movies.dbo.genre (
  genre_id INT NOT NULL,
  genre_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (genre_id)
);

CREATE TABLE movies.dbo.language (
  language_id INT NOT NULL,
  language_code varchar(10) DEFAULT NULL,
  language_name varchar(500) DEFAULT NULL,
  PRIMARY KEY (language_id)
);

CREATE TABLE movies.dbo.language_role (
  role_id INT NOT NULL,
  language_role varchar(20) DEFAULT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE movies.dbo.department (
  department_id INT NOT NULL,
  department_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE movies.dbo.keyword (
  keyword_id INT NOT NULL,
  keyword_name VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (keyword_id)
);

CREATE TABLE movies.dbo.person (
  person_id INT NOT NULL,
  person_name varchar(500) DEFAULT NULL,
  PRIMARY KEY (person_id)
);

CREATE TABLE movies.dbo.production_company (
  company_id INT NOT NULL,
  company_name varchar(200) DEFAULT NULL,
  PRIMARY KEY (company_id)
);

CREATE TABLE movies.dbo.movie (
  movie_id INT NOT NULL,
  title varchar(1000) DEFAULT NULL,
  budget BIGINT DEFAULT NULL,
  homepage varchar(1000) DEFAULT NULL,
  overview varchar(1000) DEFAULT NULL,
  popularity DECIMAL(12,6) DEFAULT NULL,
  release_date VARCHAR(30) DEFAULT NULL,
  revenue BIGINT DEFAULT NULL,
  runtime INT DEFAULT NULL,
  movie_status varchar(50) DEFAULT NULL,
  tagline varchar(1000) DEFAULT NULL,
  vote_average DECIMAL(4,2) DEFAULT NULL,
  vote_count INT DEFAULT NULL,
  PRIMARY KEY (movie_id)
);

CREATE TABLE movies.dbo.movie_cast (
  movie_id INT DEFAULT NULL,
  person_id INT DEFAULT NULL,
  character_name varchar(400) DEFAULT NULL,
  gender_id INT DEFAULT NULL,
  cast_order INT DEFAULT NULL,
  CONSTRAINT fk_mca_gender FOREIGN KEY (gender_id) REFERENCES movies.dbo.gender (gender_id),
  CONSTRAINT fk_mca_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id),
  CONSTRAINT fk_mca_per FOREIGN KEY (person_id) REFERENCES movies.dbo.person (person_id)
);

CREATE TABLE movies.dbo.movie_company (
  movie_id INT DEFAULT NULL,
  company_id INT DEFAULT NULL,
  CONSTRAINT fk_mc_comp FOREIGN KEY (company_id) REFERENCES movies.dbo.production_company (company_id),
  CONSTRAINT fk_mc_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id)
);

CREATE TABLE movies.dbo.movie_crew (
  movie_id INT DEFAULT NULL,
  person_id INT DEFAULT NULL,
  department_id INT DEFAULT NULL,
  job varchar(200) DEFAULT NULL,
  CONSTRAINT fk_mcr_dept FOREIGN KEY (department_id) REFERENCES movies.dbo.department (department_id),
  CONSTRAINT fk_mcr_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id),
  CONSTRAINT fk_mcr_per FOREIGN KEY (person_id) REFERENCES movies.dbo.person (person_id)
);

CREATE TABLE movies.dbo.movie_genres (
  movie_id INT DEFAULT NULL,
  genre_id INT DEFAULT NULL,
  CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id) REFERENCES movies.dbo.genre (genre_id),
  CONSTRAINT fk_mg_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id)
);

CREATE TABLE movies.dbo.movie_keywords (
  movie_id INT DEFAULT NULL,
  keyword_id INT DEFAULT NULL,
  CONSTRAINT fk_mk_keyword FOREIGN KEY (keyword_id) REFERENCES movies.dbo.keyword (keyword_id),
  CONSTRAINT fk_mk_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id)
);

CREATE TABLE movies.dbo.movie_languages (
  movie_id INT DEFAULT NULL,
  language_id INT DEFAULT NULL,
  language_role_id INT DEFAULT NULL,
  CONSTRAINT fk_ml_lang FOREIGN KEY (language_id) REFERENCES movies.dbo.language (language_id),
  CONSTRAINT fk_ml_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id),
  CONSTRAINT fk_ml_role FOREIGN KEY (language_role_id) REFERENCES movies.dbo.language_role (role_id)
);

CREATE TABLE movies.dbo.production_country (
  movie_id INT DEFAULT NULL,
  country_id INT DEFAULT NULL,
  CONSTRAINT fk_pc_country FOREIGN KEY (country_id) REFERENCES movies.dbo.country (country_id),
  CONSTRAINT fk_pc_movie FOREIGN KEY (movie_id) REFERENCES movies.dbo.movie (movie_id)
);









