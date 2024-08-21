-- 7.11

--Automatic Index Creation: 
-- When you add a primary key or UNIQUE constraint to a table,
-- PostgreSQL automatically creates an index on the specified columns.

--Index Storage: 
--Indexes are stored separately from table data but are accessed 
--automatically during queries and updated whenever rows are added or removed.

--B-Tree Index: 
--The default index type in PostgreSQL,
--useful for data that can be ordered and searched with equality and range operators. 
-- It organizes data in a hierarchical tree structure to efficiently locate values.

--Other Index Types: 
--PostgreSQL also offers GIN and GiST indexes for specialized queries, 
--such as full-text search and geometry types.

--Practical Example: 
-- A B-Tree index can speed up search queries,
--demonstrated with a large dataset of over 900,000 New York City street addresses.


 CREATE TABLE new_york_addresses (
    longitude numeric(9,6), 
    latitude numeric(9,6), 
    street_number varchar(10), 
    street varchar(32), 
    unit varchar(7), 
    postcode varchar(5), 
    id integer CONSTRAINT new_york_key PRIMARY KEY
 );

COPY new_york_addresses
FROM 'C:\BootCamp\SQL Source Code\practical-sql-main\practical-sql-main\Chapter_07\city_of_new_york.csv'
WITH (FORMAT CSV, HEADER);


--Loading Data:
--After loading the data, run a SELECT query to confirm that 
--there are 940,374 rows and seven columns.
--Use Case:

--A common task might be searching for matches in the street column,
--which will be used to explore index performance.

--Benchmarking with EXPLAIN:

--To measure the impact of an index on query speed, use PostgreSQL’s EXPLAIN command.
--EXPLAIN provides the query plan, including whether indexes will be used.

--Adding the ANALYZE keyword to EXPLAIN 
--allows it to execute the query and display actual execution times.





