-- Using CASE to Handle Special Instances
--13.10 updating all crime_reports columns

UPDATE crime_reports
SET date_1 = 
    (
      (regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}'))[1]
          || ' ' ||
      (regexp_match(original_text, '\/\d{2}\n(\d{4})'))[1] 
          ||' US/Eastern'
    )::timestamptz,
             
    date_2 = 
    CASE 
    -- if there is no second date but there is a second hour
        WHEN (SELECT regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{1,2})') IS NULL)
                     AND (SELECT regexp_match(original_text, '\/\d{2}\n\d{4}-(\d{4})') IS NOT NULL)
        THEN 
          ((regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}'))[1]
              || ' ' ||
          (regexp_match(original_text, '\/\d{2}\n\d{4}-(\d{4})'))[1] 
              ||' US/Eastern'
          )::timestamptz 

    -- if there is both a second date and second hour
        WHEN (SELECT regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{1,2})') IS NOT NULL)
              AND (SELECT regexp_match(original_text, '\/\d{2}\n\d{4}-(\d{4})') IS NOT NULL)
        THEN 
          ((regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{1,2})'))[1]
              || ' ' ||
          (regexp_match(original_text, '\/\d{2}\n\d{4}-(\d{4})'))[1] 
              ||' US/Eastern'
          )::timestamptz 
    -- if neither of those conditions exist, provide a NULL
        ELSE NULL 
    END,
    street = (regexp_match(original_text, 'hrs.\n(\d+ .+(?:Sq.|Plz.|Dr.|Ter.|Rd.))'))[1],
    city = (regexp_match(original_text,
                           '(?:Sq.|Plz.|Dr.|Ter.|Rd.)\n(\w+ \w+|\w+)\n'))[1],
    crime_type = (regexp_match(original_text, '\n(?:\w+ \w+|\w+)\n(.*):'))[1],
    description = (regexp_match(original_text, ':\s(.+)(?:C0|SO)'))[1],
    case_number = (regexp_match(original_text, '(?:C0|SO)[0-9]+'))[1];


-- Overview: The UPDATE statement might seem complex, but breaking it down by column simplifies it.

-- Updating `date_1`: The first step uses previously shown code to update the `date_1` column.

-- Updating `date_2`: This step accounts for inconsistencies in the presence of a second date and time, 
--considering three scenarios:
-- 1. A second hour exists without a second date (same date, different times).
-- 2. Both a second date and a second hour exist (spanning multiple dates).
-- 3. Neither a second date nor a second hour exists.

-- Using `CASE` Statement:
-- The `CASE` statement tests each scenario to determine the appropriate value for `date_2`.

-- First `WHEN`: Checks if there is no second date but a second hour exists, 
-- concatenating the first date with the second hour.

-- Second `WHEN`: Checks if both a second date and hour exist, concatenating them for the timestamp.

-- `ELSE`: If neither condition is met, `date_2` is set to NULL.

-- Outcome: Running the full query updates the `date_2` column accurately based on the available data,
-- with PostgreSQL confirming the update with a message like "UPDATE 5".
-- This ensures that all columns in the table reflect the parsed data from `original_text`.

