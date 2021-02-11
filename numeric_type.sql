--NUMERIC; DECIMAL; NUMERIC(precision, scale)
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price NUMERIC(5, 2)
);

INSERT INTO products (name, price)
VALUES
	('Phone', 500.215),
	('Tablet', 500.214)
RETURNING *;

-- INSERT INTO products (name, price)
-- VALUES ('Phone', 123456.21);

UPDATE products
SET price = 'NaN'
WHERE id = 1;

SELECT * FROM products
ORDER BY price DESC;