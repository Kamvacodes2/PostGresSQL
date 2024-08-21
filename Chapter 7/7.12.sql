--  Recording Some Control Execution Times

-- 7.12

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'BROADWAY';

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = '52 STREET';

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'ZWICKY AVENUE';

-- 7.13

CREATE INDEX street_idx ON new_york_addresses (street);

-- The section describes how adding an index to a table can change 
-- the method the database uses to search data and improve the speed of queries.

-- creating an index in PostgreSQL is similar to creating constraints. 
-- The command starts with CREATE INDEX, followed by a chosen name for the index, 
-- such as street_idx.

--  The ON keyword is used to specify the target table and column

--The execution times are much, much better, effectively a quarter second 
--faster or more per query.


-- Considerations for INDEXES

--Database Documentation: 
--Check your database manager's documentation for index types and their use cases. 
--For example, PostgreSQL offers several index types, each suited to different data types.


--Table Joins: Consider indexing columns used in table joins, especially foreign keys,
--which aren't indexed by default in PostgreSQL.

--WHERE Clauses: Index columns frequently used in 
--WHERE clauses to improve search performance.

--Performance Testing: 
--Use EXPLAIN ANALYZE to test and optimize performance under different configurations.