-- pgsql \l; \l+; \list
SELECT datname FROM pg_database;

-- pgsql \dt; \dt+
SELECT *
FROM pg_tables
WHERE schemaname != 'pg_catalog' AND
      schemaname != 'information_schema';
	  
-- pgsql \d table_name
SELECT *
FROM information_schema."columns";

SELECT
	table_name,
	column_name,
	data_type
FROM
	information_schema.columns
WHERE
	table_name = 'contacts';
	
-- psql -d database -U user -W
-- psql -U user -h host "dbname=db sslmode=require"
-- =# \connect dbname username
-- =# 
-- \list          				(list databases) 
-- \dt            				(list tables) 
-- \d table_name  				(describe table)
-- \dn 							(list schemas) 
-- \df 							(list functions) 
-- \dv 							(list views) 
-- \du 							(list roles)
-- \z							(list privileges)
-- \g  							(execute last command) 
-- \s  							(history) 
-- \s filename 					(save history) 
-- \i filename 					(run script) 
-- \timing 
-- \e 							(external editor) 
-- \a 							(unaligned/aligned format) 
-- \H 							(html format)

-- pg_dump -U username -W -F t database_name > backupfile.tar
-- pg_dump -U username -W -F p database_name > backupfile.sql

-- psql -U username -f backupfile.sql
-- psql -U username -d database_name -f objects.sql

-- pg_restore --dbname=newdvdrental --verbose dvdrental.tar
-- pg_restore --dbname=dvdrental_tpl --section=pre-data dvdrental.tar