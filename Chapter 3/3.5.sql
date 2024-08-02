-- 3.5
-- using the interval data type in calculations

SELECT 
timestamp_column, 
interval_column, 
timestamp_column - interval_column AS new_date
 FROM data_time_types;