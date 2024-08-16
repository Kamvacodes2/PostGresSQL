--  Three types of table relationships

-- Understanding Table Relationships:
-- There are three types of relationships: one-to-one, one-to-many, and many-to-many.

-- One-to-One Relationship:
-- Each row in one table matches exactly one row in another.
-- Example: Joining state census data tables on state name or code, 
-- where each state appears only once in both tables.


-- One-to-Many Relationship:
-- A single row in the first table matches multiple rows in the second.
-- Example: A table of car manufacturers linked to a table of car models; 
-- one manufacturer can have many models.

-- Many-to-Many Relationship:
-- Multiple rows in one table match multiple rows in another.
-- Example: Joining baseball players to field positions; 
-- a player can have multiple positions, and a position can be played by multiple players.


-- 6.10 
--  selecting specific columns in a Join

SELECT school_left.id,
school_left.left_school,
school_right.right_school
FROM school_left LEFT JOIN school_right
ON school_left.id = school_right.id;



