-- 8.3

--  Counting Rows and Values Using count()

 SELECT count(*)
 FROM pls_fy2014_pupld14a;

 SELECT count(*)
 FROM pls_fy2009_pupld09a;


--  Counting Values Present in a Column


-- 8.4

 SELECT count(salaries)
 FROM pls_fy2014_pupld14a;


-- 8.5
--  Counting Distinct Values in a Column

SELECT count(libname)
FROM pls_fy2014_pupld14a;


 SELECT count(DISTINCT libname)
 FROM pls_fy2014_pupld14a;

-- returns a count of distinct values from a column.
-- used to see unique values in one column
-- DISTINCT to remove duplicates reduces the number of library names 
--to the 8,515 that are unique

-- 8.6
-- Finding Maximum and Minimum Values Using max() and min()
--  Knowing the largest and smallest numbers in a column
 SELECT max(visits), min(visits)
 FROM pls_fy2014_pupld14a;

-- the survey creators used negative numbers to indicate

-- 1. A value of -1 indicates a “nonresponse” to that question.
-- 2. A value of -3 indicates “not applicable” and is used when a library 
-- agency has closed either temporarily or permanently.


-- 8.7 Aggregating Data Using GROUP BY

SELECT stabr
FROM pls_fy2014_pupld14a
GROUP BY stabr
ORDER BY stabr;

-- Bonus: there are 55 in 2009.
SELECT stabr
FROM pls_fy2009_pupld09a
GROUP BY stabr
ORDER BY stabr;








