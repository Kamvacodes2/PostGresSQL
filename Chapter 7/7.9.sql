-- 7.9
--NULL in SQL: NULL represents missing or unknown data in a column.
--Primary Key Restriction: 
--NULL values are not allowed in primary keys because they must uniquely identify each row.

--NOT NULL Constraint: 

--Used to prevent empty values in columns where data is required, 
--ensuring that specific columns, 
--like first and last names in a student table, must always have values.

CREATE TABLE not_null_example (
    student_id bigserial,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    CONSTRAINT student_id_key PRIMARY KEY (student_id)
 );

-- If we attempt an INSERT on the table and 
--don’t include values for those columns, the database will notify us of the violation.

