SELECT pg_relation_size('actor');

SELECT pg_size_pretty(pg_relation_size('actor'));

SELECT
	pg_size_pretty(
		pg_relation_size('actor')
	) AS relation_size,
	pg_size_pretty(
		pg_total_relation_size('actor')
	) AS total_relation_size;

---

SELECT
	relname AS "relation",
	pg_size_pretty(
		pg_total_relation_size(c.oid)
	) AS "total_size"
FROM
	pg_class c
LEFT JOIN pg_namespace n ON (n.oid = c.relnamespace)
WHERE
	nspname NOT IN (
		'pg_catalog',
		'information_schema'
	)
	AND c.relkind != 'i'
	AND nspname !~ 'pg_toast'
ORDER BY
	pg_total_relation_size(c.oid) DESC
LIMIT 5;

SELECT
	pg_size_pretty(
		pg_database_size('dvdrental')
	);
	
SELECT
	pg_database.datname,
	pg_size_pretty(
		pg_database_size(pg_database.datname)
	) AS size
FROM pg_database;

SELECT
	pg_size_pretty(
		pg_indexes_size('actor')
	);
	
SELECT
	pg_size_pretty(
		pg_tablespace_size('pg_default')
	);
	
SELECT
	pg_column_size(5::smallint),
	pg_column_size(5::int),
	pg_column_size(5::bigint);