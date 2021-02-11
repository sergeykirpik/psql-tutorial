SELECT COALESCE (1, 2);

SELECT COALESCE (NULL, 2, 1);

--SELECT COALESCE (excerpt, LEFT (content, 150)) FROM posts;

DROP TABLE IF EXISTS items;

CREATE TABLE items (
	id SERIAL PRIMARY KEY,
	product VARCHAR(100) NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC
);

INSERT INTO items (product, price, discount)
VALUES
	('A', 1000 ,10),
	('B', 1500 ,20),
	('C', 800 ,5),
	('D', 500, NULL)
RETURNING *;

SELECT
	product,
	(price - COALESCE(discount, 0)) AS net_price
FROM
	items;
	
SELECT
	product,
	price - (CASE WHEN discount IS NULL THEN 0 ELSE discount END) AS net_price
FROM
	items;