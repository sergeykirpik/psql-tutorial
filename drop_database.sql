--DROP DATABASE sales;

SELECT
	*
FROM
	pg_stat_activity
WHERE
	datname = 'sales';
	
SELECT
	pg_terminate_backend(pid)
FROM
	pg_stat_activity
WHERE
	datname = 'sales';
	
SELECT
	*
FROM
	pg_stat_activity
WHERE
	datname = 'sales';
	
DROP DATABASE sales;
