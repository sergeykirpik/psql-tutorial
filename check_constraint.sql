DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE CHECK(birth_date > '1900-01-01'),
	joined_date DATE CHECK(joined_date > birth_date),
	--salary NUMERIC CHECK(salary > 0)
	salary NUMERIC CONSTRAINT positive_salary CHECK(salary > 0)
);

DROP TABLE employees;

CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE,
	joined_date DATE,
	salary NUMERIC
);

ALTER TABLE employees
ADD CHECK(salary > 0);

ALTER TABLE employees
DROP CONSTRAINT employees_salary_check;

ALTER TABLE employees
ADD CONSTRAINT positive_salary CHECK(salary > 0);

-- INSERT INTO employees (first_name, last_name, birth_date, joined_date, salary)
-- VALUES ('John', 'Doe', '1972-01-01', '2015-07-01', -100000);

DROP TABLE IF EXISTS prices_list;
CREATE TABLE prices_list (
	id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC NOT NULL,
	valid_from DATE NOT NULL,
	valid_to DATE NOT NULL
);

ALTER TABLE prices_list
ADD CONSTRAINT price_discount_check
CHECK (
	price > 0
	AND discount >= 0
	AND price > discount
);

ALTER TABLE prices_list
ADD CONSTRAINT valid_range_check
CHECK (valid_to >= valid_from);