-- 14.9 
CREATE TABLE farmers_markets (
    fmid bigint PRIMARY KEY,
    market_name varchar(100) NOT NULL,
    street varchar(180),
    city varchar(60),
    county varchar(25),
    st varchar(20) NOT NULL,
    zip varchar(10),
    longitude numeric(10,7),
    latitude numeric(10,7),
    organic varchar(1) NOT NULL
);

COPY farmers_markets
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_14\farmers_markets.csv'
WITH (FORMAT CSV, HEADER);

--  table includes routine address data and longitude and latitude for most markets.
-- "organic" column indicates if the market offers organic products;
-- a hyphen (-) signifies an unknown value.

SELECT count(*) FROM farmers_markets;

-- Creating and Filling a Geography Column

--14.10
-- Add column
ALTER TABLE farmers_markets ADD COLUMN geog_point geography(POINT,4326);

-- Now fill that column with the lat/long
UPDATE farmers_markets
SET geog_point = ST_SetSRID(
                            ST_MakePoint(longitude,latitude),4326
                           )::geography;


-- Add a GiST index
CREATE INDEX market_pts_idx ON farmers_markets USING GIST (geog_point);

-- View the geography column
SELECT longitude,
       latitude,
       geog_point,
       ST_AsText(geog_point)
FROM farmers_markets
WHERE longitude IS NOT NULL
LIMIT 5;

-- dd an index to the new column to speed up calculations.

SELECT geog_point 
FROM farmers_markets;
