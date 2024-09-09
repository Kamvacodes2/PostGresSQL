--- CREATE A DEPARTMENT TABLE

SELECT version();

CREATE TABLE department(
	departmentID bigserial PRIMARY KEY,
	departmentName varchar(50) NOT NULL
);

--- CREATE ROLE TABLE 
CREATE TABLE roles (
	roleID bigserial PRIMARY KEY,
	roleName varchar(50) NOT NULL
);

--- CREATE AN EMPLOYEE TABLE
CREATE TABLE employees (
	employeeID bigserial PRIMARY KEY,
	firstName varchar(60) NOT NULL,
	lastName varchar(50) NOT NULL,
	hireDate date,
	city varchar(50)NOT NULL,
	province varchar(50)NOT NULL,
	departmentID int references department(departmentID),
	roleID int references roles(roleID),
	baseSalary decimal(10,2) NOT NULL
);

--  CREATE SALARY TABLE
CREATE TABLE salaries (
    salaryID bigserial PRIMARY KEY,
    salaryAmount decimal(10, 2) NOT NULL,
    bonusAmount decimal(10, 2)
);

-- CREATE Overtime table

CREATE TABLE overtime_hours (
    overtimeID bigserial PRIMARY KEY,
    hoursWorked int NOT NULL,
    overtimeRate decimal(5, 2) NOT NULL
);




-----------------------------------
----------------------------------

-- INSERT DATA into TABLES

--department table

INSERT INTO department (departmentName)
VALUES
	('Marketing'), 
	('I.T'), 
	('Finance'), 
	('Human Resources'), 
	('Sales');

SELECT * FROM department;

--- roles table

INSERT INTO roles (roleName)
VALUES 
	('Software Developer'),
	('Project Manager'),
	('Data Analyst'),
	('HR Specialist'),
	('Sales Executive'),
	('Sales Manager'),
	('Finance Manager'),
	('Accountant'),
	('Marketing Manager'),
	('Digital Marketer');

SELECT * FROM roles;


--- employees table

INSERT INTO employees (firstName, lastName, hireDate, city, province, departmentID, roleID, baseSalary)
VALUES
    ('Kamva', 'Soga', '2024-05-15', 'Johannesburg', 'Gauteng', 2, 3, 75000.00),
    ('Caleb', 'Smit', '2019-08-22', 'Pretoria', 'Gauteng', 2, 2, 62000.00),
    ('Michael', 'Johnson', '2021-01-10', 'Cape Town', 'Western Cape', 3, 3, 48000.00),
    ('Rourke', 'Brown', '2018-11-05', 'Durban', 'KwaZulu-Natal', 4, 4, 70000.00),
    ('Desire', 'Williams', '2022-03-12', 'Port Elizabeth', 'Gauteng', 4, 4, 53000.00),
	    ('Jacky', 'Doe', '2020-05-15', 'Johannesburg', 'Gauteng', 1, 1, 55000.00),
    ('Jade', 'Smith', '2019-09-22', 'Pretoria', 'Gauteng', 2, 2, 62000.00),
    ('Philis', 'Johnson', '2022-01-10', 'Cape Town', 'Western Cape', 3, 8, 48000.00),
    ('Precious', 'Bhembhe', '2022-11-05', 'Durban', 'KwaZulu-Natal', 4, 4, 70000.00),
    ('Eben', 'Janse van Rensburg', '2022-03-12', 'Port Elizabeth', 'Eastern Cape', 5, 6, 53000.00),
		    ('John', 'Deere', '2020-05-15', 'Johannesburg', 'Gauteng', 1, 1, 55000.00),
    ('Joey', 'Smith', '2019-09-22', 'Pretoria', 'Gauteng', 3, 7, 62000.00),
    ('Michael', 'Johnson', '2022-01-10', 'Cape Town', 'Western Cape', 2, 2, 48000.00),
    ('Marvelous', 'Bhembhe', '2022-11-05', 'Durban', 'KwaZulu-Natal', 4, 4, 38000.00),
    ('Adrian', 'Janse van Reebuk', '2022-03-12', 'Port Elizabeth', 'Eastern Cape', 5, 6, 45000.00);

