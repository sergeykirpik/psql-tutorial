CREATE SEQUENCE IF NOT EXISTS mysequence
INCREMENT 5
START 100;
---SELECT nextval('mysequence')

---
CREATE SEQUENCE IF NOT EXISTS three
INCREMENT -1
MINVALUE 1
MAXVALUE 3
START 3
CYCLE;
---SELECT nextval('three');
---
CREATE TABLE IF NOT EXISTS order_details (
	order_id SERIAL,
	item_id INT NOT NULL,
	item_text VARCHAR NOT NULL,
	price DEC(10,2) NOT NULL,
	PRIMARY KEY (order_id, item_id)
);

CREATE SEQUENCE IF NOT EXISTS order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;

INSERT INTO order_details (order_id, item_id, item_text, price)
VALUES
	(100, nextval('order_item_id'), 'DVD Player', 100),
	(100, nextval('order_item_id'), 'Android TV', 550),
	(100, nextval('order_item_id'), 'Speaker', 250);
	
SELECT * FROM order_details;