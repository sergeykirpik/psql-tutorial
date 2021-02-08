EXPLAIN
SELECT
	customer_id,
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	active = 0;
	
DROP INDEX IF EXISTS idx_customer_active;

CREATE INDEX idx_customer_active
ON customer(active)
WHERE active = 0;

EXPLAIN
SELECT
	customer_id,
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	active = 0;
