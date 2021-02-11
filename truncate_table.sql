DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
	id INT GENERATED BY DEFAULT AS IDENTITY,
	n INT NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO invoices (n) VALUES (1), (2), (3), (4), (5)
RETURNING *;

TRUNCATE TABLE invoices;

INSERT INTO invoices (n) VALUES (1), (2), (3), (4), (5)
RETURNING *;

TRUNCATE TABLE invoices RESTART IDENTITY;

INSERT INTO invoices (n) VALUES (1), (2), (3), (4), (5)
RETURNING *;