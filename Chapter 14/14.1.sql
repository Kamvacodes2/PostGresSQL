-- 14-1: Creating a gis_analysis database

CREATE DATABASE gis_analysis;

-- 14.2 
CREATE EXTENSION postgis;

-- the database has now been updated to include spatial data types 
--and dozens of spatial analysis functions.

-- 14.3
SELECT postgis_full_version(); -- shows PostGIS version with its installed components.

-- Spatial data is built from the smallest unit: a point on a grid.
-- The grid can be two-dimensional (e.g., x- and y-axes, longitude and latitude on a map) 
-- or three-dimensional (e.g., a cube).
-- Spatial data formats, such as GeoJSON, can include attributes along with the point's location on the grid.
-- These attributes provide additional information, like a grocery store's name and hours of operation.
-- Points are the fundamental elements used to describe spatial data in Geographic Information Systems (GIS) 
-- and related formats.


-----------------------------------------------------
-----------------------------------------------------

-- To create complex spatial data, multiple points are connected using lines.
-- The ISO and Open Geospatial Consortium (OGC) have established a simple feature standard 
-- for creating and accessing two- and three-dimensional shapes, known as geometries. PostGIS supports this standard.

-- Common simple features in PostGIS include:

-- Point: A single location in a 2D or 3D plane, often represented by a dot on maps.

-- LineString: A series of two or more points connected by straight lines, 
-- used to represent features like roads or trails.

-- Polygon: A 2D shape with three or more straight sides, used for objects like countries or bodies of water. 

--   Polygons can include interior Polygons (holes).

-- MultiPoint: A collection of Points, used to represent multiple locations (e.g., multiple store locations).

-- MultiLineString: A collection of LineStrings, used for features with noncontinuous segments 
--(e.g., a road with segments).

-- MultiPolygon: A collection of Polygons, used for representing complex areas 
-- like land parcels divided by features (e.g., land divided by a road).

