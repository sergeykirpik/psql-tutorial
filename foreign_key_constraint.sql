--- NO ACTION ---

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id INT GENERATED ALWAYS AS IDENTITY,
	customer_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (customer_id)
);

CREATE TABLE contacts (
	contact_id INT GENERATED ALWAYS AS IDENTITY,
	customer_id INT,
	contact_name VARCHAR(255) NOT NULL,
	phone character varying (15),
	email character varying (100),
	PRIMARY KEY (contact_id),
	CONSTRAINT fk_customer FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
	  
SELECT * FROM customers;

SELECT * FROM contacts;

--DELETE FROM customers WHERE customer_id = 1;

--- SET NULL --

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id INT GENERATED ALWAYS AS IDENTITY,
	customer_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (customer_id)
);

CREATE TABLE contacts (
	contact_id INT GENERATED ALWAYS AS IDENTITY,
	customer_id INT,
	contact_name VARCHAR(255) NOT NULL,
	phone VARCHAR(15),
	email VARCHAR(100),
	PRIMARY KEY (contact_id),
	CONSTRAINT fk_customer FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
		ON DELETE SET NULL
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
	  
SELECT * FROM contacts;

DELETE FROM customers WHERE customer_id = 1;

SELECT * FROM contacts;

--- CASCADE ---

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id INT GENERATED ALWAYS AS IDENTITY,
	customer_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (customer_id)
);

CREATE TABLE contacts (
	contact_id INT GENERATED ALWAYS AS IDENTITY,
	customer_id INT,
	contact_name VARCHAR(255) NOT NULL,
	phone VARCHAR(15),
	email VARCHAR(100),
	PRIMARY KEY (contact_id),
	CONSTRAINT fkey_customer FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
		ON DELETE CASCADE
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev')
RETURNING *;

DELETE FROM customers WHERE customer_id = 1;

SELECT * FROM contacts;

--- SET DEFAULT --

