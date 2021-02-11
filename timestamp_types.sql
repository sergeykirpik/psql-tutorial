--TIMESTAMP
--TIMESTAMPTZ

SELECT
	typname,
	typlen
FROM
	pg_type
WHERE
	typname ~ '^timestamp';
	
DROP TABLE IF EXISTS timestamp_demo;
CREATE TABLE timestamp_demo (
	ts TIMESTAMP,
	tstz TIMESTAMPTZ
);

SHOW TIMEZONE;

SET TIMEZONE = 'America/Los_Angeles';

SHOW TIMEZONE;

INSERT INTO timestamp_demo (ts, tstz)
VALUES ('2016-06-22 19:10:25-07','2016-06-22 19:10:25-07');

SELECT * FROM timestamp_demo;

SET TIMEZONE = 'America/New_York';

SELECT * FROM timestamp_demo;

SELECT NOW();

SELECT CURRENT_TIMESTAMP;

SELECT CURRENT_TIME;

SELECT TIMEOFDAY();

SHOW TIMEZONE;

SELECT timezone('America/Los_Angeles', '2016-06-01 00:00');

SELECT timezone('America/New_York', '2016-06-01 00:00'::timestamptz);
