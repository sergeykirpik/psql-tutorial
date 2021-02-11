SELECT
	'100'::INTEGER,
	'01-OCT-2015'::DATE;
	
-- Cast a string to an integer
SELECT
	CAST ('100' AS INTEGER);
	
-- Cast a string to a date
SELECT
	CAST ('2015-01-01' AS DATE),
	CAST ('01-OCT-2015' AS DATE);
	
-- Cast a string to a double
SELECT
	CAST ('10.2' AS DOUBLE PRECISION);
	
-- Cast a string to a boolean
SELECT
	CAST ('true' AS BOOLEAN),
	CAST ('false' AS BOOLEAN),
	CAST ('T' AS BOOLEAN),
	CAST ('F' AS BOOLEAN);
	
-- Convert a string to a timestamp
SELECT 
	'2019-06-15 14:30:20'::timestamp;

-- Convert a string to an interval
SELECT 
	'15 minutes'::interval,
	'1 day'::interval,
	'2 weeks'::interval,
	'3 months'::interval;
	
---

DROP TABLE IF EXISTS ratings;

CREATE TABLE ratings (
	id SERIAL PRIMARY KEY,
	rating VARCHAR(1) NOT NULL
);

INSERT INTO ratings (rating)
VALUES
	('A'),
	('B'),
	('C')
RETURNING *;

INSERT INTO ratings (rating)
VALUES
	(1),
	(2),
	(3);
	
SELECT * FROM ratings;

SELECT
	id,
	rating,
	CASE
		WHEN rating ~ E'^\\d+$' THEN CAST (rating AS INTEGER)
		ELSE 0
	END AS rating1
FROM
	ratings;