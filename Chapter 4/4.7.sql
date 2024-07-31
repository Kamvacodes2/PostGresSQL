-- 4.7

-- Exporting Particular Columns

COPY us_counties_2010 (geo_name, internal_point_lat, internal_point_lon)
TO 'C:\BootCamp\YourDirectory\us_counties_latlon_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');