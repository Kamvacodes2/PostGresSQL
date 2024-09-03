-- Dating Database

CREATE TABLE my_contacts (
	contactID bigserial PRIMARY KEY,
	firstName varchar(50),
	lastName varchar(50),
	profession varchar(50) UNIQUE,
	status varchar(50),
	seeking varchar(50),
	zip_code int references zip_codes(zip_code)
);

-- interest table

CREATE TABLE interests (
	interestID bigserial PRIMARY KEY,
	interest varchar(50)
);

--- zip_codes table

CREATE TABLE zip_codes (
	zip_code int PRIMARY KEY CHECK (zip_code < 10000),
	province varchar(50),
	city1 varchar(50),
	city2 varchar (50)
);

-- contact interest table

CREATE TABLE contact_interests (
	contactID int references my_contacts(contactID),
	interestID int references interests(interestID),
	PRIMARY KEY (contactID, interestID)
);


---- INSERTING VALUES INTO TABLE



---ZIP CODE TABLE

INSERT INTO zip_codes (zip_code, province, city1, city2) VALUES 
(1000, 'Gauteng', 'Johannesburg', 'Pretoria'),
(2000, 'Western Cape', 'Cape Town', 'Stellenbosch'),
(3000, 'KwaZulu-Natal', 'Durban', 'Pietermaritzburg'),
(4000, 'Eastern Cape', 'Port Elizabeth', 'East London'),
(5000, 'Free State', 'Bloemfontein', 'Welkom'),
(6000, 'Limpopo', 'Polokwane', 'Thohoyandou'),
(7000, 'Mpumalanga', 'Nelspruit', 'Witbank'),
(8000, 'North West', 'Mahikeng', 'Rustenburg'),
(9000, 'Northern Cape', 'Kimberley', 'Upington');

INSERT INTO my_contacts (firstName, lastName, profession, status, seeking, zip_code)
VALUES
    ('Kamva', 'Soga', 'Software Engineer', 'Single', 'Friendship', 2000),
    ('Eben', 'Janse van Rensburg', 'Data Analyst', 'In a relationship', 'Networking', 8000),
    ('Michael', 'Johnson', 'Project Manager', 'Single', 'Friendship', 9000),
    ('Emily', 'Brown', 'Graphic Designer', 'Married', 'Business Partnership', 6000),
    ('David', 'Williams', 'HR Specialist', 'Divorced', 'Friendship', 9000),
    ('Sarah', 'Jones', 'Digital Marketer', 'Single', 'Dating', 2000),
    ('Robert', 'Davis', 'Finance Manager', 'In a relationship', 'Business Partnership', 2000),
    ('Lihle', 'Wilson', 'Accountant', 'Single', 'Networking', 6000),
    ('James', 'Moore', 'Content Writer', 'Married', 'Friendship', 3000),
    ('Patricia', 'Ndlozi', 'Sales Executive', 'Divorced', 'Business Partnership', 4000),
    ('Charles', 'Anderson', 'Product Manager', 'Single', 'Networking', 5000),
    ('Linda', 'Thomas', 'UX Designer', 'In a relationship', 'Friendship', 7000),
    ('Dricus', 'Harris', 'Software Tester', 'Married', 'Business Partnership', 3000),
    ('Elizabeth', 'Martin', 'DevOps Engineer', 'Single', 'Networking', 7000),
    ('Christopher', 'Mandela', 'IT Consultant', 'Divorced', 'Friendship', 1000),
    ('Sophia', 'Nyakezi', 'Marketing Specialist', 'Single', 'Dating', 1000);

SELECT * FROM my_contacts;

-- insert values into interest table

INSERT INTO interests (interest) VALUES 
('Hiking'),
('Cooking'),
('Reading'),
('Traveling'),
('Photography'),
('Fitness'),
('Gardening'),
('Gaming'),
('Music'),
('Art'),
('Movies'),
('Dancing'),
('Yoga'),
('Cycling'),
('Volunteering'),
('Writing'),
('Crafting'),
('Swimming'),
('Technology'),
('Fashion'),
('Sports'),
('Meditation');

SELECT * FROM interests;

--- contacts table assigning interests
INSERT INTO contact_interests (contactID, interestID) VALUES
(1, 1), (1, 2), (1, 3),  -- Kamva Soga
(2, 4), (2, 5), (2, 6),  -- Eben Janse van Rensburg
(3, 7), (3, 8), (3, 9),  -- Michael Johnson
(4, 10), (4, 11), (4, 12),  -- Emily Brown
(5, 13), (5, 14), (5, 15),  -- David Williams
(6, 16), (6, 17), (6, 18),  -- Sarah Jones
(7, 19), (7, 20), (7, 21),  -- Robert Davis
(8, 22), (8, 1), (8, 2),  -- Lihle Wilson
(9, 3), (9, 4), (9, 5),  -- James Moore
(10, 6), (10, 7), (10, 8),  -- Patricia Ndlozi
(11, 9), (11, 10), (11, 11),  -- Charles Anderson
(12, 12), (12, 13), (12, 14),  -- Linda Thomas
(13, 15), (13, 16), (13, 17),  -- Dricus Harris
(14, 18), (14, 19), (14, 20),  -- Elizabeth Martin
(15, 21), (15, 22), (15, 1),  -- Christopher Mandela
(16, 2), (16, 3), (16, 4);  -- Sophia Nyakezi

SELECT * FROM contact_interests;

