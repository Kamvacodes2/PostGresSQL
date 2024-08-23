-- 10.6

--Ranking Companies:

--Companies are ranked based on widget_output from highest to lowest, with Clarke Amalgamated at the top.
--Difference in Ranks:

--rank(): Best Widgets is ranked 5th, with a gap in the order (no 4th place) due to a tie.
--dense_rank(): Best Widgets is ranked 4th, as it doesn't allow gaps.
--Recommendation:

--rank() is recommended for more accurate reflection of the total number of companies ahead in output, 
--commonly used in practice.

--  Ranking Within Subgroups with PARTITION BY
-- produce ranks within groups of rows in a table. 

-- A PARTITION BY clause divides table rows according to values in a column we specify.

--10.7
CREATE TABLE store_sales (
    store varchar(30),
    category varchar(30) NOT NULL,
    unit_sales bigint NOT NULL,
    CONSTRAINT store_category_key PRIMARY KEY (store, category)
);


INSERT INTO store_sales (store, category, unit_sales)
VALUES
    ('Broders', 'Cereal', 1104),
    ('Wallace', 'Ice Cream', 1863),
    ('Broders', 'Ice Cream', 2517),
    ('Cramers', 'Ice Cream', 2112),
    ('Broders', 'Beer', 641),
    ('Cramers', 'Cereal', 1003),
    ('Cramers', 'Beer', 640),
    ('Wallace', 'Cereal', 980),
    ('Wallace', 'Beer', 988);

SELECT
    category,
    store,
    unit_sales,
    rank() OVER (PARTITION BY category ORDER BY unit_sales DESC)
FROM store_sales;

-- final SELECT statement creates a result set showing how 
-- each store’s sales ranks within each category

--Category Ranking with PARTITION BY:

--PARTITION BY in the OVER clause groups and orders rows by category in the category column.
--The rank column displays rankings based on unit sales within each category.

--Key Insights:
--Example: Broders tops sales in cereal and ice cream, while Wallace leads in beer sales.

--Application:  identifying top performers in different categories or situations





