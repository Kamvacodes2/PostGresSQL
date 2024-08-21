-- 7.7 

--The CHECK Constraint

--CHECK Constraint Purpose: 
--Ensures data integrity by validating that data 
--meets specified criteria before being accepted into the database. 
--If criteria are not met, an error is returned.

---Use Cases: 

--Prevents nonsensical data, such as birthdates 
--more than 120 years in the 
--past or invalid values like a letter grade "Z" in a school system.

--Implementation: 

--Can be applied as either a column constraint or a table constraint.

--Column Constraint: 
--Declared after the column name and data type 
--in the CREATE TABLE statement using CHECK (logical expression).
--Table Constraint: Declared using CONSTRAINT 
--constraint_name CHECK (logical expression) after all columns are defined.

 CREATE TABLE check_constraint_example (
    user_id bigserial,
    user_role varchar(50),
    salary integer,
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
	CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
	CONSTRAINT check_salary_not_zero CHECK (salary > 0)
 );

--  The UNIQUE Constraint

Table Creation: A table is created with the user_id column set as an auto-incrementing surrogate primary key.

CHECK Constraints:

--First CHECK: 
--Validates that the user_role column contains only 
--predefined values ("Admin" or "Staff") using the SQL IN operator.
	
--Second CHECK: 
--Ensures the salary column has values greater than 0, preventing negative salaries.
	
--Boolean Expression: 
--Both CHECK constraints use Boolean expressions,
--which evaluate to either true or false, determining if the data passes the checks.


-- UNIQUE Constraint: Ensures that a column has unique values in each row.
-- Difference from Primary Key:
-- Unlike a primary key, the UNIQUE constraint allows multiple NULL values in a column, 
-- while a primary key does not permit any NULL values.
	
-- 7.8

 CREATE TABLE unique_constraint_example (
  contact_id bigserial CONSTRAINT contact_id_key PRIMARY KEY,   
  first_name varchar(50),
  last_name varchar(50), 
   email varchar(200),
 CONSTRAINT email_unique UNIQUE (email)   
);

 INSERT INTO unique_constraint_example (first_name, last_name, email)
 VALUES ('Samantha', 'Lee', 'slee@example.org');
 INSERT INTO unique_constraint_example (first_name, last_name, email)
 VALUES ('Betty', 'Diaz', 'bdiaz@example.org');
 INSERT INTO unique_constraint_example (first_name, last_name, email)
 VALUES ('Sasha', 'Lee', 'slee@example.org');

-- ERROR:  duplicate key value violates unique constraint "email_unique"

