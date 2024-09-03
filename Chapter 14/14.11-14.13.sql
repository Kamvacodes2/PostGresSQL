-- 14-11: Using ST_DWithin() to locate farmers' markets within 10 kilometers of a point

SELECT market_name,
       city,
       st
FROM farmers_markets
WHERE ST_DWithin(geog_point,
                 ST_GeogFromText('POINT(-93.6204386 41.5853202)'),
                 10000)
ORDER BY market_name;

-- Filter farmers_markets to 
--show markets within 10 kilometers of the Downtown Farmers’ Market in Des Moines:

-- `ST_DWithin()` takes `geog_point` (market location) as the first input.
-- The second input is `ST_GeogFromText()` with the coordinates for the Downtown Farmers’ Market in Des Moines.
-- The final input, `10000`, is the distance in meters (10 km).
-- The function returns markets within 10 km of the specified location.
-- `ST_DWithin()` works with any geography or geometry type.
-- Use `ST_DFullyWithin()` for finding objects entirely within a certain distance.
-- The query should return nine rows.


---------------------------
-----------------------------
---------------------------

-- Finding the Distance Between Geographies
-- 14-12: Using ST_Distance() to calculate the miles between Yankee Stadium
-- and Citi Field (Mets)
-- 1609.344 meters/mile

SELECT ST_Distance(
                   ST_GeogFromText('POINT(-73.9283685 40.8296466)'),
                   ST_GeogFromText('POINT(-73.8480153 40.7570917)')
                   ) / 1609.344 AS mets_to_yanks;

--  returns the minimum distance between two spatial objects.


--finding distance between points to the 
-- farmers’ market data

-- 14-13: Using ST_Distance() for each row in farmers_markets

SELECT market_name,
       city,
       round(
           (ST_Distance(geog_point,
                        ST_GeogFromText('POINT(-93.6204386 41.5853202)')
                        ) / 1609.344)::numeric(8,5), 2
            ) AS miles_from_dt
FROM farmers_markets
WHERE ST_DWithin(geog_point,
                 ST_GeogFromText('POINT(-93.6204386 41.5853202)'),
                 10000)
ORDER BY miles_from_dt ASC;

---
-- Connecting to the Database and Loading a Shapefile
-- Shapefiles contain the information describing the shape of a feature 

-- Contents of a Shapefile
-- A shapefile refers to a collection of files with different extensions

-- Common extensions in shapefiles:
-- .shp - Main file that stores the feature geometry.
-- .shx - Index file that stores the index of the feature geometry.
-- .dbf - Database table (in dBASE format) that stores attribute information of features.
-- .xml - XML-format file that stores metadata about the shapefile.
-- .prj - Projection file that stores coordinate system information; 
-- viewable with a text editor.

--- You can load a shapefile into PostGIS to access its spatial 
-- objects and the attributes for each.



