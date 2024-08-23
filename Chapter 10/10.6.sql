-- creating rankings with sql


--Importance of Rankings: Rankings are widely used in various contexts like box office charts and sports standings.

--Purpose: SQL allows not just ordering but also creating numbered rankings, 
--which can be useful for:

--Tracking changes over time across multiple years of data.
--Including rankings as standalone facts in reports.
--Application: Rankings are valuable tools for deeper data analysis and reporting.

--Ranking with rank() and dense_rank()

-- two key ranking functions: rank() and dense_rank(), both of which are window functions.
-- Window Functions:
-- Perform calculations across sets of rows specified by the OVER clause, 
--unlike aggregate functions which group rows.

--Difference Between rank() and dense_rank():

--rank(): Includes gaps in rank order after a tie.
--dense_rank(): Does not include gaps after a tie.

-- 10.6

 CREATE TABLE widget_companies (
    id bigserial,
    company varchar(30) NOT NULL,
    widget_output integer NOT NULL
 );


 INSERT INTO widget_companies (company, widget_output)
 VALUES
    ('Morse Widgets', 125000),
    ('Springfield Widget Masters', 143000),
    ('Best Widgets', 196000),
    ('Acme Inc.', 133000),
    ('District Widget Inc.', 201000),
    ('Clarke Amalgamated', 620000),
    ('Stavesacre Industries', 244000),
    ('Bowers Widget Emporium', 201000);