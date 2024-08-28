-- 14-3: Retrieving the well-known text for SRID 4326

SELECT srtext
FROM spatial_ref_sys
WHERE srid = 4326;

--  GEOGCS keyword provides the geographic coordinate system in use.
--  PRIMEM specifies the location of the Prime Meridian

-- PostGIS Installation adds five data types to a database.

-- Key Data Types:
-- 1. geography:
--    - Based on a sphere (round-earth coordinate system).
--    - Accounts for Earth's curvature in calculations.
--    - Provides precise distance calculations for large areas.
--    - Results are expressed in meters.
--    - Limited number of functions available.
--
-- 2. geometry:
--    - Based on a plane (Euclidean coordinate system).
--    - Calculates distances on straight lines, less precise for large areas.
--    - Results are expressed in units of the chosen coordinate system.
--    - More functions available and better performance for smaller areas.

-- Guidance:
-- - Use 'geography' for longitude/latitude data or large areas (e.g., continents, globe).
-- - Use 'geometry' for smaller areas where more functions and better performance are needed.
-- - Types can be converted between each other using CAST.

-- Further Information:
-- - PostGIS documentation provides additional guidance on choosing between data types.
