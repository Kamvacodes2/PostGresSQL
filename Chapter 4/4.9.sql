-- 4.9
-- exporting query results using LIKE & ILIKE

COPY (
	SELECT geo_name, state_us_abbreviation
	FROM us_counties_2010
	WHERE geo_name ILIKE '%mill%'
)
TO 'C:\BootCamp\YourDirectory\us_counties_mill_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');