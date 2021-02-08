--dvdrental sample database

-- btree, hash, gist, spgist, gin, brin

-- sequential scan
EXPLAIN SELECT * FROM address
WHERE phone = '223664661973';

DROP INDEX IF EXISTS idx_address_phone;

CREATE INDEX idx_address_phone 
ON address (phone);

-- index scan
EXPLAIN SELECT * FROM address
WHERE phone = '223664661973';

--
CREATE INDEX IF NOT EXISTS idx_actor_first_name
ON actor (first_name);

-- seq scan: query optimized does not use index
EXPLAIN SELECT * FROM actor
WHERE first_name = 'John';

DROP INDEX idx_actor_first_name;

-- seq scan
EXPLAIN SELECT * FROM actor
WHERE first_name = 'John';

-- pg_indexes view
SELECT 
	tablename,
	indexname,
	indexdef
FROM pg_indexes
WHERE 
	schemaname = 'public' 
	--AND tablename = 'address'
ORDER BY
	tablename,
	indexname;
	
SELECT
	indexname,
	indexdef
FROM
	pg_indexes
WHERE
	tablename = 'customer';
	
SELECT
	tablename,
	indexname,
	indexdef
FROM
	pg_indexes
WHERE
	tablename LIKE 'c%'
ORDER BY
	tablename,
	indexname;