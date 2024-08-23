-- 9.24
START TRANSACTION;
UPDATE meat_poultry_egg_inspect
SET company = 'AGRO Merchantss Oakland LLC'
WHERE company = 'AGRO Merchants Oakland, LLC';

SELECT company
FROM meat_poultry_egg_inspect
WHERE company LIKE 'AGRO%'
ORDER BY company;

ROLLBACK;

-- improving performance when updating large tables

--Table Size Inflation: 
-- Adding a column and filling it with values in PostgreSQL 
-- can inflate the table’s size due
-- to the creation of new row versions without deleting old ones.


--Impact: For small datasets, the size increase is negligible, 
-- but it can be substantial for large tables with many rows, 
-- increasing update time and disk usage.

--Alternative Approach: Instead of adding a column and updating it, 
-- you can save disk space by copying the entire table with the new populated column, 
--then renaming the tables to replace the original with the copy, 
-- keeping the original as a backup.


-- 9.25
--  shows how to copy meat_poultry_egg_inspect into a new table 
-- while adding a populated column.


CREATE TABLE meat_poultry_egg_inspect_backup AS
	SELECT *,
	'2018-02-07'::date AS reviewed_date 
FROM meat_poultry_egg_inspect;

-- we select everything with * and then add a new column called reviewed_date


-- 9.26
ALTER TABLE meat_poultry_egg_inspect RENAME TO meat_poultry_egg_inspect_temp;

ALTER TABLE meat_poultry_egg_inspect_backup 
 RENAME TO meat_poultry_egg_inspect;

 ALTER TABLE meat_poultry_egg_inspect_temp 
    RENAME TO meat_poultry_egg_inspect_backup;






