DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	phones TEXT[]
);

INSERT INTO contacts (name, phones)
VALUES
	('John Doe', ARRAY[ '(408)-589-5846', '(408)-589-5555' ]),
	('John Doe', '{"(408)-589-5846", "(408)-589-5555"}')
RETURNING *;

SELECT
	name,
	phones[1] AS phone1,
	phones[2] AS phone2
FROM
	contacts;
	
SELECT
	name
FROM
	contacts
WHERE
	phones[2] = '(408)-589-58423';
	
UPDATE contacts
SET phones = '{"(408)-589-5849"}'
WHERE id = 3;

SELECT
	name,
	phones
FROM
	contacts
WHERE
	'(408)-589-5555' = ANY (phones);
	
SELECT
	name,
	unnest(phones)
FROM
	contacts;