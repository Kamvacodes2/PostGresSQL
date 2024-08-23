-- Creating Datetime Values from timestamp Components

-- combine separate year, month, and day columns into a single datetime
-- value using specific functions:

-- make_date(year, month, day): Creates a date value.
-- make_time(hour, minute, seconds): Creates a time value without time zone.
-- make_timestamptz(year, month, day, hour, minute, second, time zone): 
-- Creates a timestamp with time zone.

-- 11.2
SELECT make_date(2018, 2, 22);
SELECT make_time(18, 4, 30.3); 
SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

--  Retrieving the Current Date and Time

--In SQL, you can record the current date or 
--time during a query using the following functions:

-- current_date: Returns the current date.
-- current_time: Returns the current time with time zone.
-- current_timestamp: Returns the current timestamp with time zone 
-- (now() is a PostgreSQL shorthand).
-- localtime: Returns the current time without time zone.
-- localtimestamp: Returns the current timestamp without time zone.

