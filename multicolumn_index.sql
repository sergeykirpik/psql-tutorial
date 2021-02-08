SELECT
	*
FROM
	people
WHERE
	last_name = 'Adams';
	
DROP INDEX IF EXISTS idx_people_names;

CREATE INDEX idx_people_names
ON people(last_name, first_name);

EXPLAIN
SELECT
	*
FROM
	people
WHERE
	last_name = 'Adams';

EXPLAIN
SELECT
	*
FROM
	people
WHERE
	last_name = 'Adams'
	AND first_name = 'Lou';

EXPLAIN
SELECT
	*
FROM
	people
WHERE
	first_name = 'Lou';
	