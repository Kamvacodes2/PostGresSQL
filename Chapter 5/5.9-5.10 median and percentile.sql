-- 5.9
-- aggregate Functions for averages and sums

SELECT sum(p0010001) AS "County Sum",round(avg(p0010001), 0) AS "County Average"
 FROM us_counties_2010;


-- 5.10 Finding the Median with Percentile Functions

CREATE TABLE percentile_test (
    numbers integer
 );

INSERT INTO percentile_test (numbers) 
VALUES
    (1), (2), (3), (4), (5), (6);

SELECT percentile_cont(.5)
    WITHIN GROUP (ORDER BY numbers),percentile_disc(.5)
    WITHIN GROUP (ORDER BY numbers)
 FROM percentile_test;