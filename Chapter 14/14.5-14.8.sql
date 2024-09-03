-- 14-5: Using ST_GeogFromText() to create spatial objects

SELECT
ST_GeogFromText('SRID=4326;MULTIPOINT(-74.9 42.7, -75.1 42.7, -74.924 42.6)');


-- Listing 14-6: Functions specific to making points
-- Point Functions

SELECT ST_PointFromText('POINT(-74.9233606 42.699992)', 4326);

SELECT ST_MakePoint(-74.9233606, 42.699992);
SELECT ST_SetSRID(ST_MakePoint(-74.9233606, 42.699992), 4326);

-- Points mark coordinates, such as longitude and latitude
-- used to identify locations

----------------------------
------------------------------
-------------------------------

-- 14-7: Functions specific to making LineStrings

--  functions we use specifically for creating LineString 
-- geometry data types.

SELECT ST_LineFromText('LINESTRING(-105.90 35.67,-105.91 35.67)', 4326);
SELECT ST_MakeLine(ST_MakePoint(-74.92, 42.69), ST_MakePoint(-74.12, 42.45));


-- The ST_LineFromText(WKT, SRID) function creates a LineString
-- from a WKT LINESTRING and an optional SRID as its second input.
-- Like ST_PointFromText(), this function includes coordinate validation,
-- which can make it slower than ST_GeomFromText().

-- The ST_MakeLine(geom, geom) function creates a LineString from two
-- geometry data type inputs. In the example, two ST_MakePoint() functions
-- are used as inputs to create the start and endpoint of the line.

-- 14.8 Polygon Functions

-- making polygons


SELECT ST_PolygonFromText('POLYGON((-74.9 42.7, -75.1 42.7,
                                    -75.1 42.6, -74.9 42.7))', 4326);

SELECT ST_MakePolygon(
           ST_GeomFromText('LINESTRING(-74.92 42.7, -75.06 42.71,
                                       -75.07 42.64, -74.92 42.7)', 4326));

SELECT ST_MPolyFromText('MULTIPOLYGON((
                                       (-74.92 42.7, -75.06 42.71,
                                        -75.07 42.64, -74.92 42.7),
                                       (-75.0 42.66, -75.0 42.64,
                                        -74.98 42.64, -74.98 42.66,
                                        -75.0 42.66)
                                      ))', 4326);