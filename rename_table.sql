DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE IF EXISTS supplier_groups;

CREATE TABLE vendors (
	id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

ALTER TABLE vendors RENAME TO suppliers;

CREATE TABLE supplier_groups (
	id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);

ALTER TABLE suppliers
ADD COLUMN group_id INT NOT NULL;

ALTER TABLE suppliers
ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id) REFERENCES supplier_groups (id);

SELECT * FROM suppliers;

DROP VIEW IF EXISTS supplier_data;

CREATE VIEW supplier_data AS
SELECT
	s.id,
	s.name,
	g.name AS supply_group
FROM
	suppliers s
INNER JOIN supplier_groups g ON g.id = s.group_id;

ALTER TABLE supplier_groups RENAME TO groups;

SELECT * FROM supplier_data;

