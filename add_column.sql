DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	customer_name VARCHAR NOT NULL
);

ALTER TABLE customers
ADD COLUMN phone VARCHAR;

ALTER TABLE customers
ADD COLUMN fax VARCHAR,
ADD COLUMN email VARCHAR;

INSERT INTO customers (customer_name)
VALUES
	('Apple'), ('Samsung'), ('Sony');

ALTER TABLE customers
ADD COLUMN contact_name VARCHAR;

UPDATE customers
SET contact_name = 'John Doe'
WHERE id = 1;

UPDATE customers
SET contact_name = 'Mary Doe'
WHERE id = 2;

UPDATE customers
SET contact_name = 'Lily Bush'
WHERE id = 3;

ALTER TABLE customers
ALTER COLUMN contact_name SET NOT NULL;

---
SELECT * FROM customers ORDER BY id;