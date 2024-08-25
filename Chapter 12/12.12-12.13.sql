-- 12.12

-- Tabulating City Temperature Readings

-- create another crosstab, but this time we’ll use real data.

CREATE TABLE temperature_readings (
    reading_id bigserial PRIMARY KEY,
    station_name varchar(50),
    observation_date date,
    max_temp integer,
    min_temp integer
);


COPY temperature_readings 
     (station_name, observation_date, max_temp, min_temp)
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_12\temperature_readings.csv'
WITH (FORMAT CSV, HEADER);


-- 12.13

SELECT *
FROM crosstab('SELECT
                  station_name,
                  date_part(''month'', observation_date),
                  percentile_cont(.5)
                      WITHIN GROUP (ORDER BY max_temp)
               FROM temperature_readings
               GROUP BY station_name,
                        date_part(''month'', observation_date)
               ORDER BY station_name',

              'SELECT month
               FROM generate_series(1,12) month')

AS (station varchar(50),
    jan numeric(3,0),
    feb numeric(3,0),
    mar numeric(3,0),
    apr numeric(3,0),
    may numeric(3,0),
    jun numeric(3,0),
    jul numeric(3,0),
    aug numeric(3,0),
    sep numeric(3,0),
    oct numeric(3,0),
    nov numeric(3,0),
    dec numeric(3,0)
);


--The crosstab structure in this query organizes data into a table that displays 
--the median maximum temperature for each month across various weather stations.

--Subquery 1:

--Purpose: Generates data for the crosstab by calculating the 
--median maximum temperature for each month at each station.

--Columns:
--Row Names: station_name

--Column Names: Months extracted using date_part()

--Values: Median of max_temp using percentile_cont(.5), 
--grouped by station name and month.

--Subquery 2:

--Purpose: Creates a list of months (1 to 12) using generate_series(), 
--which serves as the crosstab columns.

--Output: The resulting crosstab shows the median maximum temperature
--for each month at each station. 
--For example, Waikiki has consistently high temperatures, 
--while Chicago's temperatures vary significantly throughout the year. 
--This compact table format makes it easier to 
--compare temperatures across locations than a vertical list.

--Consideration: While crosstabs offer clear comparisons, 
--they are CPU-intensive and should be used cautiously with large datasets.

