--- CREATE A DEPARTMENT TABLE

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


--- ONE TO MANY RELATIONSHIPS
-- One department can have many employees
-- one role can be assigned to many employees