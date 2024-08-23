-- 10.8

-- calculating rates for meaningful comparisons

--Create and fill a 2015 FBI crime data table

CREATE TABLE fbi_crime_data_2015 (
    st varchar(20),
    city varchar(50),
    population integer,
    violent_crime integer,
    property_crime integer,
    burglary integer,
    larceny_theft integer,
    motor_vehicle_theft integer,
    CONSTRAINT st_city_key PRIMARY KEY (st, city)
);

COPY fbi_crime_data_2015
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_10\fbi_crime_data_2015.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

SELECT * FROM fbi_crime_data_2015
ORDER BY population DESC;

--  calculate property crimes per 1,000 people in cities with more than 
-- 500,000 people and order them

-- 10.9

SELECT
    city,
    st,
    population,
    property_crime,
    round(
        (property_crime::numeric / population) * 1000, 1
        ) AS pc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (property_crime::numeric / population) DESC;
