CREATE TABLE platform (
	id NUMBER PRIMARY KEY,
	platform_name VARCHAR2(50)
);

CREATE TABLE genre (
	id NUMBER PRIMARY KEY,
	genre_name VARCHAR2(50)
);

CREATE TABLE publisher (
	id NUMBER PRIMARY KEY,
	publisher_name VARCHAR2(100)
);

CREATE TABLE region (
	id NUMBER PRIMARY KEY,
	region_name VARCHAR2(50)
);


CREATE TABLE game (
	id NUMBER PRIMARY KEY,
	genre_id NUMBER,
	game_name VARCHAR2(200),
	CONSTRAINT fk_gm_gen FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE game_publisher (
	id NUMBER PRIMARY KEY,
	game_id NUMBER,
	publisher_id NUMBER,
	CONSTRAINT fk_gpu_gam FOREIGN KEY (game_id) REFERENCES game(id),
	CONSTRAINT fk_gpu_pub FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE game_platform (
	id NUMBER PRIMARY KEY,
	game_publisher_id NUMBER,
	platform_id NUMBER,
	release_year NUMBER,
	CONSTRAINT fk_gpl_gp FOREIGN KEY (game_publisher_id) REFERENCES game_publisher(id),
	CONSTRAINT fk_gpl_pla FOREIGN KEY (platform_id) REFERENCES platform(id)
);

CREATE TABLE region_sales (
	region_id NUMBER,
	game_platform_id NUMBER,
	num_sales NUMBER(5, 2),
    CONSTRAINT fk_rs_gp FOREIGN KEY (game_platform_id) REFERENCES game_platform(id),
	CONSTRAINT fk_rs_reg FOREIGN KEY (region_id) REFERENCES region(id)
);
