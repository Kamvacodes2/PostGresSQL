-- Programming Your Own Functions

-- Creating the percent_change() Function

-- basic idea of function percent change = (New Number – Old Number) / Old Number

--  15-9: Creating a percent_change function
-- To delete this function: DROP FUNCTION percent_change(numeric,numeric,integer);

CREATE OR REPLACE FUNCTION -- Use CREATE OR REPLACE FUNCTION with a name and argument list.
percent_change(new_value numeric,
               old_value numeric, -- Arguments:Specify argument names
               decimal_places integer DEFAULT 1)-- , data types, and optional default values.
RETURNS numeric AS -- RETURNS to define the return type (e.g., numeric).
'SELECT round(
        ((new_value - old_value) / old_value) * 100, decimal_places
);'
-- Main Logic: Place the function’s calculation inside a SELECT query using argument names.
LANGUAGE SQL -- Specify the language used, such as SQL or PL/pgSQL
IMMUTABLE -- keyword indicates the function doesn't change the database, boosting performance.
RETURNS NULL ON NULL INPUT; -- RETURNS NULL ON NULL INPUT ensures a NULL result if any input is NULL.

-- Using the percent_change() Function
--  15-10: Testing the percent_change() function
SELECT percent_change(110, 108, 2);


-- The result indicates that there is a 1.85 percent increase between 108 and 110

-- 15-11: Testing percent_change() on Census data

SELECT c2010.geo_name,
       c2010.state_us_abbreviation AS st,
       c2010.p0010001 AS pop_2010,
       percent_change(c2010.p0010001, c2000.p0010001) AS pct_chg_func,
       round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_chg_formula
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
ORDER BY pct_chg_func DESC
LIMIT 5;

-- we can compare results. 
-- we know the function works as intended,

-- Updating Data with a Function
-- 15.12 Adding a column to the teachers table and seeing the data

ALTER TABLE teachers ADD COLUMN personal_days integer;

SELECT first_name,
       last_name,
       hire_date,
       personal_days
FROM teachers;

-- personal_days column holds NULL values because we haven’t provided any values yet

-- create a new function

CREATE OR REPLACE FUNCTION update_personal_days() -- CREATE OR REPLACE FUNCTION with no arguments needed.
RETURNS void AS $$ -- Use RETURNS void to indicate the function returns no data, just updates.
	--  Use $$ to enclose the function’s commands for clarity and to avoid quote issues.
BEGIN -- Begin-End Block: Start with BEGIN ... END; to encapsulate the function’s logic.
    UPDATE teachers -- Logic: Inside, use an UPDATE statement with a CASE statement to calculate intervals based on hire date.
    SET personal_days =
        CASE WHEN (now() - hire_date) BETWEEN '5 years'::interval
                                      AND '10 years'::interval THEN 4
             WHEN (now() - hire_date) > '10 years'::interval THEN 5
             ELSE 3
        END;
    RAISE NOTICE 'personal_days updated!'; --  Use RAISE NOTICE to display a message when the function completes.
END;
$$ LANGUAGE plpgsql; -- Specify LANGUAGE PL/pgSQL for the function.

-- -- To run the function:
SELECT update_personal_days();

SELECT first_name,
       last_name,
       hire_date,
       personal_days
FROM teachers;

-- now each person has values for the personal days;

-- Using the Python Language in a Function
-- 15-14: Enabling the PL/Python procedural language

CREATE EXTENSION plpython3u;

-- skip use SQL

-- 15-15: create the trim_county() function
CREATE OR REPLACE FUNCTION trim_county(input_string TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN REPLACE(input_string, ' County', '');
END;
$$ LANGUAGE plpgsql;

 --15-16: Testing the trim_county() function

SELECT geo_name,
       trim_county(geo_name)
FROM us_counties_2010
ORDER BY state_fips, county_fips
LIMIT 5;

-- the trim_county() function evaluated each value in the 
-- geo_name column and removed a space and the word County when present



