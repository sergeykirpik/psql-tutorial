DROP TABLE IF EXISTS mailing_list;
CREATE TABLE mailing_list (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL,
	CHECK (
		first_name !~ '\s'
		AND last_name !~ '\s'
	)
);

DROP DOMAIN IF EXISTS contact_name;

CREATE DOMAIN contact_name AS
	VARCHAR NOT NULL CHECK (value !~ '\s');
	
DROP TABLE mailing_list;
CREATE TABLE mailing_list (
	id SERIAL PRIMARY KEY,
	first_name contact_name,
	last_name contact_name,
	email VARCHAR NOT NULL
);

-- INSERT INTO mailing_list (first_name, last_name, email)
-- VALUES('Jame V','Doe','jame.doe@example.com');

INSERT INTO mailing_list (first_name, last_name, email)
VALUES('Jane','Doe','jane.doe@example.com');

SELECT typname
FROM pg_catalog.pg_type
JOIN pg_catalog.pg_namespace
	ON pg_namespace.oid = pg_type.typnamespace
WHERE
	typtype = 'd' AND nspname = 'public';
	
DROP TYPE IF EXISTS film_summary;

CREATE TYPE film_summary AS (
	film_id INT,
	title VARCHAR,
	release_year SMALLINT
);

-- CREATE OR REPLACE FUNCTION get_film_summary (f_id INT)
-- 	RETURNS film_summary AS
-- $$
-- SELECT
-- 	film_id,
-- 	title,
-- 	release_year
-- FROM
-- 	film
-- WHERE
-- 	film_id = f_id;
-- $$
-- LANGUAGE SQL;

-- SELECT * FROM get_film_summary(40);