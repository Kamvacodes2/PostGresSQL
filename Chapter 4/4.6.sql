-- 4.6

CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

 COPY supervisor_salaries_temp (town, supervisor, salary)
 FROM 'C:\BootCamp\YourDirectory\supervisor_salaries.csv'
 WITH (FORMAT CSV, HEADER);

SELECT * FROM supervisor_salaries_temp;

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

SELECT * FROM supervisor_salaries;


-- drop means that the table is no longer in use

DROP TABLE supervisor_salaries_temp;

