DROP SCHEMA IF EXISTS marketing;

CREATE SCHEMA marketing;

SELECT *
FROM pg_catalog.pg_namespace
ORDER BY nspname;

DROP SCHEMA IF EXISTS john;

DROP SCHEMA IF EXISTS doe;

DROP ROLE IF EXISTS john;

CREATE ROLE john
LOGIN
PASSWORD 'Postgr@s321!';

CREATE SCHEMA AUTHORIZATION john;

CREATE SCHEMA doe AUTHORIZATION john;

DROP SCHEMA IF EXISTS scm CASCADE;

CREATE SCHEMA scm
	CREATE TABLE deliveries (
		id SERIAL NOT NULL,
		customer_id INT NOT NULL,
		ship_date DATE NOT NULL
	)
	CREATE VIEW delivery_due_list AS
		SELECT id, ship_date
		FROM deliveries
		WHERE ship_date <= CURRENT_DATE;