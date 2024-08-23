-- aDvanceD querY techniques

-- Filtering with Subqueries in a WHERE Clause

--Generating Values for a Query Expression
-- 12.1
SELECT geo_name,
       state_us_abbreviation,
       p0010001
FROM us_counties_2010
WHERE p0010001 >= (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY p0010001)
    FROM us_counties_2010
    )
ORDER BY p0010001 DESC;



--Query Structure: 
--The query uses a WHERE clause with a comparison operator that includes a subquery instead of a fixed value.

--Subquery Function: 
--The subquery uses percentile_cont() to determine the 90th percentile 
--cut-off point for filtering the p0010001 column.

--Note on percentile_cont(): It works with single values, not arrays, as arrays cause the query to fail.
--Results: The subquery produces a value of 197444.6, which filters the main query.
--The main query returns 315 rows, about 10% of the total 3,143 rows in us_counties_2010.


-- Using a Subquery to Identify Rows to Delete

-- Subquery in WHERE Clause: Useful in various queries, including DELETE statements.

-- Example Use Case: For a large table, create a copy and delete unnecessary data from the backup.

-- Illustration: The example shows making a backup of the census table and then deleting all
-- but the top 10% of counties by population from the backup.

--12.2

CREATE TABLE us_counties_2010_top10 AS
SELECT * FROM us_counties_2010;

DELETE FROM us_counties_2010_top10
WHERE p0010001 < (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY p0010001)
    FROM us_counties_2010_top10
    );

SELECT count(*) FROM us_counties_2010_top10;


-- Creating Derived Tables with Subqueries

-- Derived Tables: You can convert the result of a subquery into a derived table by using it in a FROM clause. 
-- This derived table can be queried or joined like any other table.

--Example Use: Comparing average and median values of U.S. county populations to understand data distribution.
--Process: Calculate the average and median in one step using a subquery in the FROM clause,
--then compute the difference between them.

--12.3

SELECT round(calcs.average, 0) as average,
       calcs.median,
       round(calcs.average - calcs.median, 0) AS median_average_diff
FROM (
     SELECT avg(p0010001) AS average,
            percentile_cont(.5)
                WITHIN GROUP (ORDER BY p0010001)::numeric(10,1) AS median
     FROM us_counties_2010
     )
AS calcs;


--Subquery: Calculates average and median of the p0010001 population column using avg() 
--and percentile_cont(), with column aliases.\

-- Alias: The subquery is named calcs to be used as a table in the main query.

--Main Query: Subtracts median from average, rounds the result, and labels it median_average_diff.

--Result: Shows average of 98,233, median of 25,857, and a difference of 72,376, 

--indicating high-population counties skew the average significantly compared to the median.









