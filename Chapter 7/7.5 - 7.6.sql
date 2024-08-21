-- 7.5
--  Creating an Auto-Incrementing Surrogate Key

-- Assess Natural Key Suitability: 


-- if a table lacks a natural primary key, reconsider the database structure to avoid data integrity issues.


-- Creating Surrogate Keys:

-- If necessary, create a surrogate key by adding a column with unique values, 
-- like using UUIDs or an auto-incrementing integer.


-- Auto-Incrementing Integer Types:

-- Use one of the serial types—smallserial, 
-- serial, or bigserial—depending on the expected data range and storage needs.

-- Choosing the Right Serial Type:

-- Although serial can handle numbers up to 2,147,483,647, it’s safer to use bigserial, 
--which supports up to 9.2 quintillion, to avoid potential overflow issues.

CREATE TABLE surrogate_key_example (
order_number bigserial,
product_name varchar(50),
order_date date,
CONSTRAINT order_key PRIMARY KEY (order_number) 
);

INSERT INTO surrogate_key_example (product_name, order_date)
VALUES ('Beachball Polish', '2015-03-17'),
       ('Wrinkle De-Atomizer', '2017-05-22'),
       ('Flux Capacitor', '1985-10-26');


SELECT * FROM surrogate_key_example;


--  Foreign Keys
-- 7.6

-- Foreign Key Constraint: 

--Ensures data integrity by linking tables, preventing unrelated or orphaned data.

-- Foreign Key Definition: 
-- A foreign key consists of one or more columns in a table that match the primary key of another table.


-- Enforced Constraint:

-- Values in a foreign key must already exist in 
--the referenced table's primary or unique key, otherwise, they are rejected.

--Purpose: 

-- This constraint maintains relational integrity 
--by ensuring that rows in one table are always related to rows in other tables.

CREATE TABLE licenses (
	license_id varchar(10),
	first_name varchar(50),
	last_name varchar(50),
	CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
	registration_id varchar(10),
	registration_date date,
	license_id varchar(10) REFERENCES licenses (license_id),
	CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);


INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '3/17/2017', 'T229901');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '3/17/2017', 'T000001');



-- Licenses Table: 

--Uses license_id as a natural primary key, representing each driver's unique license.

-- Registrations Table: -- Tracks vehicle registrations. 
--A single license_id can link to multiple vehicle registrations, 
--establishing a many-to-many relationship between drivers and vehicles.

--Foreign Key Relationship: --In the registrations table, 
--the license_id column is designated as a foreign key, 
--referencing the license_id in the licenses table.

--Data Integrity Check: 
--When inserting a row into registrations, 
--the database ensures that the license_id exists 
--in the licenses table. If not, an error is returned, preventing orphaned records.

--Example Execution: 

--Inserting matching license_id values into both tables works correctly, 
--but inserting a non-matching value into registrations causes an error, 
--demonstrating the foreign key constraint in action.
