-- 3.3

SELECT numeric_column * 10000000 AS "Fixed",
real_column * 10000000 AS "Float"
FROM number_data_types WHERE numeric_column = .7;

-- GUIDELINES
--Integers:
-- Use integer for counting items, like the number of books in a library
--Decimals:
-- Use numeric or decimal for prices, like $10.99, to ensure calculations are accurate.
--Big Numbers:
-- Use bigint for very large whole numbers, like the population of a country.
