CREATE TABLE video_games.genre (
  id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_genre PRIMARY KEY (id)
);

CREATE TABLE video_games.publisher (
  id  INT NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_publisher PRIMARY KEY (id)
);

CREATE TABLE video_games.region (
  id INT NOT NULL AUTO_INCREMENT,
  region_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_region PRIMARY KEY (id)
);

CREATE TABLE video_games.platform (
  id INT NOT NULL AUTO_INCREMENT,
  platform_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_platform PRIMARY KEY (id)
);

CREATE TABLE video_games.game (
  id INT NOT NULL AUTO_INCREMENT,
  genre_id INT DEFAULT NULL,
  game_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_game PRIMARY KEY (id),
  CONSTRAINT fk_gm_gen FOREIGN KEY (genre_id) REFERENCES video_games.genre (id)
);

CREATE TABLE video_games.game_publisher (
  id INT NOT NULL AUTO_INCREMENT,
  game_id INT DEFAULT NULL,
  publisher_id INT DEFAULT NULL,
  CONSTRAINT pk_gamepub PRIMARY KEY (id),
  CONSTRAINT fk_gpu_gam FOREIGN KEY (game_id) REFERENCES video_games.game (id),
  CONSTRAINT fk_gpu_pub FOREIGN KEY (publisher_id) REFERENCES video_games.publisher (id)
);

CREATE TABLE video_games.game_platform (
  id INT NOT NULL AUTO_INCREMENT,
  game_publisher_id INT DEFAULT NULL,
  platform_id INT DEFAULT NULL,
  release_year INT DEFAULT NULL,
  CONSTRAINT pk_gameplat PRIMARY KEY (id),
  CONSTRAINT fk_gpl_gp FOREIGN KEY (game_publisher_id) REFERENCES video_games.game_publisher (id),
  CONSTRAINT fk_gpl_pla FOREIGN KEY (platform_id) REFERENCES video_games.platform (id)
);

CREATE TABLE video_games.region_sales (
  region_id INT DEFAULT NULL,
  game_platform_id INT DEFAULT NULL,
  num_sales decimal(5,2) DEFAULT NULL,
  CONSTRAINT fk_rs_gp FOREIGN KEY (game_platform_id) REFERENCES video_games.game_platform (id),
  CONSTRAINT fk_rs_reg FOREIGN KEY (region_id) REFERENCES video_games.region (id)
);
