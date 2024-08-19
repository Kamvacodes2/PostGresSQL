-- Controlling column values with constraints

-- CHECK Evaluates whether the data falls within values we specify
-- UNIQUE Ensures that values in a column or group of columns are unique in each row in the table
-- NOT NULL Prevents NULL values in a column

-- KEYS

-- Primary Key Constraints:

-- Must have a unique value for each row.
-- Cannot contain missing values.

-- Purpose of Primary Keys:

-- Relate tables to each other.
-- Maintain referential integrity between related tables.

--Natural Keys:

--Utilize existing columns in the table.
--Must obey primary key constraints (unique and non-empty).
--Example: Driver’s license ID, part number, serial number, ISBN.
-- Advantages:
----No need to add an extra column.
----Natural key data has meaning, reducing the need for joins.


--Surrogate Keys:

--Use an artificial column with generated values (e.g., sequential number, UUID).
--Example: 2911d8a8-6dea-4a46-af23-d64175a08237.
--Advantages:
--Independent of the table data, allowing flexibility if data changes.
--Typically consumes less storage than natural keys.

-- Choosing a Key Type:

--Use a natural key if a suitable column exists, like a product code.
--Use a surrogate key when no unique column is available or the table structure is complex.


--Primary Key Syntax:

--Examples of both natural and 
--surrogate keys are demonstrated with constraints like CONSTRAINT key_name PRIMARY KEY.






