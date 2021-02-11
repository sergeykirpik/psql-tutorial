DROP ROLE IF EXISTS calf;

CREATE ROLE calf WITH
	LOGIN
	PASSWORD 'securePwd1';
	
ALTER ROLE calf WITH
	SUPERUSER;
	
ALTER ROLE calf NOSUPERUSER;

ALTER ROLE calf VALID UNTIL '2050-01-01';

DROP ROLE IF EXISTS elephant;

ALTER ROLE calf
RENAME TO elephant;

ALTER ROLE elephant
IN DATABASE dvdrental
SET client_min_messages = NOTICE;