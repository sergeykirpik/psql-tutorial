--CHARACTER VARYING(n); VARCHAR(n)
--CHARACTER(n); CHAR(n)
--TEXT; VARCHAR

DROP TABLE IF EXISTS character_test;
CREATE TABLE character_tests (
	id SERIAL PRIMARY KEY,
	x CHAR (1),
	y VARCHAR (30),
	z TEXT
);

INSERT INTO character_tests (x, y, z)
VALUES ('Y','This is a test for varchar','This is a very long text for the PostgreSQL text column')
	