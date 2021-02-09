-- CREATE DATABASE db;

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'db';

ALTER DATABASE db RENAME TO db2;

ALTER DATABASE db2 RENAME TO newdb;