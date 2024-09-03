-- 14.14 Exploring the Census 2010 Counties Shapefile
-- Checking the geom column's well-known text representation

SELECT ST_AsText(geom)
FROM us_counties_2010_shp
LIMIT 1;


--The result is a MultiPolygon with hundreds of coordinate pairs that 
--outline the boundary of the county.

-- Finding the Largest Counties in Square Miles

SELECT name10,
       statefp10 AS st,
       round(
             ( ST_Area(geom::geography) / 2589988.110336 )::numeric, 2
            )  AS square_miles
FROM us_counties_2010_shp
ORDER BY square_miles DESC
LIMIT 5;

-- list the results in descending order from the largest area to the smallest

-- Finding a County by Longitude and Latitude
-- 14-16: Using ST_Within() to find the county belonging to a pair of coordinates
SELECT name10,
       statefp10
FROM us_counties_2010_shp
WHERE ST_Within('SRID=4269;POINT(-118.3419063 34.0977076)'::geometry, 4269);


--  14-17: Using ST_GeometryType() to determine geometry

SELECT ST_GeometryType(geom)
FROM santafe_linearwater_2016
LIMIT 1;

SELECT ST_GeometryType(geom)
FROM santafe_roads_2016
LIMIT 1;



-- 14.18 Joining the Census Roads and Water Table

SELECT water.fullname AS waterway,
       roads.rttyp,
       roads.fullname AS road
FROM santafe_linearwater_2016 water JOIN santafe_roads_2016 roads
    ON ST_Intersects(water.geom, roads.geom)
WHERE water.fullname = 'Santa Fe Riv'
ORDER BY roads.fullname;

-- Finding the Location Where Objects Intersect
-- use the ST_Intersection() function

SELECT water.fullname AS waterway,
       roads.rttyp,
       roads.fullname AS road,
       ST_AsText(ST_Intersection(water.geom, roads.geom))
FROM santafe_linearwater_2016 water JOIN santafe_roads_2016 roads
    ON ST_Intersects(water.geom, roads.geom)
WHERE water.fullname = 'Santa Fe Riv'
ORDER BY roads.fullname
LIMIT 5;


