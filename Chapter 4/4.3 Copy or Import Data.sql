-- 4.3 COPY DATA INTO A TABLE

COPY us_counties_2010
FROM 'C:\BootCamp\YourDirectory\us_counties_2010.csv'
WITH (FORMAT CSV, HEADER);

-- columns and rows should match or else it will result in an extra data error
SELECT * FROM us_counties_2010;