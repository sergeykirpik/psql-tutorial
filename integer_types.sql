--SMALLINT       2 bytes                       -32,768                       +32,767
--INTEGER; INT   4 bytes                -2,147,483,648                +2,147,483,647
--BIGINT         8 bytes    -9,223,372,036,854,775,808    +9,223,372,036,854,775,807

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	pages SMALLINT NOT NULL CHECK (pages > 0)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	city_id SERIAL PRIMARY KEY,
	city_name VARCHAR(255) NOT NULL,
	population INT NOT NULL CHECK (population >= 0)
);