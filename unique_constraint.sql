DROP TABLE IF EXISTS person;
CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50) UNIQUE
);

DROP TABLE person;
CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	UNIQUE(email)
);

INSERT INTO person (first_name, last_name, email)
VALUES ('john','doe','j.doe@postgresqltutorial.com');

--INSERT INTO person(first_name,last_name,email)
--VALUES('jack','doe','j.doe@postgresqltutorial.com');

SELECT * FROM person;

DROP TABLE IF EXISTS equipment;
CREATE TABLE equipment (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	equip_id VARCHAR(16) NOT NULL
);

CREATE UNIQUE INDEX equipment_equip_id
ON equipment (equip_id);

ALTER TABLE equipment
ADD CONSTRAINT unique_equip_id
UNIQUE USING INDEX equipment_equip_id;

---
DROP TABLE equipment;
CREATE TABLE equipment (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	equip_id VARCHAR(16) NOT NULL
);

ALTER TABLE equipment
ADD CONSTRAINT uniq_equip_id UNIQUE(equip_id);


---
SELECT
	datid,
	datname,
	usename,
	state
FROM
	pg_stat_activity;
	
