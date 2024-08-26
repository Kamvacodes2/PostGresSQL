-- 13.11 Viewing selected crime data

SELECT date_1,
       street,
       city,
       crime_type
FROM crime_reports;

-- 13-12 Using Regular Expressions with WHERE

SELECT geo_name
FROM us_counties_2010
WHERE geo_name ~* '(.+lade.+|.+lare.+)'
ORDER BY geo_name;

SELECT geo_name
FROM us_counties_2010
WHERE geo_name ~* '.+ash.+' AND geo_name !~ 'Wash.+'
ORDER BY geo_name;


-- Additional Regular Expression Functions
-- 13.13

SELECT regexp_replace('05/12/2018', '\d{4}', '2017'); 
-- substitute a matched pattern with replacement text.

SELECT regexp_split_to_table('Four,score,and,seven,years,ago', ',');
-- splits delimited text into rows.

SELECT regexp_split_to_array('Phil Mike Tony Steve', ' ');
-- split the string 
--'Four,score,and,seven,years,ago' on commas , resulting in a set of rows 
--that has one word in each row:


-- 13-14: Finding an array length

SELECT array_length(regexp_split_to_array('Phil Mike Tony Steve', ' '), 1);

-- FULL TEXT SEARCH

-- Full-text search operators:
-- & (AND)
-- | (OR)
-- ! (NOT)




