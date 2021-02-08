DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE
);

SELECT * FROM pg_indexes WHERE schemaname = 'public ';

ALTER TABLE employees
ADD mobile_phone VARCHAR(20);

CREATE UNIQUE INDEX idx_employees_mobile_phone
ON employees (mobile_phone);

SELECT * FROM pg_indexes WHERE schemaname = 'public';

INSERT INTO employees(first_name, last_name, email, mobile_phone)
VALUES ('John','Doe','john.doe@postgresqltutorial.com', '(408)-555-1234');

-- INSERT INTO employees(first_name, last_name, email, mobile_phone)
-- VALUES ('Mary','Jane','mary.jane@postgresqltutorial.com', '(408)-555-1234');

SELECT * FROM employees;

ALTER TABLE employees
ADD work_phone VARCHAR(20),
ADD extension VARCHAR(5);

CREATE UNIQUE INDEX idx_employees_workphone
ON employees (work_phone, extension);

SELECT * FROM pg_indexes WHERE schemaname = 'public';

INSERT INTO employees(first_name, last_name, work_phone, extension)
VALUES('Lily', 'Bush', '(408)-333-1234','1212');

INSERT INTO employees(first_name, last_name, work_phone, extension)
VALUES('Joan', 'Doe', '(408)-333-1234','1211');

-- INSERT INTO employees(first_name, last_name, work_phone, extension)
-- VALUES('Tommy', 'Stark', '(408)-333-1234','1211');

SELECT * FROM employees;