
-- Automatically Deleting Related Records with CASCADE
-- To delete a row in licenses and have that action automatically delete any 
-- related rows in registrations, we can specify that behavior by adding ON 
-- DELETE CASCADE when defining the foreign key constraint.

SELECT * FROM licenses;

 CREATE TABLE registrations (
    registration_id varchar(10),
    registration_date date,
    license_id varchar(10) REFERENCES licenses (license_id) ON DELETE CASCADE,
    CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
 );


