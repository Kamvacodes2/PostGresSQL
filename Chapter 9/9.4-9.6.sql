-- 9.4
--  “Using NULL to Find Rows with Missing Values” 

SELECT est_number,
       company,
       city, 
       st,
       zip
 FROM meat_poultry_egg_inspect
 WHERE st IS NULL;

--  This query returns three rows that don’t have a value in the st column: 

--  Checking for Inconsistent Data Values
-- 9.5
-- We can check for inconsistently entered data within a column by using GROUP BY with count(). 

SELECT company, 
       count(*) AS company_count
 FROM meat_poultry_egg_inspect
 GROUP BY company
 ORDER BY company ASC;

--  Scrolling through the results reveals a number of cases in which a 
-- company’s name is spelled several different ways.



-- Checking for Malformed Values Using length()
-- It's important to check for unexpected values in columns that 
-- should have consistent formatting

-- For instance, when converting an Excel file to CSV, 
-- storing the ZIP Code as a "General" number instead of text 
--can cause leading zeros to be lost (e.g., 07502 becomes 7502).

-- 9.6
SELECT length(zip),
       count(*) AS length_count
 FROM meat_poultry_egg_inspect
 GROUP BY length(zip)
 ORDER BY length(zip) ASC;


