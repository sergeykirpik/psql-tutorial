DROP TABLE IF EXISTS stock_availability;
CREATE TABLE stock_availability (
	product_id INT PRIMARY KEY,
	available BOOLEAN NOT NULL
);

INSERT INTO stock_availability (product_id, available)
VALUES
	(100, TRUE),
	(200, FALSE),
	(300, 't'),
	(400, '1'),
	(500, 'y'),
	(600, 'yes'),
	(700, 'no'),
	(800, '0');
	
SELECT * 
FROM stock_availability
WHERE available = 'yes';

SELECT * 
FROM stock_availability 
WHERE available;

SELECT *
FROM stock_availability
WHERE available = 'no';

SELECT *
FROM stock_availability
WHERE NOT available;

ALTER TABLE stock_availability
ALTER COLUMN available
SET DEFAULT false;

INSERT INTO stock_availability (product_id)
VALUES (900)
RETURNING *;

DROP TABLE IF EXISTS boolean_demo;
CREATE TABLE boolean_demo (
	is_ok BOOL DEFAULT 't'
)
