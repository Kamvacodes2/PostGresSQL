-- 5.7
--  Finding Percentages of the Whole

 SELECT geo_name,
       state_us_abbreviation AS "st",
       (CAST (p0010006 AS numeric(8,1)) / p0010001) * 100 AS "pct_asian"
 FROM us_counties_2010
 ORDER BY "pct_asian" DESC;

