-- 5.11
--  Median and Percentiles with Census Data

 SELECT sum(p0010001) AS "County Sum",
       round(avg(p0010001), 0) AS "County Average",
       percentile_cont(.5)
       WITHIN GROUP (ORDER BY p0010001) AS "County Median"
 FROM us_counties_2010


-- 5.12

--  Finding Other Quantiles with Percentile Function

 SELECT percentile_cont(array[.25,.5,.75])
       WITHIN GROUP (ORDER BY p0010001) AS "quartiles"
 FROM us_counties_2010;

-- 5.13

 SELECT unnest(
            percentile_cont(array[.25,.5,.75])
            WITHIN GROUP (ORDER BY p0010001)
            ) AS "quartiles"
 FROM us_counties_2010;


