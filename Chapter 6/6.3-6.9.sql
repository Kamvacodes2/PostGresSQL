---6.5 LEFT JOIN and RIGHT JOIN

SELECT * FROM school_left LEFT JOIN school_right
ON school_left.id = school_right.id;


-- 6.6  RIGHT JOIN
SELECT * FROM school_left RIGHT JOIN school_right
ON school_left.id = school_right.id;

--WHEN TO USE?
-- You want your query results to contain all the rows from one of the tables.

--You want to look for missing values in one of the tables;
-- when you’re comparing data about an entity representing two different time periods.
-- When you know some rows in a joined table won’t have matching values. 

-- 6.7 FULL OUTER JOIN
-- When you want to see all rows from both tables in a join 
--not looking for any specific match

SELECT * FROM school_left FULL OUTER JOIN school_right 
ON school_left.id = school_right.id;

--  merge two data sources that partially overlap
-- to visualize the degree to which the tables share matching values


--  CROSS JOIN
-- 6.8

-- lines up each row in the left table with each row in the right table 
--to present all possible combinations of rows.
-- no need to use id or ON

SELECT * FROM school_left CROSS JOIN school_right;

-- practical use would be generating data to create a checklist, 
-- such as all colors you’d want to offer for each shirt style in a warehouse

-- Using NULL to Find Missing Data in Joins:

-- When you join tables, it's essential to check for missing data to 
-- understand the quality of your data. NULL in SQL represents missing or unknown data,
-- unlike 0 or an empty string, which could have specific meanings.
-- To find rows where data is missing in one table after a join, use NULL. 
--  Use IS NOT NULL if you want to filter for rows with data.
-- want to see rows from the left table that don't have a match in the right table, filter with IS NULL

-- 6.9 

SELECT * FROM school_left LEFT JOIN school_right
ON school_left.id = school_right.id
WHERE school_right.id IS NULL;




