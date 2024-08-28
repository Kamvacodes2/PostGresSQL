-- Commonly Used String Functions

-- Case Formatting:
-- Converts text to uppercase
SELECT upper('example text');
-- Converts text to lowercase
SELECT lower('EXAMPLE TEXT');
-- Capitalizes the first letter of each word; imperfect for acronyms
SELECT initcap('example text for initcap');

-- Character Information:
-- Returns the number of characters in a string
SELECT char_length('example text');
-- Same as char_length(), often used interchangeably
SELECT length('example text');
-- Finds the location of a substring within a string
SELECT position('substring' IN 'example substring text');

-- Removing Characters:
-- Remove characters from both ends of a string
SELECT trim('x' FROM 'xxxexamplexxx');
-- Remove characters from the start of a string
SELECT ltrim('x' FROM 'xxxexample');
-- Remove characters from the end of a string
SELECT rtrim('x' FROM 'examplexxx');

-- Extracting and Replacing Characters:
-- Extract substrings from the beginning of a string
SELECT left('example text', 7);
-- Extract substrings from the end of a string
SELECT right('example text', 4);
-- Replaces occurrences of a substring with another substring
SELECT replace('example text', 'text', 'string');

-- Regular Expression Matching Examples

-- Basic Patterns:
-- Extract substrings using regular expressions
SELECT substring('example 123 text' FROM '\d+');  -- Extracts '123'

-- Turning Text to Data with Regular Expression Functions

-- Creating and Loading Tables:
-- Defines a table structure
CREATE TABLE example_table (
    id serial PRIMARY KEY,
    text_column text
);

-- Loads data into the table from a CSV file
COPY example_table (text_column)
FROM '/path/to/your/file.csv'
WITH (FORMAT CSV, HEADER);

-- Using regexp_match():
-- Finds specific patterns like dates or case numbers within text
SELECT regexp_match('example text with date 01/01/2020'::text, '\d{2}/\d{2}/\d{4}');

-- Using regexp_matches():
-- Finds all matches of a pattern within a text, using the 'g' flag for global matches
SELECT regexp_matches('example text with dates 01/01/2020 and 02/02/2021'::text, '\d{2}/\d{2}/\d{4}', 'g');

-- Extracting Specific Elements:
-- Examples show how to capture dates, case numbers, and other data points from text using regular expressions

-- Updating Columns:
-- Modify table data based on regular expressions
UPDATE example_table
SET text_column = regexp_replace(text_column, 'old', 'new', 'g');

-- Full Text Search

-- Full-Text Search Operators:
-- AND, OR, NOT operators for full-text searches
-- Example search with AND operator
SELECT * FROM example_table WHERE to_tsvector('example text') @@ to_tsquery('example & text');

-- Converting Text and Search Terms:
-- Converts text to a tsvector type for full-text search
SELECT to_tsvector('example text for full-text search');
-- Converts search terms to a tsquery type
SELECT to_tsquery('example & text');

-- Querying and Ranking:
-- Checks if a tsvector matches a tsquery
SELECT * FROM example_table WHERE to_tsvector(text_column) @@ to_tsquery('example');
-- Highlights search terms in the text
SELECT ts_headline(text_column, to_tsquery('example'));
-- Ranks search results by relevance
SELECT ts_rank(to_tsvector(text_column), to_tsquery('example')) AS rank FROM example_table;

-- Indexing and Searching:
-- Creates an index to improve search performance
CREATE INDEX example_idx ON example_table USING gin(to_tsvector('english', text_column));
-- Displays search results with highlighted terms
SELECT ts_headline(text_column, to_tsquery('example')) FROM example_table;
-- Provides ranked search results based on term frequency
SELECT text_column, ts_rank(to_tsvector(text_column), to_tsquery('example')) AS rank FROM example_table;
