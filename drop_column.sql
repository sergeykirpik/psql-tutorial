DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS categories;

CREATE TABLE publishers (
	publisher_id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

CREATE TABLE categories (
	category_id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

CREATE TABLE books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	isbn VARCHAR NOT NULL,
	published_date DATE NOT NULL,
	description VARCHAR,
	category_id INT NOT NULL,
	publisher_id INT NOT NULL,
	FOREIGN KEY (publisher_id) 
		REFERENCES publishers (publisher_id),
	FOREIGN KEY (category_id) 
		REFERENCES categories (category_id)
);

CREATE VIEW book_info AS
SELECT
	book_id,
	title,
	isbn,
	published_date,
	name
FROM
	books b
INNER JOIN publishers USING (publisher_id)
ORDER BY title;

ALTER TABLE books
DROP COLUMN category_id;

ALTER TABLE books
DROP COLUMN publisher_id CASCADE;

ALTER TABLE books
DROP COLUMN isbn,
DROP COLUMN description;


---
SELECT * FROM books;