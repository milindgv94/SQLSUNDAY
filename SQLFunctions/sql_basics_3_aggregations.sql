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

-- AGGREGATION FUNCTIONS IN SQL INCLUDE -
-- COUNT() - returns the number of items found in a group
-- SUM() - returns the sum of all the values
-- AVG() - returns the average of the values in a group ignoring NULL values
-- MIN() - returns the minimum value in the expression
-- MAX() - returns the maximum value in the expression
-- STDEV() / VAR() - returns the statistical standard deviation/Variance of all values

-- LET US CALCULATE ALL THE AGGREGATIONS AGAINST DISTINCT PRODUCTS AS FOLLOWS

SELECT  ProductID, COUNT(*), SUM(LineTotal), AVG(LineTotal), MIN(LineTotal), MAX(LineTotal), STDEV(LineTotal), VAR(LineTotal)
FROM    SalesLT.SalesOrderDetail
GROUP BY ProductID

-- Except for the Count Function we have to specify a column name of type Numeric to compute aggregations

-- Let us say we are asked to make the aggregations against each customer and Products combinations
-- we can do it by adding the Customer Column in the Select as well as Group by clause as follows

SELECT  Customer,ProductID, COUNT(*), SUM(LineTotal), AVG(LineTotal), MIN(LineTotal), MAX(LineTotal), STDEV(LineTotal), VAR(LineTotal)
FROM    SalesLT.SalesOrderDetail
GROUP BY Customer,ProductID

-- Its is essential to include all non aggregated columns in the SELECT CLAUSE to be included in GROUP BY Clause