-- Automatically Classifying Temperatures

-- 15-21: Creating a temperature_test table

CREATE TABLE temperature_test (
    station_name varchar(50),
    observation_date date,
    max_temp integer,
    min_temp integer,
    max_temp_group varchar(40),
PRIMARY KEY (station_name, observation_date)
);


--  15-22: Creating the classify_max_temp() function

CREATE OR REPLACE FUNCTION classify_max_temp()
    RETURNS trigger AS
$$
BEGIN
    CASE
       WHEN NEW.max_temp >= 90 THEN
           NEW.max_temp_group := 'Hot';
       WHEN NEW.max_temp BETWEEN 70 AND 89 THEN
           NEW.max_temp_group := 'Warm';
       WHEN NEW.max_temp BETWEEN 50 AND 69 THEN
           NEW.max_temp_group := 'Pleasant';
       WHEN NEW.max_temp BETWEEN 33 AND 49 THEN
           NEW.max_temp_group :=  'Cold';
       WHEN NEW.max_temp BETWEEN 20 AND 32 THEN
           NEW.max_temp_group :=  'Freezing';
       ELSE NEW.max_temp_group :=  'Inhumane';
    END CASE;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 15-23: Creating the temperature_insert trigger

CREATE TRIGGER temperature_insert
    BEFORE INSERT
    ON temperature_test
    FOR EACH ROW
    EXECUTE PROCEDURE classify_max_temp();

-- 15-24: Inserting rows to test the temperature_update trigger

INSERT INTO temperature_test (station_name, observation_date, max_temp, min_temp)
VALUES
    ('North Station', '1/19/2019', 10, -3),
    ('North Station', '3/20/2019', 28, 19),
    ('North Station', '5/2/2019', 65, 42),
    ('North Station', '8/9/2019', 93, 74);

SELECT * FROM temperature_test;

