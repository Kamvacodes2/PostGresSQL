--  Calculating the Duration of Train Trips

SELECT segment,
       to_char(departure, 'YYYY-MM-DD HH12:MI a.m. TZ') AS departure,
       arrival - departure AS segment_time
FROM train_rides;

--Lists trip segment, departure time, and journey duration.
--Uses to_char() function to format the departure timestamp.

--Format: YYYY-MM-DD HH12:MI a.m. TZ.
--YYYY-MM-DD: Date in ISO format.

--HH12:MI: Time in 12-hour clock format.
--a.m.: Lowercase AM/PM notation.
--TZ: Time zone.

-- we subtract departure from arrival to determine the segment_time

--  Calculating Cumulative Trip Time
-- 11.13

SELECT segment,
       arrival - departure AS segment_time,
       sum(arrival - departure) OVER (ORDER BY trip_id) AS cume_time
 FROM train_rides;


-- 11.14

SELECT segment,
       arrival - departure AS segment_time,
       sum(date_part('epoch', (arrival - departure)))
           OVER (ORDER BY trip_id) * interval '1 second' AS cume_time
FROM train_rides;

--Epoch Definition: Epoch is the number of seconds since January 1, 1970,
--useful for calculating duration.

--Using date_part(): Extracts the number of seconds 
--between arrival and departure intervals using the epoch setting.

--Converting Seconds: Multiplies the sum by an interval of 1 second to
--convert the seconds into a clearer interval value.

-- The final cume_time, in HH:MM
-- format, totals 133 hours and 47 minutes, representing the total trip length.






