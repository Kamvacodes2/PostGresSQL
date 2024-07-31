-- Integer Data Types

-- smallint , storage-size: 2 bytes , range: 1 to 32767
-- integer, storage-size:  4 bytes, range: 1 to 2147483647
-- bigint , storage-size: 8 bytes, range: 1 to 9223372036854775807

-- 3.2

CREATE TABLE number_data_types (
	numeric_column numeric(20,5),
	real_column real,
	double_column double precision
);

INSERT INTO number_data_types
VALUES
(.7, .7, .7),(2.13579, 2.13579, 2.13579),(2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;