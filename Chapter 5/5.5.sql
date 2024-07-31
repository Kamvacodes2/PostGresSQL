-- adding specific data from different columns

 SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010003 AS "White Alone",
       p0010004 AS "Black Alone",
        p0010003 + p0010004 AS "Total White and Black"
 FROM us_counties_2010;