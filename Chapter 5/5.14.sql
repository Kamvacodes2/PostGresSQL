-- 5.14

--  Creating a median() Function

-- Create a function to compute the median of an array

CREATE OR REPLACE FUNCTION _final_median(anyarray)
RETURNS float8 AS
$$
WITH q AS (
  SELECT unnest($1) AS val
),
sorted_q AS (
  SELECT val
  FROM q
  WHERE val IS NOT NULL
  ORDER BY val
),
cnt AS (
  SELECT COUNT(*) AS c
  FROM sorted_q
)
SELECT AVG(val)::float8
FROM (
  SELECT val
  FROM sorted_q
  OFFSET GREATEST((SELECT (c - 1) / 2 FROM cnt), 0)
  FETCH FIRST (SELECT 1 + (1 - c % 2) FROM cnt) ROWS ONLY
) sub;
$$
LANGUAGE SQL IMMUTABLE;

CREATE AGGREGATE median(float8) (
  SFUNC = array_append,
  STYPE = float8[],
  FINALFUNC = _final_median,
  INITCOND = '{}'
);

