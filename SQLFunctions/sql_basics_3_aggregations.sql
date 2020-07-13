-- An aggregate function performs a calculation on a set of values, and returns a single value.
-- Except for COUNT(*), aggregate functions ignore null values.

-- COUNT FUNCTION --
-- This Function returns the count of Rows/items found
-- Let us assume we want to make a count of rows present in SalesLT.SalesOrderDetail Table

SELECT  COUNT(*)
FROM    SalesLT.SalesOrderDetail

-- Using GROUP BY Clause with Aggregations --
-- Group by clause in SQL is a powerful function for any analytics user
-- In the above query we founc out how many sales order lines we have created by making a count
-- what if we are asked to make a count based on each product ID. For each product ID we needed the count of number of sales order lines created.
-- We can do this using the Group by clause as follows,

SELECT  ProductID, COUNT(*)
FROM    SalesLT.SalesOrderDetail
GROUP BY ProductID

-- Note That In any SELECT Statement we make selection of rows along with any aggregation function, we are forced to use Group By
-- Note that SELECT Statement will represent distinct values for Columns Selected after the Group by clause  
-- In the above query For every Distinct Product ID count of rows/lines are represented

-- Note we cannot use 'WHERE' Clause along with Group By Clause, Hence all Aggregation functions are made on the entire table
-- However, you can use 'HAVING' Clause to filter the resultant data
-- We will see how we can use aggregation function on a subset of data rather than the entire table in upcoming sessions

