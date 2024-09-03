-- core theme; track and conserve space in your databases

--  PostgreSQL VACUUM feature, which lets you shrink the size of tables by removing unused rows

-- removed deadrows that arise as a result of updates

-- 17-1: Creating a table to test vacuuming

CREATE TABLE vacuum_test (
    integer_column integer
);


-- 17-2: Determining the size of vacuum_test

SELECT pg_size_pretty(
           pg_total_relation_size('vacuum_test')
       );

-- pg_size_pretty() u, converts bytes to a more 
-- easily understandable format in kilobytes, megabytes, or gigabytes


-- 17-3: Inserting 500,000 rows into vacuum_test

INSERT INTO vacuum_test
SELECT * FROM generate_series(1,500000);

-- Test its size again
SELECT pg_size_pretty(
           pg_table_size('vacuum_test')
       );

-- Checking Table Size After Updates
UPDATE vacuum_test
SET integer_column = integer_column + 1;

-- -- Test its size again (35 MB)
SELECT pg_size_pretty(
           pg_table_size('vacuum_test')
       );

-- the size doubled
-- a new row is created, however the old row is still kept and becomes a deadrow which results in a much larger space
--take up

-- 17-5: Viewing autovacuum statistics for vacuum_test

SELECT relname,
       last_vacuum,
       last_autovacuum,
       vacuum_count,
       autovacuum_count
FROM pg_stat_all_tables
WHERE relname = 'vacuum_test';

-- To see all columns available
SELECT *
FROM pg_stat_all_tables
WHERE relname = 'vacuum_test';

--pg_stat_all_tables view: Displays table names (relname) and various statistics.
--Key Data Points:
--last_vacuum (v): Last manual vacuum time.
--last_autovacuum (w): Last automatic vacuum time.
--vacuum_count (x): Number of manual vacuums.
--autovacuum_count (y): Number of automatic vacuums.

-- Running VACUUM Manually

-- 17-6: Running VACUUM manually

VACUUM vacuum_test;

VACUUM; -- vacuums the whole database

VACUUM VERBOSE; -- provides messages

-- Reducing Table Size with VACUUM FULL
--  17-7: Using VACUUM FULL to reclaim disk space


-- VACUUM FULL: Frees space by returning it to disk, unlike the default VACUUM which only marks space as reusable.
-- Process: Creates a new version of the table, discarding dead rows.
-- Caveats:
-- 	Time-Consuming: Takes longer to complete than the regular VACUUM.
-- 	Exclusive Access: Requires exclusive table access, preventing updates during the operation.
--Regular VACUUM: Can run concurrently with updates and other operations.

VACUUM FULL vacuum_test;

-- Test its size again
SELECT pg_size_pretty(
           pg_table_size('vacuum_test')
       );


-- Changing Server Settings
-- It’s possible to alter dozens of settings for your PostgreSQL server by editing 
-- values in postgresql.conf

-- 17-8: Showing the location of postgresql.conf

SHOW config_file;

-- 17-9 shows some other settings you might want to explore, which 
-- are excerpted from the postgresql.conf section “Client Connection Defaults.” 
-- Use your text editor to search the file for the following settings.

datestyle = 'iso, mdy'
timezone = 'US/Eastern'
default_text_search_config = 'pg_catalog.english'


-- 17.10 find the location of your PostgreSQL data directory

SHOW data_directory;

-- Using pg_dump to Back Up a Database or Table

-- 17-11: Backing up the analysis database with pg_dump
pg_dump -d analysis -U [user_name] -Fc > analysis_backup.sql

-- Back up just a table
pg_dump -t 'train_rides' -d analysis -U [user_name] -Fc > train_backup.sql 

-- Listing 17-12: Restoring the analysis database with pg_restore

pg_restore -C -d postgres -U postgres analysis_backup_custom.sql




