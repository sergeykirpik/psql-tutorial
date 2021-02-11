-- Random number in range --
SELECT random();

SELECT random() * 10 + 1 AS RAND_1_11;

SELECT floor(random() * 10 + 1)::int;

SELECT floor(random() * 100 + 1)::int;

CREATE OR REPLACE FUNCTION random_between(low INT, high INT)
	RETURNS INT AS
$$
BEGIN
	RETURN floor(random() * (high - low + 1) + low);
END
$$ language 'plpgsql' STRICT;

SELECT random_between(10, 20);

SELECT random_between(1, 100)
FROM generate_series(1, 5);