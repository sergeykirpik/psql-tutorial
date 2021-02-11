--hstore
CREATE EXTENSION IF NOT EXISTS hstore;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	title VARCHAR(255),
	attr hstore
);

INSERT INTO books (title, attr)
VALUES (
	'PostgeSQL Tutorial',
	'
		"paperback" => "243",
		"publisher" => "postgresqltutorial.com",
		"language"  => "English",
		"ISBN-13"	=> "978-1449370000",
		"weight"	=> "11.2 ounces"
	'
) RETURNING *;

INSERT INTO books (title, attr)
VALUES (
	'PostgreSQL Cheat Sheet',
	'
		"paperback" => "5",
		"publisher" => "postgresqltutorial.com",
		"language"  => "English",
		"ISBN-13"   => "978-1449370001",
		"weight"    => "1 ounces"
	'
);

SELECT * FROM books;

SELECT attr FROM books;

SELECT
	attr -> 'ISBN-13' AS isbn
FROM
	books;
	
SELECT
	title,
	attr -> 'weight' AS weight
FROM
	books
WHERE
	attr -> 'ISBN-13' = '978-1449370000';
	
UPDATE books
SET attr = attr || '"freeshipping" => "yes"' :: hstore;

UPDATE books
SET attr = attr || '"freeshipping" => "no"' :: hstore;

UPDATE books
SET attr = delete(attr, 'freeshipping');

SELECT * FROM books;

SELECT
	title,
	attr->'publisher' AS publisher,
	attr
FROM
	books
WHERE
	attr ? 'publisher';
	
SELECT
	title
FROM
	books
WHERE
	attr @> '"weight" => "11.2 ounces"';