--  Creating Backup Tables
-- 9.8

-- Before modifying a table, it’s a good idea to make a copy for reference 

CREATE TABLE meat_poultry_egg_inspect_backup AS
SELECT * FROM meat_poultry_egg_inspect;


 SELECT 
    (SELECT count(*) FROM meat_poultry_egg_inspect) AS original,
    (SELECT count(*) FROM meat_poultry_egg_inspect_backup) AS backup;

-- Restoring Missing Column Values

-- Creating a Column Copy

 ALTER TABLE meat_poultry_egg_inspect ADD COLUMN st_copy varchar(2);
 UPDATE meat_poultry_egg_inspect
 SET st_copy = st;
-- ALTER TABLE statement adds a new column called 
-- st_copy with the same data type as the existing st column.

-- The UPDATE statement then fills the st_copy column
-- with the values from the st column for every row since no WHERE clause is used

-- 9.10 confirm column copy
 SELECT st,
       st_copy
 FROM meat_poultry_egg_inspect
 ORDER BY st;

