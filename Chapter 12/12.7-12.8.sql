--  Subquery Expressions

--Subquery Filtering: Use subqueries in WHERE clauses to filter 
--rows based on conditions evaluated as true or false.
--Subquery Expressions: Combine keywords with subqueries for filtering
--Focus: This summary covers the syntax for two specific subquery expressions.


 -- Common table expressions
-- 12.7

WITH
    large_counties (geo_name, st, p0010001)
AS
    (
        SELECT geo_name, state_us_abbreviation, p0010001
        FROM us_counties_2010
        WHERE p0010001 >= 100000
    )
SELECT st, count(*)
FROM large_counties
GROUP BY st
ORDER BY count(*) DESC;

--CTE Definition: The WITH ... 
--AS block creates a Common Table Expression (CTE) named large_counties.

--Column Definition: Define column names without data types; 
--the CTE inherits types from the subquery.

--Subquery Requirements: Must return the same number of columns as the CTE, 
--but column names can differ. 
--Including column names in the CTE is optional but recommended for clarity.

--Main Query: Counts and groups rows by state (st), then orders by count in descending order.


-- Texas, California, and Florida are among the states with 
-- the highest number of counties with a population of 100,000 or more.


-- 12.8
-- CTE Advantages:
--Pre-stage Data: Allows you to prepare subsets of data for more complex analysis.

--Reusability: CTEs can be reused multiple times in the main query, 
--avoiding repetition of SELECT statements.

--Readability: Enhances code readability compared to using multiple subqueries.

WITH
    counties (st, population) AS
    (SELECT state_us_abbreviation, sum(population_count_100_percent)
     FROM us_counties_2010
     GROUP BY state_us_abbreviation),

    plants (st, plants) AS
    (SELECT st, count(*) AS plants
     FROM meat_poultry_egg_inspect
     GROUP BY st)

SELECT counties.st,
       population,
       plants,
       round((plants/population::numeric(10,1))*1000000, 1) AS per_million
FROM counties JOIN plants
ON counties.st = plants.st
ORDER BY per_million DESC;


-- CTE Definition:
--Subqueries: Define two tables—counties (population per state) 
--and plants (number of plants per state).

--Join and Calculation: Join these tables on the st column and 
--calculate the rate per million. This approach is more readable than using derived tables.

--Simplifying Queries: CTEs can streamline queries with redundant code, 
--such as using a subquery for median calculation in multiple locations.



