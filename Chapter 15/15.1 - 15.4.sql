-- Saving Time with Views , Functions, and Triggers;

-- learn shortcuts for queries and 
--  focuses on techniques to create reusable PostgreSQL database objects
-- shortcuts to encapsulate queries and logic.


-- Using Views to Simplify Queries

-- A view is a virtual table created dynamically using a saved query

-- Functionality
-- Automatically runs the saved query each time it's accessed.
-- Can be queried, joined with tables or other views, and used for updates or inserts.


-- Difference from Tables
-- views don’t store data
-- they execute their query each time they are accessed.

-- Benefits of Views:

-- Avoids duplicate query efforts.

-- Reduces complexity by showing only relevant columns.

-- Enhances security by restricting access to certain table columns.


-- Creating and Querying Views
-- 15-1: Creating a view that displays Nevada 2010 counties

CREATE OR REPLACE VIEW nevada_counties_pop_2010 AS
    SELECT geo_name,
           state_fips,
           county_fips,
           p0010001 AS pop_2010
    FROM us_counties_2010
    WHERE state_us_abbreviation = 'NV'
    ORDER BY county_fips;

-- 15.2 
SELECT * FROM nevada_counties_pop_2010;


-- 15-3: Creating a view showing population change for US counties

CREATE OR REPLACE VIEW county_pop_change_2010_2000 AS
    SELECT c2010.geo_name,
           c2010.state_us_abbreviation AS st,
           c2010.state_fips,
           c2010.county_fips,
           c2010.p0010001 AS pop_2010,
           c2000.p0010001 AS pop_2000,
           round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
               / c2000.p0010001 * 100, 1 ) AS pct_change_2010_2000
    FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
    ON c2010.state_fips = c2000.state_fips
       AND c2010.county_fips = c2000.county_fips
    ORDER BY c2010.state_fips, c2010.county_fips;


-- 15.4 Selecting columns from the county_pop_change_2010_2000 view

SELECT geo_name, -- column specification
       st,
       pop_2010,
       pct_change_2010_2000 -- pct_change_2010_2000 column is used, making the query simpler 
 							--	by avoiding the need to rewrite the entire formula.
FROM county_pop_change_2010_2000
WHERE st = 'NV' -- WHERE clause is used to filter results
LIMIT 5;

-- we view the %tage change in population for each county in Nevada



