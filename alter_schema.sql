DROP SCHEMA IF EXISTS doe;
DROP SCHEMA IF EXISTS john;
DROP SCHEMA IF EXISTS finance;
DROP SCHEMA IF EXISTS accounting;

CREATE SCHEMA doe AUTHORIZATION john;
CREATE SCHEMA AUTHORIZATION john;

ALTER SCHEMA doe
RENAME TO finance;

ALTER SCHEMA john
RENAME TO accounting;

ALTER SCHEMA finance
OWNER TO postgres;

ALTER SCHEMA accounting
OWNER TO postgres;

SELECT *
FROM pg_catalog.pg_namespace
WHERE
	nspacl IS NULL AND
	nspname NOT LIKE 'pg_%'
ORDER BY
	nspname;
	
