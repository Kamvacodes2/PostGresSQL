-- 13.20 Creating a GIN index for text search

CREATE INDEX search_idx ON president_speeches USING gin(search_speech_text);

-- The GIN index contains an entry for each lexeme and its location, 
-- allowing the database to find matches more quickly.


--  Searching Speech Text
--13.21

SELECT president, speech_date
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('Vietnam')
ORDER BY speech_date;

--WHERE clause uses @@ match operator between search_speech_text (type tsvector) 
--and the query term "Vietnam."
-- to_tsquery() transforms "Vietnam" into tsquery data.
-- Returns 10 speeches mentioning Vietnam.


--13.22
--  Showing Search Result Locations

-- see where our search terms appear in text, we can use the ts_headline() function.
-- It displays one or more highlighted search terms surrounded by adjacent words.


SELECT president,
       speech_date,
       ts_headline(speech_text, to_tsquery('Vietnam'),
                   'StartSel = <,
                    StopSel = >,
                    MinWords=5,
                    MaxWords=7,
                    MaxFragments=1')
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('Vietnam');


-- Use ts_headline() with speech_text to highlight search terms
-- Pass to_tsquery() as the second argument to specify the word
-- Optional third argument includes:
--   - StartSel and StopSel for start/end of highlighted word
--   - MinWords, MaxWords for word display limits
--   - MaxFragments to limit fragments shown
-- Highlights "Vietnam" in context, useful for search features


-- Using Multiple Search Terms
-- 13.23


SELECT president,
       speech_date,
       ts_headline(speech_text, to_tsquery('transportation & !roads'),
                   'StartSel = <,
                    StopSel = >,
                    MinWords=5,
                    MaxWords=7,
                    MaxFragments=1')
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('transportation & !roads');

-- Use ts_headline() to highlight search terms found
-- In WHERE clause, use to_tsquery() with "transportation" and "roads"
-- Combine terms with & operator; use ! before "roads" to exclude it
-- Query returns speeches with "transportation" but not "roads"
-- ts_headline highlights both "transportation" and "transport" due to lexeme conversion


