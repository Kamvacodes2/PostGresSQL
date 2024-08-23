--  workinG with Dates anD times

-- data types and Functions for dates and times

--Date: Stores dates (e.g., 2018-09-21). Use ISO format (YYYY-MM-DD) for consistency.

--Time: Stores time (e.g., 14:24 PST). ISO format is HH:MM:SS, with optional time zone.

--Timestamp: Stores both date and time (e.g., 2018-09-21 14:24:00 PST).
--Use timestamp with time zone or timestamptz for time zone info.

--Interval: Represents durations (e.g., 12 days, 8 hours).

--Date, time, and timestamp are datetime types, while interval tracks durations. 
--They handle calendar details like leap years.

--  manipulating dates and times:
-- can use SQL functions to perform calculations on dates and times or 
-- extract components from them

-- Extracting the Components of a timestamp Value
SELECT 
    date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
    date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
    date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
    date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
    date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
    date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
    date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
    date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
    date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
    date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

-- query extracts components (e.g., year, month) from a timestamp (2019-12-01 18:37:12 EST)
--	cast as timestamptz using PostgreSQL’s double-colon syntax. 
--	It includes the EST time zone, and the output reflects the local time zone.

