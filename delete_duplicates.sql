-- Preparing sample data --
DROP TABLE IF EXISTS basket;

CREATE TABLE basket (
	id SERIAL PRIMARY KEY,
	fruit VARCHAR(50) NOT NULL
);

INSERT INTO basket(fruit) values('apple');
INSERT INTO basket(fruit) values('apple');

INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');

INSERT INTO basket(fruit) values('banana');

SELECT * FROM basket;

-- Finding duplicate rows --
SELECT
	fruit,
	COUNT(fruit)
FROM
	basket
GROUP BY
	fruit
HAVING
	COUNT(fruit) > 1
ORDER BY
	fruit;
	
-- Deleting duplicate rows using USING clause --
DELETE FROM basket a 
USING basket b 
WHERE
	a.id > b.id
	AND a.fruit = b.fruit;
	
SELECT
	id,
	fruit
FROM
	basket;
	
-- Deleting duplicate rows using subquery --
DELETE FROM basket
WHERE id IN (
	SELECT id
	FROM (
		SELECT 
			id,
			ROW_NUMBER() OVER (PARTITION BY fruit ORDER BY id) AS row_num
		FROM
			basket
	) t
	WHERE t.row_num > 1
);

-- Deleting duplicate rows using an immediate table --

-- step 1
CREATE TABLE basket_temp (LIKE basket);

-- step 2
INSERT INTO basket_temp (fruit, id)
SELECT
	DISTINCT ON (fruit) fruit,
	id
FROM
	basket;
	
-- step 3
DROP TABLE basket;

-- step 4
ALTER TABLE basket_temp
RENAME TO basket;

SELECT * FROM basket;
