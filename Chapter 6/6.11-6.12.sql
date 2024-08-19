-- 6.11
-- simplifying Join syntax with table aliases

SELECT lt.id,
lt.left_school,
rt.right_school
FROM school_left AS lt LEFT JOIN school_right AS rt
ON lt.id = rt.id;

-- Once that’s in place, we can use the aliases instead of the full table names everywhere else 
-- in the code.


-- Joining multiple tables

-- 6.12

CREATE TABLE schools_enrollment (
	id integer,
	enrollment integer
);

CREATE TABLE schools_grade (
	id integer,
	grades varchar(10)
);

INSERT INTO schools_enrollment (id, enrollment)
VALUES
(1, 360),
(2, 1001),
(5, 450),
(6, 927);



INSERT INTO schools_grade (id, grades)
VALUES 
(1, 'K-3'),
(2, '9-12'),
(5, '6-8'),
(6, '9-12');


SELECT lt.id, lt.left_school, en.enrollment, gr.grades
FROM school_left AS lt LEFT JOIN schools_enrollment AS en ON lt.id = en.id
LEFT JOIN schools_grade AS gr ON lt.id = gr.id
