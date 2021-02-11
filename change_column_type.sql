DROP TABLE IF EXISTS assets;

CREATE TABLE assets (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	asset_no VARCHAR NOT NULL,
	description TEXT,
	location TEXT,
	acquired_date DATE NOT NULL
);

INSERT INTO assets (name, asset_no, location, acquired_date)
VALUES
	('Server','10001','Server room','2017-01-01'),
	('UPS','10002','Server room','2017-01-01');

ALTER TABLE assets
ALTER COLUMN name TYPE VARCHAR;

ALTER TABLE assets
	ALTER COLUMN location TYPE VARCHAR,
	ALTER COLUMN description TYPE VARCHAR;
	
ALTER TABLE assets
ALTER COLUMN asset_no TYPE INT USING asset_no::integer;

SELECT * FROM assets;