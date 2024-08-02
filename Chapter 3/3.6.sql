-- 3.6
--  transforming values from one type to another with cast

--- numbers can be converted to text however letters can't be converted to numbers

SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM data_time_types;

SELECT numeric_column, CAST(numeric_column as integer),
CAST(numeric_column AS varchar(6))
FROM data_time_types;

SELECT CAST(char_column AS integer) FROM char_data_types;

-- CAST shortcut notation
SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM data_time_types;

-- shorcut

SELECT timestamp_column :: varchar(10)
FROM data_time_types;