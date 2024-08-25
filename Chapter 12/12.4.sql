-- Joining Derived Tables

-- Joining derived tables lets you perform multiple preprocessing steps before arriving 
-- at the result.
--12.4

SELECT census.state_us_abbreviation AS st,
       census.st_population,
       plants.plant_count,
       round((plants.plant_count/census.st_population::numeric(10,1)) * 1000000, 1)
           AS plants_per_million
FROM
    (
         SELECT st,
                count(*) AS plant_count
         FROM meat_poultry_egg_inspect
         GROUP BY st
    )
    AS plants
JOIN
    (
        SELECT state_us_abbreviation,
               sum(p0010001) AS st_population
        FROM us_counties_2010
        GROUP BY state_us_abbreviation
    )
    AS census
ON plants.st = census.state_us_abbreviation
ORDER BY plants_per_million DESC;


--Rate Calculation: Uses derived tables to find the rate of plants per million by dividing 
--the number of plants by the population and multiplying by 1 million.

--Subqueries:
--First Subquery: Counts plants by state, labeled as plants.
--Second Subquery: Sums total population by state, labeled as census.

--Joining: The derived tables are joined on state abbreviations.
--Result: Lists states with their plant count, population, and plants per million in descending order.
--The top states are major meat producers, while Washington, D.C., and Wyoming have the fewest plants per million.

