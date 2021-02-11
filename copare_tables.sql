-- Prepare tables --
DROP TABLE IF EXISTS foo;
DROP TABLE IF EXISTS bar;

CREATE TABLE foo (
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO foo (id, name)
VALUES
	(1, 'a'),
	(2, 'b')
RETURNING *;

CREATE TABLE bar (
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO bar (id, name)
VALUES
	(1, 'a'),
	(2, 'b')
RETURNING *;

UPDATE bar
SET name = 'c'
WHERE
	id = 2;

-- Compare tables using EXCEPT and UNION --
SELECT
	id,
	name,
	'not in bar' AS note
FROM
	foo
EXCEPT SELECT
	id,
	name,
	'not in bar' AS note
FROM
	bar
	
UNION
	
SELECT
	id,
	name,
	'not in foo' AS note
FROM
	bar
EXCEPT SELECT
	id, 
	name,
	'not in foo' AS note
FROM
	foo;
	
-- Compare tables using OUTER JOIN --
SELECT
	id,
	name
FROM
	foo
FULL OUTER JOIN bar USING (id, name)
WHERE
	foo.id IS NULL OR 
	bar.id IS NULL;

-- Count differences --
SELECT
	COUNT(*)
FROM
	foo
FULL OUTER JOIN bar USING (id, name)
WHERE
	foo.id IS NULL OR
	bar.id IS NULL;