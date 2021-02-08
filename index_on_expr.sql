EXPLAIN
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Purdy';

EXPLAIN
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	LOWER(last_name) = 'purdy';
	
DROP INDEX IF EXISTS idx_ic_last_name;	
	
CREATE INDEX idx_ic_last_name
ON customer (LOWER(last_name));

EXPLAIN
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	LOWER(last_name) = 'purdy';
