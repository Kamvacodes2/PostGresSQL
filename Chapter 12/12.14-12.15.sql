--  reclassifying values with case
-- example
 CASE WHEN condition THEN result
 WHEN another_condition THEN result
 ELSE result
 END

-- 
--The ANSI SQL CASE statement adds "if-then" logic to queries, useful
--for reclassifying values into categories based on data ranges.


-- CASE statement in SQL enables conditional logic within queries.
-- begins with the WHEN condition followed by the THEN result.
-- if true result is returned, and no further conditions are evaluated.
-- Multiple WHEN ... THEN clauses can be added to evaluate additional conditions.
-- optional ELSE clause can be used to define a result when no conditions are true.
--If no conditions are true and there is no ELSE clause, the statement returns NULL.
--The statement concludes with the END keyword.


-- 12. 14

--Re-classifying temperature data with CASE

SELECT max_temp,
       CASE WHEN max_temp >= 90 THEN 'Hot'
            WHEN max_temp BETWEEN 70 AND 89 THEN 'Warm'
            WHEN max_temp BETWEEN 50 AND 69 THEN 'Pleasant'
            WHEN max_temp BETWEEN 33 AND 49 THEN 'Cold'
            WHEN max_temp BETWEEN 20 AND 32 THEN 'Freezing'
            ELSE 'Inhumane'
        END AS temperature_group
FROM temperature_readings;


-- Five ranges are created for the max_temp column in the temperature_readings table using comparison operators.
-- CASE statement evaluates each max_temp value against these ranges and outputs corresponding text labels.
--  ranges are comprehensive, covering all possible values, ensuring no gaps.
-- If none of the conditions are met, the 
-- ELSE clause assigns the category "Inhumane" for temperatures below 20 degrees.
-- alternative approach could replace ELSE with a specific WHEN clause for temperatures ≤ 19 degrees.
-- first five rows of the output categorize temperatures into labels like "Freezing" and "Cold."
-- groups can be used to compare climate among different cities.


-- using case in a common table expression
WITH temps_collapsed (station_name, max_temperature_group) AS
    (SELECT station_name,
           CASE WHEN max_temp >= 90 THEN 'Hot'
                WHEN max_temp BETWEEN 70 AND 89 THEN 'Warm'
                WHEN max_temp BETWEEN 50 AND 69 THEN 'Pleasant'
                WHEN max_temp BETWEEN 33 AND 49 THEN 'Cold'
                WHEN max_temp BETWEEN 20 AND 32 THEN 'Freezing'
                ELSE 'Inhumane'
            END
    FROM temperature_readings)

SELECT station_name, max_temperature_group, count(*)
FROM temps_collapsed
GROUP BY station_name, max_temperature_group
ORDER BY station_name, count(*) DESC;

-- code reclassifies the temperatures
-- counts and groups by station name
-- to find general climate classifications of each city

-- The WITH keyword defines a CTE named temps_collapsed with two columns: station_name and max_temperature_group.
-- SELECT query is then run on the CTE, using count(*) and GROUP BY operations on both columns to aggregate the data.



