-- 10.1

 CREATE TABLE acs_2011_2015_stats (
 geoid varchar(14) CONSTRAINT geoid_key PRIMARY KEY,
    county varchar(50) NOT NULL,
    st varchar(20) NOT NULL,
 pct_travel_60_min numeric(5,3) NOT NULL,
    pct_bachelors_higher numeric(5,3) NOT NULL,
    pct_masters_higher numeric(5,3) NOT NULL,
    median_hh_income integer,
 CHECK (pct_masters_higher <= pct_bachelors_higher)
 );

 COPY acs_2011_2015_stats
 FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_10\acs_2011_2015_stats.csv'
 WITH (FORMAT CSV, HEADER, DELIMITER ',');

SELECT * FROM acs_2011_2015_stats;


-- 10.2 Measuring correlation with corr(Y, X)

 SELECT corr(median_hh_income, pct_bachelors_higher) 
 AS bachelors_income_r
 FROM acs_2011_2015_stats;


-- 10.3  Checking Additional Correlations

 SELECT
  round(
      corr(median_hh_income, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_income_r,
    round(
      corr(pct_travel_60_min, median_hh_income)::numeric, 2
      ) AS income_travel_r,
    round(
      corr(pct_travel_60_min, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_travel_r
 FROM acs_2011_2015_stats;

-- 10.4

SELECT
    round(
        regr_slope(median_hh_income, pct_bachelors_higher)::numeric, 2
        ) AS slope,
    round(
        regr_intercept(median_hh_income, pct_bachelors_higher)::numeric, 2
        ) AS y_intercept
 FROM acs_2011_2015_stats;



-- 10.5 Finding the Effect of an Independent Variable with r-squared

 SELECT round(
        regr_r2(median_hh_income, pct_bachelors_higher)::numeric, 3
        ) AS r_squared 
FROM acs_2011_2015_stats;



--R-squared value (0.465): Indicates that about 47% of the variation in median household income in a county can be explained by the percentage of people with a bachelor’s degree or higher.

--Remaining 53% of variation: Could be explained by numerous other factors, 
--which statisticians often test to determine.

--Key points to consider:

--Correlation vs. Causality: Correlation does not prove causality. 
--It's important to perform significance testing to ensure results are not due to randomness.

--Validity of Regression Analysis: Statisticians apply additional tests 
--to confirm that variables meet the criteria for a valid regression result, 
--such as following a bell curve distribution.




