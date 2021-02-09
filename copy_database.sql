--SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dvdrental';

CREATE DATABASE dvdrental_test
WITH TEMPLATE dvdrental;

-- pg_dump -U postgres -d sourcedb -f sourcedb.sql

-- CREATE DATABASE targetdb;
-- psql -U postgres -d targetdb -f sourcedb.sql

-- pg_dump -C -h localhost -U postgres dvdrental | psql -h remote -U postgres dvdrental

