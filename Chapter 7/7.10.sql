-- 7.10
-- Modifying Constraints After Table Creation:

--Constraints can be added or removed from existing tables using the ALTER TABLE command.

-- Removing Primary Key, Foreign Key, or UNIQUE Constraints:

--snytax: ALTER TABLE table_name DROP CONSTRAINT constraint_name;

-- Removing a NOT NULL Constraint:
-- Since NOT NULL operates on a column level, use:
-- ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;
-- Adding Constraints:
--Constraints can also be added to existing tables using ALTER TABLE with appropriate

-- 7.10

 ALTER TABLE not_null_example DROP CONSTRAINT student_id_key;
 ALTER TABLE not_null_example ADD CONSTRAINT student_id_key PRIMARY KEY (student_id);
 ALTER TABLE not_null_example ALTER COLUMN first_name DROP NOT NULL;
 ALTER TABLE not_null_example ALTER COLUMN first_name SET NOT NULL;




