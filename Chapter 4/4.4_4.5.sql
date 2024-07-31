CREATE TABLE supervisor_salaries (
    town varchar(30),
    county varchar(30),
    supervisor varchar(30),
    start_date date,
    salary money,
    benefits money
 );

-- copy data from supervisor salaries

-- because columns do not match we have to delete all the data

DELETE FROM supervisor_salaries;

SELECT FROM supervisor_salaries; -- making sure there is nothing in the supervisor salary table