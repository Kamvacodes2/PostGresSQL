-- 12.5
--  Generating Columns with Subqueries

-- generate new columns of data with subqueries by placing a 
-- subquery in the column list after SELECT.

SELECT geo_name,
       state_us_abbreviation AS st,
       p0010001 AS total_pop,
       (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001)
        FROM us_counties_2010) AS us_median
FROM us_counties_2010;


-- 12.6

SELECT geo_name,
       state_us_abbreviation AS st,
       p0010001 AS total_pop,
       (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001)
        FROM us_counties_2010) AS us_median,
       p0010001 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001)
                   FROM us_counties_2010) AS diff_from_median
FROM us_counties_2010
WHERE (p0010001 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001)
                   FROM us_counties_2010))
       BETWEEN -1000 AND 1000;


--Subquery Use: 
--Calculates the difference between the total population and the median population, 
--placing it in a column alias diff_from_median.


--Filtering Results: Uses BETWEEN -1000 AND 1000 to show counties with
--populations within 1,000 of the median.

--Outcome: Reveals 71 counties close to the U.S. median population,
--with sample results including Cherokee County, Clarke County, and others.

--Performance Note: Subqueries can slow down queries with large datasets; 
--consider simplifying the query by removing unnecessary subqueries for efficiency.





