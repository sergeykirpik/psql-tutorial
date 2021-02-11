--INTERVAL  16 bytes  -178,000,000  178,000,000
--INTERVAL '2 months ago'
--INTERVAL '3 hours 20 minutes'

SELECT
	now(),
	now() - INTERVAL '1 year 3 hours 20 minutes'
		AS "3 hours 20 minutes ago of last year";

SELECT INTERVAL '2 months ago';

SELECT INTERVAL '1 year 2 months 3 days';

SELECT INTERVAL '2 weeks ago';

--ISO 8601
SELECT INTERVAL 'P6Y5M4DT3H2M1S';

SELECT INTERVAL 'P0006-05-04T03:02:01';

SHOW INTERVALSTYLE; --postgres

SET intervalstyle = 'sql_standard';

SELECT INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';

SET intervalstyle = 'postgres_verbose';

SELECT INTERVAL 'P6Y5M4DT3H2M1S';

SET intervalstyle = 'iso_8601';

SELECT INTERVAL 'P6Y5M4DT3H2M1S';

SET intervalstyle = 'postgres';

SELECT INTERVAL '2h 50m' + INTERVAL '10m';

SELECT INTERVAL '2h 50m' - INTERVAL '50m';

SELECT 600 * INTERVAL '1 minute';

SELECT TO_CHAR(INTERVAL '17h 20m 05s', 'HH24:MI:SS');

SELECT EXTRACT( MINUTE FROM INTERVAL '5 hours 21minutes' );

SELECT
	justify_days(INTERVAL '30 days'),
	justify_hours(INTERVAL '24 hours');
	
SELECT
	INTERVAL '1 year -1 hour',
	justify_interval(INTERVAL '1 year -1 hour');