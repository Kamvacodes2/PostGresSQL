-- mininG text to finD meaninGful Data

-- you can extract data and even quantify data from text in speeches, reports, press 
-- releases, and other documents.


-- Formatting text using string Functions

-- PostgreSQL offers over 50 built-in string functions for tasks like capitalizing letters, 
-- concatenating strings, and removing spaces.


-- Case Formatting Functions
-- Capitalizes all alphabetical characters of the string.
-- Example: upper('Neal7') returns 'NEAL7'.
-- Function: upper(string);
-- Converts all alphabetical characters to lowercase.
-- Example: lower('Randy') returns 'randy'.
-- Function: lower(string);
-- Capitalizes the first letter of each word in the string.
-- Example: initcap('at the end of the day') returns 'At The End Of The Day'.
-- Note: Does not handle acronyms well (e.g., initcap('Practical SQL') returns 'Practical Sql').
-- Function: initcap(string);

-- Character Information Functions
-- Returns the number of characters in the string, including spaces.
-- Example: char_length(' Pat ') returns 5.
-- Function: char_length(string);
-- Similar to char_length(), but may differ with multibyte encodings.
-- Example: length(' Pat ') returns 5 (same as char_length).
-- Function: length(string);
-- Returns the position of the substring within the main string.
-- Example: position(', ' in 'Tan, Bella') returns 4.
-- Function: position(substring in string);

-- Removing Characters
-- Removes specified characters from the string.
-- Example: trim('s' from 'socks') returns 'ock'.
-- Function: trim(characters from string);
-- Removes specified characters from the beginning of the string.
-- Example: ltrim('socks', 's') returns 'ocks'.
-- Function: ltrim(string, characters);
-- Removes specified characters from the end of the string.
-- Example: rtrim('socks', 's') returns 'sock'.
-- Function: rtrim(string, characters);

-- Extracting and Replacing Characters
-- Extracts a specified number of characters from the left side of the string.
-- Example: left('703-555-1212', 3) returns '703'.
-- Function: left(string, number);
-- Extracts a specified number of characters from the right side of the string.
-- Example: right('703-555-1212', 8) returns '555-1212'.
-- Function: right(string, number);
-- Replaces occurrences of a substring with another substring.
-- Example: replace('bat', 'b', 'c') returns 'cat'.
-- Function: replace(string, from, to);

-- Regular Expressions
-- Used to describe text patterns for matching and extracting data.
-- Write regex patterns to filter or manipulate text data.
-- Example tools for learning and testing regex: [regexr](https://regexr.com/) and [regexpal](http://www.regexpal.com/).
