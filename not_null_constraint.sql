DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
	id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	qty NUMERIC NOT NULL CHECK(qty > 0),
	net_price NUMERIC CHECK(net_price > 0)
);

DROP TABLE IF EXISTS production_orders;
CREATE TABLE production_orders (
	id SERIAL PRIMARY KEY,
	description VARCHAR(40) NOT NULL,
	material_id VARCHAR(16),
	qty NUMERIC,
	start_date DATE,
	finish_date DATE
);

INSERT INTO production_orders (description)
VALUES ('Make for Infosys inc.');

SELECT * FROM production_orders;

UPDATE production_orders
SET qty = 1;

SELECT * FROM production_orders;

ALTER TABLE production_orders
ALTER COLUMN qty SET NOT NULL;

SELECT * FROM production_orders;

UPDATE production_orders
SET material_id = 'ABC',
	start_date  = '2015-09-01',
	finish_date = '2015-09-01';
	
ALTER TABLE production_orders
ALTER COLUMN material_id SET NOT NULL,
ALTER COLUMN start_date SET NOT NULL,
ALTER COLUMN finish_date SET NOT NULL;

-- UPDATE production_orders
-- SET qty = NULL;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50),
	password VARCHAR(50),
	email VARCHAR(50),
	CONSTRAINT username_email_notnull CHECK (
		NOT (
		  ( username IS NULL OR username = '')
			AND
		  ( email IS NULL OR email = '' )
		)
	)
);

INSERT INTO users (username, email)
VALUES
	('user1', NULL),
	(NULL, 'email1@example.com'),
	('user2', 'email2@example.com'),
	('user3', '')
RETURNING *;