SELECT * FROM employees;

-- UPDATE employee table for overtime column and reference

ALTER TABLE employees
ADD COLUMN salaryID int REFERENCES salaries(salaryID),
ADD COLUMN overtimeID int REFERENCES overtime_hours(overtimeID);


-- -- Insert data into the salaries table
INSERT INTO salaries (salaryAmount, bonusAmount)
VALUES
    (75000.00, 5000.00),
    (62000.00, 3000.00),
    (48000.00, 2000.00),
    (70000.00, 4000.00),
    (53000.00, 2500.00);

-- Insert data into the overtime_hours table
INSERT INTO overtime_hours (hoursWorked, overtimeRate)
VALUES
    (15, 150.00),
    (10, 120.00),
    (20, 180.00),
    (25, 200.00),
    (5, 100.00);


--  Insert additional salary data for employees 6 to 14
INSERT INTO salaries (salaryAmount, bonusAmount)
VALUES
    (55000.00, 2500.00), -- salaryID = 6
    (62000.00, 3000.00), -- salaryID = 7
    (48000.00, 2000.00), -- salaryID = 8
    (70000.00, 4000.00), -- salaryID = 9
    (53000.00, 2500.00), -- salaryID = 10
    (55000.00, 2500.00), -- salaryID = 11
    (62000.00, 3000.00), -- salaryID = 12
    (48000.00, 2000.00), -- salaryID = 13
    (45000.00, 1500.00); -- salaryID = 14

-- Now update the employees with salaryID references
UPDATE employees
SET salaryID = CASE 
    WHEN employeeID = 1 THEN 1
    WHEN employeeID = 2 THEN 2
    WHEN employeeID = 3 THEN 3
    WHEN employeeID = 4 THEN 4
    WHEN employeeID = 5 THEN 5
    WHEN employeeID = 6 THEN 6
    WHEN employeeID = 7 THEN 7
    WHEN employeeID = 8 THEN 8
    WHEN employeeID = 9 THEN 9
    WHEN employeeID = 10 THEN 10
    WHEN employeeID = 11 THEN 11
    WHEN employeeID = 12 THEN 12
    WHEN employeeID = 13 THEN 13
    WHEN employeeID = 14 THEN 14
END
WHERE employeeID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);

-- insert additional overtime values
INSERT INTO overtime_hours (hoursWorked, overtimeRate)
VALUES
    (12, 110.00), -- overtimeID = 6
    (8, 100.00),  -- overtimeID = 7
    (18, 170.00), -- overtimeID = 8
    (22, 190.00), -- overtimeID = 9
    (7, 115.00),  -- overtimeID = 10
    (10, 125.00), -- overtimeID = 11
    (6, 105.00),  -- overtimeID = 12
    (20, 180.00), -- overtimeID = 13
    (13, 130.00); -- overtimeID = 14

-- -- Update overtimeID
UPDATE employees
SET overtimeID = CASE 
    WHEN employeeID = 1 THEN 1
    WHEN employeeID = 2 THEN 2
    WHEN employeeID = 3 THEN 3
    WHEN employeeID = 4 THEN 4
    WHEN employeeID = 5 THEN 5
    WHEN employeeID = 6 THEN 6
    WHEN employeeID = 7 THEN 7
    WHEN employeeID = 8 THEN 8
    WHEN employeeID = 9 THEN 9
    WHEN employeeID = 10 THEN 10
    WHEN employeeID = 11 THEN 11
    WHEN employeeID = 12 THEN 12
    WHEN employeeID = 13 THEN 13
    WHEN employeeID = 14 THEN 14
END
WHERE employeeID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);




--- ONE TO MANY RELATIONSHIPS
-- One department can have many employees
-- one role can be assigned to many employees