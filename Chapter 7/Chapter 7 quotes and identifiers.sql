-- Using Quotes Around Identifiers to Enable Mixed Case

-- use_snake_case: Snake case is clear and consistent, as demonstrated by the example trees_planted.
-- It is widely used in the official PostgreSQL documentation and helps make multiword names
-- more understandable, such as video_on_demand.

-- avoid_cryptic_abbreviations: Choose names that are easy to understand, like arrival_time
-- instead of arv_tm. This approach makes the content of the column clear.

-- use_plural_names_for_tables: Tables should have plural names, like teachers, vehicles, or
-- departments, because they hold multiple rows representing instances of an entity.

-- mind_the_length: The maximum length for identifier names varies by database system—
-- PostgreSQL limits it to 63 characters, Oracle to 30, while the SQL standard allows up to 128.
-- It's better to use shorter names to ensure compatibility across different systems.

-- use_descriptive_names_for_table_copies: When copying tables, append a date (YYYY_MM_DD)
-- to the table name, like tire_sizes_2017_10_20. This practice helps with future management
-- and keeps the tables organized by date.
