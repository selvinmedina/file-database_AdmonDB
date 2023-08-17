CREATE DATABASE video_games;

CREATE TABLE video_games.dbo.platform (
	id INT PRIMARY KEY,
	platform_name VARCHAR(50)
);

CREATE TABLE video_games.dbo.genre (
	id INT PRIMARY KEY,
	genre_name VARCHAR(50)
);

CREATE TABLE video_games.dbo.publisher (
	id INT PRIMARY KEY,
	publisher_name VARCHAR(100)
);

CREATE TABLE video_games.dbo.region (
	id INT PRIMARY KEY,
	region_name VARCHAR(50)
);

CREATE TABLE video_games.dbo.game (
	id INT PRIMARY KEY,
	genre_id INT,
	game_name VARCHAR(200),
	CONSTRAINT fk_gm_gen FOREIGN KEY (genre_id) REFERENCES video_games.dbo.genre(id)
);

CREATE TABLE video_games.dbo.game_publisher (
	id INT PRIMARY KEY,
	game_id INT,
	publisher_id INT,
	CONSTRAINT fk_gpu_gam FOREIGN KEY (game_id) REFERENCES video_games.dbo.game(id),
	CONSTRAINT fk_gpu_pub FOREIGN KEY (publisher_id) REFERENCES video_games.dbo.publisher(id)
);

CREATE TABLE video_games.dbo.game_platform (
	id INT PRIMARY KEY,
	game_publisher_id INT,
	platform_id INT,
	release_year INT,
	CONSTRAINT fk_gpl_gp FOREIGN KEY (game_publisher_id) REFERENCES video_games.dbo.game_publisher(id),
	CONSTRAINT fk_gpl_pla FOREIGN KEY (platform_id) REFERENCES video_games.dbo.platform(id)
);

CREATE TABLE video_games.dbo.region_sales (
	region_id INT,
	game_platform_id INT,
	num_sales DECIMAL(5, 2),
    CONSTRAINT fk_rs_gp FOREIGN KEY (game_platform_id) REFERENCES video_games.dbo.game_platform(id),
	CONSTRAINT fk_rs_reg FOREIGN KEY (region_id) REFERENCES video_games.dbo.region(id)
);















