SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'logistics';

DROP DATABASE logistics;

DROP TABLESPACE IF EXISTS ts_primary;

CREATE TABLESPACE ts_primary
LOCATION '/db';

CREATE DATABASE logistics
TABLESPACE ts_primary;

-- /connect logistics

CREATE TABLE deliveries (
	delivery_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	order_date DATE,
	customer_id INT
);

INSERT INTO deliveries (order_date, customer_id)
VALUES ('2020-08-01', 1);

---

ALTER TABLESPACE dvdrental
RENAME TO dvdrental_raid;

ALTER TABLESPACE dvdrental_raid
OWNER TO hr;


--

-- DROP DATABASE dbdemo;

ALTER DATABASE dbdemo
SET TABLESPACE = pg_default;

DROP TABLESPACE demo;


