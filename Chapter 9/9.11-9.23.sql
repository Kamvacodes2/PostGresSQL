--  Updating Rows Where Values Are Missing
-- 9.11

 UPDATE meat_poultry_egg_inspect
 SET st = 'MN'
 WHERE est_number = 'V18677A';
 UPDATE meat_poultry_egg_inspect
 SET st = 'AL'
 WHERE est_number = 'M45319+P45319';
 UPDATE meat_poultry_egg_inspect
 SET st = 'WI'
 WHERE est_number = 'M263A+P263A+V263A';

-- Restoring Original Values

-- if we botch an update by providing the wrong values or updating the wrong rows?
-- Because of the back up we can recopy the values from the source
-- 9.12

UPDATE meat_poultry_egg_inspect
SET st = st_copy;
UPDATE meat_poultry_egg_inspect original
SET st = backup.st
FROM meat_poultry_egg_inspect_backup backup
WHERE original.est_number = backup.est_number;

--9.13
--  Updating Values for Consistency
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN company_standard varchar(100);
UPDATE meat_poultry_egg_inspect
SET company_standard = company

--9.14
 UPDATE meat_poultry_egg_inspect
 SET company_standard = 'Armour-Eckrich Meats'
 WHERE company LIKE 'Armour%';

 SELECT company, company_standard
 FROM meat_poultry_egg_inspect
 WHERE company LIKE 'Armour%';

-- values are now standardized with consistent spelling


-- Repairing ZIP Codes Using Concatenation
--9.15
--  column that lost leading zeros as the result of my deliberate data faux pas.

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN zip_copy varchar(5);
UPDATE meat_poultry_egg_inspect
SET zip_copy = zip;

-- 9.16
--Next, we use the code in Listing 9-16 to perform the first update:

 UPDATE meat_poultry_egg_inspect
 SET zip = '00' || zip
 WHERE st IN('PR','VI') AND length(zip) = 3;

--SET operation: Updates the zip column by concatenating '00' with the existing zip value.
-- Condition: 
-- Applies the update only to rows where the st column has state codes 'PR' or 'VI' and the zip length is 3.
-- Purpose: Specifically targets ZIP codes for Puerto Rico and the Virgin Islands that are missing leading zeros.
-- Result: The query should update 86 rows, as expected.

-- 9.17

--Repair remaining zips
UPDATE meat_poultry_egg_inspect
SET zip = '0' || zip
WHERE st IN('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4;


-- Updating Values Across Tables

--  allows you to incorporate external data as context 
-- when updating values in the original table.
-- 9.18

 CREATE TABLE state_regions (
    st varchar(2) CONSTRAINT st_key PRIMARY KEY,
    region varchar(20) NOT NULL
 );

 COPY state_regions
 FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_09\state_regions.csv'
 WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 9.19

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN inspection_date date;
UPDATE meat_poultry_egg_inspect inspect
SET inspection_date = '2019-12-01'
WHERE EXISTS (SELECT state_regions.region 
              FROM state_regions 
              WHERE inspect.st = state_regions.st 
                    AND state_regions.region = 'New England');

-- ALTER TABLE: 
-- Adds a new column called inspection_date to the meat_poultry_egg_inspect table.

-- UPDATE Statement:

--Alias: Uses an alias inspect for the meat_poultry_egg_inspect table for readability.
--SET Clause: Assigns the date 2019-12-01 to the new inspection_date column.
--WHERE EXISTS Clause: 
-- Includes a subquery to match rows in the meat_poultry_egg_inspect table
-- with the state_regions table based on the st column, 
-- updating only rows that correspond to the New England region.


-- 9.20
 SELECT st, inspection_date 
FROM meat_poultry_egg_inspect
 GROUP BY st, inspection_date
 ORDER BY st;

--  The top of the output shows Connecticut has received a date,

-- deleting unnecessary data

-- removing rows from a table, we’ll use the DELETE FROM 
--  remove a column from a table, we’ll use ALTER TABLE
-- remove a whole table from the database, we’ll use the DROP TABLE 
-- removing the constraint, deleting data in another table, or deleting another table. 


--  Deleting Rows from a Table
--9.21
DELETE FROM meat_poultry_egg_inspect
WHERE st IN('PR','VI')

-- This means the 86 rows where the st column held either PR or VI have been 
-- removed from the table.

--  Deleting a Column from a Table
-- 9.22
-- ALTER TABLE table_name DROP COLUMN column_name;

 ALTER TABLE meat_poultry_egg_inspect DROP COLUMN zip_copy;


-- Deleting a Table from a Database;
-- DROP TABLE table_name;

-- 9.23

DROP TABLE meat_poultry_egg_inspect_backup;


