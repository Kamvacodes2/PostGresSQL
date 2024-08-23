-- 9.7

-- Using the WHERE clause, we can check the details of the results to see which 
-- states these shortened ZIP Codes correspond to

SELECT st, 
       count(*) AS st_count
FROM meat_poultry_egg_inspect
WHERE length(zip) < 5
GROUP BY st
ORDER BY st ASC;

--  The length() function inside the WHERE clause returns a count of rows 
-- where the ZIP Code is less than five characters for each state code. 

-- •	Missing values for three rows in the st column
-- •	Inconsistent spelling of at least one company’s name
-- •	Inaccurate ZIP Codes due to file conversion

--tables to columns, data types, and values—can be modified after creation as needs change.
-- ALTER TABLE command allows you to add, alter, or drop columns, among other options
--  UPDATE command lets you change values in a table's columns,
-- using the WHERE clause to specify which rows to update.
