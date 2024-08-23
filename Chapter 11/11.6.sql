-- 11.6

-- Setting the Time Zone

SET timezone TO 'US/Pacific';

CREATE TABLE time_zone_test (
    test_date timestamp with time zone
);

INSERT INTO time_zone_test VALUES ('2020-01-01 4:00');

SELECT test_date
FROM time_zone_test;

SET timezone TO 'US/Eastern';

SELECT test_date
FROM time_zone_test;

SELECT test_date AT TIME ZONE 'Asia/Seoul'
FROM time_zone_test;


--  calculations with dates and times

-- We can perform simple arithmetic on datetime and interval types the same 
-- way we can on numbers.

-- using the math operators +, -, *, and /

SELECT '9/30/1929'::date - '9/27/1929'::date;
-- The result indicates that these two dates are exactly three days apart.

SELECT '9/30/1929'::date + '5 years'::interval;
--  code adds five years to the date 9/30/1929 to return a timestamp value of 9/30/1934.





-- Set Time Zone: The time zone is set to US/Pacific, 
-- covering parts of the US, Canada, and Baja California.

--Timestamp with Time Zone: A table is created with a timestamp with time zone data type, 
--and a test row is inserted.

--Handling Timestamps: The inserted timestamp (2020-01-01 4:00) lacks time zone info, 
--which is common when data is location-specific.
--The SELECT statement then returns the timestamp with added time zone data.

