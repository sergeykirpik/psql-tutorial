DROP ROLE IF EXISTS username;
CREATE ROLE username WITH LOGIN;
ALTER ROLE username WITH PASSWORD 'secret123';

ALTER ROLE username WITH
PASSWORD 'secret1123'
VALID UNTIL '2021-01-01';