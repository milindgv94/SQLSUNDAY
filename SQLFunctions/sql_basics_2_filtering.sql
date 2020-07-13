-- FILTERING DATA --
-- ALL SQL FILTERS CAN BE DONE WITH 'WHERE' CLAUSE FOLLOWED BY COMPARISON OPERATOR

-- FILTERING DATA BASED ON CATEGORY --
-- here we are filtering data based on SalesOrderDetailID and selecting only whose rows where Sales Order = 110562

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t1.SalesOrderDetailID = '110562'

-- UNDERSTANDING SQL OPERATORS -- 
-- '=' EQUAL TO
-- '>' GREATER THAN
-- '<' LESS THAN
-- '<>', '!=' NOT EQUAL TO
-- 'LIKE' SELECT BASED ON PATTERN
-- 'IN' SELECT BASED ON DEFINED ARRAY OF RECORDS
-- 'BETWEEN' SELECT RECORDS BETWEEN RANGE OF DATES OR NUMBERS, THIS OPERATOR WORKS FOR NUMERICAL AND DATE TYPES

-- UNDERSTANDING LIKE OPERATOR --
-- LIKE OPERATORS ARE VERY POWERFUL TO FILTER ROWS BASED ON A PATTERN
-- LET US ASSUME IN THE ABOVE DATA WE WANT FILTER DATA WHERE PRODUCT ID STARTS WITH '86' THEN WE CAN DO THIS BY

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t1.ProductID LIKE '86%'

-- % here represent to make a wild card search in a where that to get all records which starts from 86 and after can be any character

-- LET US ASSUME IN THE ABOVE DATA WE WANT FILTER DATA WHERE PRODUCT ID CONTAINS '6' AT ANY POSITION THEN WE CAN DO THIS BY

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t1.ProductID LIKE '%6%'

-- LIKE WISE ASSUME IN THE ABOVE DATA WE WANT FILTER DATA WHERE PRODUCT ID ENDS WITH '6' THEN WE CAN DO THIS BY

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t1.ProductID LIKE '%6'

-- UNDERSTANDING 'IN' OPERATOR --

-- LET US SAY WE ARE GIVEN A SET OF PRODUCT IDS AND ASKED TO GET DATA RELATED TO THOSE PRODUCT IDS
-- EG. WE HAVE PRODUCT ID 717, 779, 860, 913 AND 993
-- WE CAN FILTER SUCH REQUESTS USING THE 'IN' OPERATOR AS FOLLOWS

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t1.ProductID IN ('717', '779', '860', '913', '993')

-- CAN WE USE MULTIPLE CONDITIONS? YES, SQL SUPPORTS MULTIPLE CONDITIONS WE CAN TAKE HELP OF 'AND' / 'OR' OPERATORS TO DO SO
-- eg. IF WE WANT TO GET DATA WHERE ORDER DATE IS BETWEEN 1ST JUNE 2008 AND 30TH JUNE 2008 ALSO, WE NEED TO ADD ANOTHER CONDITION TO CHECK IF THE ORDER AMOUNT IS GREATER THAN 25000

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal,
		t2.OrderDate,
		t2.DueDate,
		t2.ShipDate,
		t2.SalesOrderNumber,
		t2.PurchaseOrderNumber,
		t2.CustomerID,
		t2.ShipToAddressID,
		t2.BillToAddressID,
		t2.SubTotal,
		t2.TaxAmt,
		t2.Freight,
		t2.TotalDue
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID
WHERE   t2.OrderDate BETWEEN '2008-06-01' AND '2008-06-30'
AND     t2.TotalDue > 25000

-- NOTE THAT SQL DATE FUNCTION FORMAT IS IN YYYY-MM-DD FORMAT UNLESS OTHERWISE EXPLICITLY SPECIFIED