-- INSPECTING AND MODIFYING DATA

-- 9.1
CREATE TABLE meat_poultry_egg_inspect (
	est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);


COPY meat_poultry_egg_inspect 
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_09\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

SELECT count(*) FROM meat_poultry_egg_inspect;

--  interviewing the data set
-- 9.2 
SELECT company,
       street,
       city,
       st,
       count(*) AS aess_coddrunt
 FROM meat_poultry_egg_inspect
 GROUP BY company, street, city, st
 HAVING count(*) > 1
 ORDER BY company, street, city, st;
-- returns all duplicate addresses for a company.

--  Checking for Missing Values
-- 9.3

SELECT st,
       count(*) AS st_count
 FROM meat_poultry_egg_inspect
 GROUP BY st
 ORDER BY st;

