DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS pages;

CREATE TABLE authors (
	author_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	lastname VARCHAR(50)
);

CREATE TABLE pages (
	page_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	contents TEXT,
	author_id INT NOT NULL,
	FOREIGN KEY (author_id)
		REFERENCES authors (author_id)
);

DROP TABLE IF EXISTS tvshows, animes;

CREATE TABLE tvshows (
	tvshow_id INT GENERATED ALWAYS AS IDENTITY,
	title VARCHAR,
	release_year SMALLINT,
	PRIMARY KEY (tvshow_id)
);

CREATE TABLE animes (
	anime_id INT GENERATED ALWAYS AS IDENTITY,
	title VARCHAR,
	release_year SMALLINT,
	PRIMARY KEY (anime_id)
);