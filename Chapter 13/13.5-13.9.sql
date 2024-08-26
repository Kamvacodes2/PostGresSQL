-- 13-5: Using regexp_match() to find the second date
-- Note that the result includes an unwanted hyphen

SELECT crime_id,
       regexp_match(original_text, '-\d{1,2}\/\d{1,2}\/\d{1,2}')
FROM crime_reports;


-- 13-6 Using a capture group to return only the date
-- Eliminates the hyphen

SELECT crime_id,
       regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{1,2})')
FROM crime_reports;


--13.7 Matching case number, date, crime type, and city

SELECT
    regexp_match(original_text, '(?:C0|SO)[0-9]+') AS case_number,
    regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}') AS date_1,
    regexp_match(original_text, '\n(?:\w+ \w+|\w+)\n(.*):') AS crime_type,
    regexp_match(original_text, '(?:Sq.|Plz.|Dr.|Ter.|Rd.)\n(\w+ \w+|\w+)\n')
        AS city
FROM crime_reports;


-- 13.8  Extracting Text from the regexp_match() Result
-- Retrieving a value from within an array

SELECT
    crime_id,
    (regexp_match(original_text, '(?:C0|SO)[0-9]+'))[1]
        AS case_number
FROM crime_reports;

--  insert these values into crime_reports using an UPDATE query.
-- Updating the crime_reports Table with Extracted Data

-- 13.9

UPDATE crime_reports
SET date_1 = 
(
    (regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}'))[1]
        || ' ' ||
    (regexp_match(original_text, '\/\d{2}\n(\d{4})'))[1] 
        ||' US/Eastern'
)::timestamptz;

SELECT crime_id,
       date_1,
       original_text
FROM crime_reports;

-- Objective: Convert extracted date and time into a timestamp with time zone format and store it in the date_1 column.

-- Concatenation Process:
-- Use PostgreSQL's double-pipe (||) operator to concatenate extracted date and time.
-- Combine date, space, time, and time zone (US/Eastern) into a single string.
-- Resulting format: MM/DD/YY HHMM TIMEZONE.

-- Casting to Timestamp:
-- Cast the concatenated string to a timestamp with time zone using the ::timestamptz shorthand.

-- Outcome:
-- Running the UPDATE command updates the date_1 column with the correct timestamps.
-- The SELECT statement in pgAdmin displays the updated date_1 alongside the original_text.



