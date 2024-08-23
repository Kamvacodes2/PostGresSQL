-- 11.3

 CREATE TABLE current_time_example (
    time_id bigserial,
 current_timestamp_col timestamp with time zone,
 clock_timestamp_col timestamp with time zone
 );

 INSERT INTO current_time_example (current_timestamp_col, clock_timestamp_col)
  (SELECT current_timestamp,
            clock_timestamp()
     FROM generate_series(1,1000));


 SELECT * FROM current_time_example;


--When inserting 1,000 rows into a table, you can compare how current_timestamp and clock_timestamp()
--functions behave.

--The current_timestamp function records the time at the start of the INSERT statement, 
--so the time in the current_timestamp_col will be the same for all rows.

--The clock_timestamp() function records the exact time each row is inserted, 
--so the time in the clock_timestamp_col will increase with each row.

--Using generate_series(), which returns a set of integers from 1 to 1,000, 
--you can insert multiple rows and observe these differences.


-- working with time zones

--Time Zone Importance: Time zones make timestamps meaningful by indicating their global location and UTC offset.
--Missing Data: If a dataset lacks time zone info but events occurred in one location, 
--you can adjust timestamps accordingly.
--Application: The passage highlights strategies for managing time zone data in databases.


-- Finding Your Time Zone Setting
-- To find out the default time zone of your PostgreSQL server

-- 11.4
 SHOW timezone;


--  You can also use the two commands
-- 11.5
 SELECT * FROM pg_timezone_abbrevs;
 SELECT * FROM pg_timezone_names;


--  You can easily filter either of these SELECT statements with a WHERE clause 

 SELECT * FROM pg_timezone_names
 WHERE name LIKE 'Europe%';




