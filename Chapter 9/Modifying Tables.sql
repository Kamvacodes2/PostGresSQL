-- Modifying Tables with ALTER TABLE

--  The code for adding a column to a table 
-- ALTER TABLE table ADD COLUMN column data_type;

-- we can remove a column with the following syntax
--  ALTER TABLE table DROP COLUMN column;

--  change the data type of a column
-- ALTER TABLE table ALTER COLUMN column SET DATA TYPE data_type;

-- Adding a NOT NULL constraint to a column 
-- ALTER TABLE table ALTER COLUMN column SET NOT NULL;

-- Removing the NOT NULL constraint
-- ALTER TABLE table ALTER COLUMN column DROP NOT NULL

--  Modifying Values with UPDATE
--  UPDATE table
 -- SET column = value;


-- We can update values 
-- in multiple columns at a time by adding additional columns and source values,

--  UPDATE table
 -- SET column_a = value,
 -- 	column_b = value;


--  To restrict the update to particular rows, we add a WHERE clause with 
-- some criteria

--  UPDATE table
--  SET column = value
--  WHERE criteria;


-- We can also update one table with values from another table.

--UPDATE table
--SET column = (SELECT column 
--FROM table_b  WHERE 
--table.column = table_b.column)
--WHERE EXISTS (SELECT column FROM table_b 
--WHERE table.column = table_b.column);




