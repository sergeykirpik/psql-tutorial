DROP TABLE IF EXISTS po_headers;
DROP TABLE IF EXISTS po_items;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS vendors;

CREATE TABLE po_headers (
	po_no INTEGER PRIMARY KEY,
	vendor_no INTEGER,
	description TEXT,
	shipping_address TEXT
);

CREATE TABLE po_items (
	po_no INTEGER,
	item_no INTEGER,
	product_no INTEGER,
	qty INTEGER,
	net_price NUMERIC,
	PRIMARY KEY (po_no, item_no)
);

CREATE TABLE products (
	product_no INTEGER,
	description TEXT,
	product_cost NUMERIC
);

ALTER TABLE products
ADD PRIMARY KEY (product_no);

CREATE TABLE vendors(
	name VARCHAR(255)
);
INSERT INTO vendors (name)
VALUES
	('Microsoft'), ('IBM'), ('Apple'), ('Samsung')
RETURNING *;

ALTER TABLE vendors
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM vendors;

ALTER TABLE products
DROP CONSTRAINT products_pkey;
