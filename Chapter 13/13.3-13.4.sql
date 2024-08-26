--
--Objective: Extract dates and times from crime reports and combine them into timestamps. 
--Store the first date and time in date_1, and if a second date/time exists, store it in date_2.

--Function Used: regexp_match(string, pattern)

--Returns matches as text in an array.
--Returns NULL if no matches are found.
--Available in PostgreSQL 10 and later.
--Pattern for Matching Dates: \d{1,2}\/\d{1,2}\/\d{2}

--\d{1,2}: Matches one or two digits for the month.
--\/: Escaped forward slash to match the literal /.
--\d{1,2}: Matches one or two digits for the day.
--\/: Another escaped forward slash.
--\d{2}: Matches a two-digit year.
--This regex pattern is designed to match date formats such as MM/DD/YY, 
--accommodating single or double digits for the month and day.


-- 13.3 Using regexp_match() to find the first date

SELECT crime_id,
       regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}')
FROM crime_reports;

-- regexp_match() returns the first match it finds by default


-- Matching the Second Date When Present
-- 13-4: Using the regexp_matches() function with the 'g' flag
SELECT crime_id,
       regexp_matches(original_text, '\d{1,2}\/\d{1,2}\/\d{2}', 'g')
FROM crime_reports;
