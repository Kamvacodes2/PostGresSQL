-- 13-15: Converting text to tsvector data
--  tsvector data type reduces text to a sorted list of lexemes, which are units 
-- of meaning in language

SELECT to_tsvector('I am walking across the sitting room to sit with you.');

-- The to_tsvector() function reduces the number of words by
-- removing unhelpful search terms like "I," "am," and "the."

-- It also removes suffixes, changing words like "walking" to "walk" and "sitting" to "sit."
-- The function orders the words alphabetically.

-- Numbers following each colon indicate the
-- word's position in the original string, taking stop words into account.

-- The word "sit" is recognized in multiple positions, corresponding to both "sitting" and "sit."


-- 13.16 Creating the Search Terms with tsquery

SELECT to_tsquery('walking & sitting');



--13.7  Using the @@ Match Operator for Searching

-- With text and search terms converted to full text search data types,

-- use the double at sign (@@) match operator to check for query matches.

-- The first query uses to_tsquery() to search for the words "walking" and "sitting," 
--combined with the & operator.

-- It returns a Boolean value of true because both "walking" and "sitting" 
-- are present in the text converted by to_tsvector().


SELECT to_tsvector('I am walking across the sitting room') @@ to_tsquery('walking & sitting');

SELECT to_tsvector('I am walking across the sitting room') @@ to_tsquery('walking & running');



