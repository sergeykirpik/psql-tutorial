--DATE  4713 BC  5874897 AD  2000-12-31

DROP TABLE IF EXISTS documents;
CREATE TABLE documents (
	document_id SERIAL PRIMARY KEY,
	header_text VARCHAR(255) NOT NULL,
	posting_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO documents (header_text)
VALUES ('Billing to customer XYZ')
RETURNING *;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR (255),
	last_name VARCHAR (355),
	birth_date DATE NOT NULL,
	hire_date DATE NOT NULL
);

INSERT INTO employees (first_name, last_name, birth_date, hire_date)
VALUES
	('Shannon','Freeman','1980-01-01','2005-01-01'),
	('Sheila','Wells','1978-02-05','2003-01-01'),
	('Ethel','Webb','1975-01-01','2001-01-01')
RETURNING *;

SELECT NOW();

SELECT NOW()::DATE;

SELECT CURRENT_DATE;

SELECT TO_CHAR(NOW()::DATE, 'dd/mm/yyyy');

SELECT TO_CHAR(NOW()::DATE, 'Mon dd, yyyy');

SELECT
	first_name,
	last_name,
	now() - hire_date as diff
FROM
	employees;
	
SELECT
	employee_id,
	first_name,
	last_name,
	AGE(birth_date)
FROM
	employees;
	
SELECT
	employee_id,
	first_name,
	last_name,
	AGE('2015-01-01', birth_date)
FROM
	employees;
	
SELECT
	employee_id,
	first_name,
	last_name,
	EXTRACT (YEAR FROM birth_date) AS year,
	EXTRACT (MONTH FROM birth_date) AS month,
	EXTRACT (DAY FROM birth_date) AS day
FROM
	employees;