-- 15-19: Creating the grades_update trigger

CREATE TRIGGER grades_update
  AFTER UPDATE
  ON grades
  FOR EACH ROW
  EXECUTE PROCEDURE record_if_grade_changed();

--  15-20: Testing the grades_update trigger

-- Initially, there should be 0 records in the history
SELECT * FROM grades_history;


SELECT * FROM grades;

-- before id 1 grade = F 
-- Update a grade
UPDATE grades
SET grade = 'B'
WHERE student_id = 1 AND course_id = 1;

SELECT * FROM grades;

-- Now check the history
SELECT student_id,
       change_time,
       course,
       old_grade,
       new_grade
FROM grades_history;


