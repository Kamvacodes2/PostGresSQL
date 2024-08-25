-- 12.9

WITH us_median AS 
    (SELECT percentile_cont(.5) 
     WITHIN GROUP (ORDER BY p0010001) AS us_median_pop
     FROM us_counties_2010)

SELECT geo_name,
       state_us_abbreviation AS st,
       p0010001 AS total_pop,
       us_median_pop,
       p0010001 - us_median_pop AS diff_from_median 
FROM us_counties_2010 CROSS JOIN us_median
WHERE (p0010001 - us_median_pop)
       BETWEEN -1000 AND 1000;

--  find the median population using percentile_cont()
--  we reference the us_median_pop column on its own as part of a calculated column and in a WHERE clause
--  To make the value available to every row in the us_counties_2010 tableuse the CROSS JOIN query.

-- only had to write the subquery once to find the median
-- save time, but it also lets you revise the query more easily. 

-- Cross tabulations
-- Install the crosstab() function via the tablefunc module

CREATE EXTENSION tablefunc;

-- 12.10  Tabulating Survey Results

CREATE TABLE ice_cream_survey (
    response_id integer PRIMARY KEY,
    office varchar(20),
    flavor varchar(20)
);

COPY ice_cream_survey
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_12\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

-- 12.11

SELECT *
  FROM crosstab('SELECT office,
 flavor,
 count(*)
               FROM ice_cream_survey
               GROUP BY office, flavor
               ORDER BY office',
	'SELECT flavor 
               FROM ice_cream_survey
               GROUP BY flavor
               ORDER BY flavor')
	AS (office varchar(20),
    chocolate bigint,
    strawberry bigint,
	vanilla bigint);


--The query uses the crosstab() function to generate a pivot table 
--that shows how different offices voted for various ice cream flavors.

--Subquery 1:

--Purpose: Generates the main data for the crosstab.
--Columns:

--Row Names: office
--Category Columns: flavor

--Values: Count of votes for each flavor at each office.

--Subquery 2:

--Purpose: Defines the category columns (flavors).
--Output: Unique flavors, ordered alphabetically.
	
--Output:

--The resulting crosstab displays the count of each flavor selected at each office, 
--making it easy to compare preferences. For instance, the Midtown office favors chocolate,
--while the Downtown office prefers strawberry.


