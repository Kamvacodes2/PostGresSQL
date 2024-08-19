-- 7.1
CREATE TABLE natural_key_example (
	license_id varchar(10) CONSTRAINT license_key PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50)
);

 DROP TABLE natural_key_example;

CREATE TABLE natural_key_example (
	license_id varchar(10),
	first_name varchar(50),
	last_name varchar(50),
	CONSTRAINT license_id PRIMARY KEY (license_id)
);

-- 7.2 having a primary key protects you from ruining the integrity of your data

-- INSERT

INSERT INTO natural_key_example (license_id,first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');


INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES  ('T229901', 'Sam', 'Tracy');

--  because a primary key by definition must be unique for each row, the server rejected the 
-- operation. 