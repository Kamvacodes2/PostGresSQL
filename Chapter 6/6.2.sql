-- 6.2 
--  querying multiple tables using Join

SELECT * FROM employees JOIN departments
ON employees.dept_id = departments.dept_id

--the data lives in two tables, each with a focused set of 
--columns, you can query those tables to pull the relevant data back together.

-- 6.3
-- Join types

--JOIN/INNER JOIN: Returns rows where matching values exist in both tables.
--LEFT JOIN: Returns all rows from the left table and matches from the right. Unmatched right rows show as NULL.
--RIGHT JOIN: Returns all rows from the right table and matches from the left. Unmatched left rows show as NULL.
--FULL OUTER JOIN: Returns all rows from both tables. Matches where possible; unmatched rows show as NULL in the opposite table.
--CROSS JOIN: Returns every possible combination of rows from both tables.


CREATE TABLE school_left (
	id integer CONSTRAINT left_id_key PRIMARY KEY,
	left_school varchar(30)
);

CREATE TABLE school_right (
	id integer CONSTRAINT right_id_key PRIMARY KEY,
	right_school varchar(30)
);

INSERT INTO school_left (id, left_school) 
VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(5, 'Washington Middle School'),
(6, 'Jefferson High School'); 



INSERT INTO school_right (id, right_school)
VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(3, 'Morrison Elementary'),
(4, 'Chase Magnet Academy'),
(6, 'Jefferson High School');


--6.4
-- We use JOIN, or INNER JOIN, when we want to return rows that have a match in 
--the columns we used for the join.

SELECT * FROM school_left JOIN school_right
ON school_left.id = school_right.id;

