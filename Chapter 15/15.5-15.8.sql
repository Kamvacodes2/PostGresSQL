SELECT * FROM employees; -- chapter 6 employee info

-- 15-5: Creating a view on the employees table

CREATE OR REPLACE VIEW employees_tax_dept AS
     SELECT emp_id,
            first_name,
            last_name,
            dept_id
     FROM employees
     WHERE dept_id = 1
     ORDER BY emp_id
     WITH LOCAL CHECK OPTION;

SELECT * FROM employees_tax_dept;

-- selecting only the columns 
-- we want to show from the employees table and using WHERE to filter the results

-- Inserting Rows Using the employees_tax_dept View

-- 15-6: Successful and rejected inserts via the employees_tax_dept view

INSERT INTO employees_tax_dept (first_name, last_name, dept_id)
VALUES ('Suzanne', 'Legere', 1);

INSERT INTO employees_tax_dept (first_name, last_name, dept_id)
VALUES ('Jamil', 'White', 2); -- new row violates check option for view "employees_tax_dept"

SELECT * FROM employees_tax_dept;

SELECT * FROM employees;

-- Data Insertion via Views: When you add data using a view, it is also added to the underlying table.
-- Missing Columns: If the view does not include a column (e.g., salary), that column's value will be NULL
-- Error on Insertion: Attempting to insert a value into a non-referenced column
-- through the view will result in an error because the column doesn't exist in the view.
-- Data Security: This method helps limit access to sensitive data by excluding certain columns from the view.


-- 15-7: Updating a row using the employees_tax_dept view

UPDATE employees_tax_dept
SET last_name = 'Le Gere'
WHERE emp_id = 9;

SELECT * FROM employees_tax_dept;

-- This will fail because the salary column is not in the view
UPDATE employees_tax_dept
SET salary = 100000
WHERE emp_id = 9;

-- ERROR:  column "salary" of relation "employees_tax_dept" does not exist

-- 15-8: Deleting a row via the employees_tax_dept view

DELETE FROM employees_tax_dept
WHERE emp_id = 9;

SELECT * FROM employees_tax_dept;

-- Susan is removed from the view


