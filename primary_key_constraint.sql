DROP TABLE IF EXISTS po_headers;
DROP TABLE IF EXISTS po_items;

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

DROP TABLE po_headers;
CREATE TABLE po_headers (
	po_no INTEGER,
	vendor_no INTEGER,
	description TEXT,
	shipping_address TEXT,
	CONSTRAINT po_headers_pkey PRIMARY KEY (po_no)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_no INTEGER,
	description TEXT,
	product_cost NUMERIC
);

ALTER TABLE products
ADD PRIMARY KEY (product_no);

DROP TABLE IF EXISTS vendors;
CREATE TABLE vendors (name VARCHAR(255));

INSERT INTO vendors (name)
VALUES
	('Microsoft'),
	('IBM'),
	('Apple'),
	('Samsung')
RETURNING *;

ALTER TABLE vendors
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM vendors;

ALTER TABLE vendors
DROP CONSTRAINT vendors_pkey;

SELECT * FROM vendors;
