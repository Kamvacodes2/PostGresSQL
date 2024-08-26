--  Searching for Adjacent Words

-- Use the distance (<->) operator to find adjacent words
-- Optionally, place a number between <-> to find words separated by that many words

-- 13-24: Find speeches where "defense" follows "military"

SELECT president,
       speech_date,
       ts_headline(speech_text, to_tsquery('military <-> defense'),
                   'StartSel = <,
                    StopSel = >,
                    MinWords=5,
                    MaxWords=7,
                    MaxFragments=1')
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('military <-> defense');


-- The query finds four speeches with adjacent terms "military defenses" or similar lexemes
-- Example matches include both singular and plural forms like "defense" and "defenses"
-- Changing the query to "military <2> defense" would find terms exactly two words apart

-- 13.25 Scoring relevance with ts_rank()

SELECT president,
       speech_date,
       ts_rank(search_speech_text,
               to_tsquery('war & security & threat & enemy')) AS score
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('war & security & threat & enemy')
ORDER BY score DESC
LIMIT 5;

-- Use ts_rank() to rank speeches by relevance to search terms

-- ts_rank() takes the search_speech_text column and to_tsquery() function as arguments, 
-- with output aliased as score

-- WHERE clause filters speeches containing the search terms

-- Results are ordered by score in descending order, returning the top five highest-ranking speeches

-- Rankings are influenced by speech length, as ts_rank() considers the frequency of matching terms

-- 13-26: Normalizing ts_rank() by speech length

SELECT president,
       speech_date,
       ts_rank(search_speech_text,
               to_tsquery('war & security & threat & enemy'), 2)::numeric 
               AS score
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('war & security & threat & enemy')
ORDER BY score DESC
LIMIT 5;

-- Adding the optional code '2' normalizes the ts_rank() score by dividing it
-- by the length of the search_speech_text column.

-- This normalization provides a fair comparison among speeches of varying lengths.

-- After running the code, the rankings should change, reflecting normalized scores.

-- Johnson's 1968 speech now ranks highest, while Truman's 1946 speech drops out of the top five.

-- Normalizing by length offers a more meaningful ranking, 
--but four of the top five speeches remain consistent between rankings.






