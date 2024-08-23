--  The Busiest Time of Day
-- 11.8

SELECT
    date_part('hour', tpep_pickup_datetime) AS trip_hour,
    count(*)
FROM nyc_yellow_taxi_trips_2016_06_01
GROUP BY trip_hour
ORDER BY trip_hour;


--Extracting Hour: 
--date_part() extracts the hour from tpep_pickup_datetime to group rides by hour.

--Counting Rides: count() aggregates the number of rides for each hour.
--Query Outcome: The query returns 24 rows, one for each hour of the day.

--  Exporting to CSV for Visualization in Excel
-- Exporting taxi pickups per hour to a CSV file
--11.9

COPY
    (SELECT
        date_part('hour', tpep_pickup_datetime) AS trip_hour,
        count(*)
    FROM nyc_yellow_taxi_trips_2016_06_01
    GROUP BY trip_hour
    ORDER BY trip_hour
    )
TO 'C:\BootCamp\SQL\PostGresSQL\Chapter 11\hourly_pickups_2016_06_01.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');


-- When Do Trips Take the Longest?
-- Creating a table to hold train trip data
-- 11.10

SET timezone TO 'US/Central';

CREATE TABLE train_rides (
    trip_id bigserial PRIMARY KEY,
    segment varchar(50) NOT NULL,
    departure timestamp with time zone NOT NULL,
    arrival timestamp with time zone NOT NULL
);

INSERT INTO train_rides (segment, departure, arrival)
VALUES
    ('Chicago to New York', '2017-11-13 21:30 CST', '2017-11-14 18:23 EST'),
    ('New York to New Orleans', '2017-11-15 14:15 EST', '2017-11-16 19:32 CST'),
    ('New Orleans to Los Angeles', '2017-11-17 13:45 CST', '2017-11-18 9:00 PST'),
    ('Los Angeles to San Francisco', '2017-11-19 10:10 PST', '2017-11-19 21:24 PST'),
    ('San Francisco to Denver', '2017-11-20 9:10 PST', '2017-11-21 18:38 MST'),
    ('Denver to Chicago', '2017-11-22 19:10 MST', '2017-11-23 14:50 CST');

SELECT * FROM train_rides;

--Hour Extraction: date_part() extracts the hour from tpep_pickup_datetime.
	
--Median Trip Time: 
--percentile_cont() calculates median trip time by subtracting pickup time from drop-off time.
	
--Result: The 1 pm hour has the highest median trip time of 15 minutes.










