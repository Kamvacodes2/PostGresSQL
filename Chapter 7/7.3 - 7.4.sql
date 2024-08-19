-- Composite Primary Key Summary:

--Purpose:

--Used when a single column cannot meet the primary key requirements for uniqueness.
--Definition:

--A composite primary key is created by combining two or more columns to form a unique key for each row.
--Example:

--In a student attendance table, a 
--composite key could consist of a student ID column 
--and a date column, uniquely identifying each attendance record.

--Implementation:

--Declare the composite primary key using table constraint syntax.

-- 7.3

 CREATE TABLE natural_key_composite_example (
    student_id varchar(10),
    school_day date,
    present boolean,
    CONSTRAINT student_key PRIMARY KEY (student_id, school_day)   
);

-- insert data to view outcome
-- 7.4

 INSERT INTO natural_key_composite_example (student_id, school_day, present)
 VALUES(775, '1/22/2017', 'Y');
 INSERT INTO natural_key_composite_example (student_id, school_day, present)
 VALUES(775, '1/23/2017', 'Y');
 INSERT INTO natural_key_composite_example (student_id, school_day, present)
 VALUES(775, '1/23/2017', 'N'); -- error because of duplicate key value

-- the student_id and school_day values it contains match a combination that already exists in the table: 

SELECT * FROM natural_key_composite_example




