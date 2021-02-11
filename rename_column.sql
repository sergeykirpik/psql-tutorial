DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS customer_groups;

CREATE TABLE customer_groups (
	id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	phone VARCHAR NOT NULL,
	email VARCHAR,
	group_id INT,
	FOREIGN KEY (group_id)
		REFERENCES customer_groups (id)
);

CREATE VIEW customer_data
AS SELECT
	c.id,
	c.name,
	g.name customer_group
FROM
	customers c
INNER JOIN customer_groups g ON g.id = c.group_id;

ALTER TABLE customers
RENAME COLUMN email TO conatact_email;

ALTER TABLE customer_groups
RENAME COLUMN name TO group_name;

ALTER TABLE customers
RENAME COLUMN name TO customer_name;

ALTER TABLE customers
RENAME COLUMN phone TO contact_phone;

SELECT * FROM customer_data;