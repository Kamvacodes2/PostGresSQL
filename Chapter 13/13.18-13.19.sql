--  Creating a Table for Full Text Search

CREATE TABLE president_speeches (
    sotu_id serial PRIMARY KEY,
    president varchar(100) NOT NULL,
    title varchar(250) NOT NULL,
    speech_date date NOT NULL,
    speech_text text NOT NULL,
    search_speech_text tsvector
);

COPY president_speeches (president, title, speech_date, speech_text)
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_13\sotu-1946-1977.csv'
WITH (FORMAT CSV, DELIMITER '|', HEADER OFF, QUOTE '@');

SELECT * FROM president_speeches;

--  copy the contents of speech_text to the tsvector column 
-- search_speech_text and transform it to that data type at the same time. 

-- 13.19  Converting speeches to tsvector in the search_speech_text column

UPDATE president_speeches
SET search_speech_text = to_tsvector('english', speech_text);

-- The SET clause populates the search_speech_text column with the output of to_tsvector().

-- The first argument in to_tsvector() specifies the language for parsing lexemes; here,
-- we use the default "english."

-- You can replace "english" with other languages like "spanish," "german," or "french"
-- (some may require additional dictionaries).

-- The second argument is the name of the input column. Run the code to fill this column.

-- Lastly, index the search_speech_text column to speed up searches.
-- For full text search, PostgreSQL recommends
-- using the Generalized Inverted Index (GIN) instead of the default B-Tree index.




