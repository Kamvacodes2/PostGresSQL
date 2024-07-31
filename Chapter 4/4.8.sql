-- 4.8 exporting all data

COPY us_counties_2010 
TO 'C:\BootCamp\YourDirectory\us_counties_all_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');