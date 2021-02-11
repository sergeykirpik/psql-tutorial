-- SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'sales';

REASSIGN OWNED BY alice TO postgres;

DROP OWNED BY alice TO postgres;

DROP ROLE IF EXISTS alice;

CREATE ROLE alice WITH
	LOGIN
	PASSWORD 'Abcd1234';
	
ALTER ROLE alice CREATEDB;