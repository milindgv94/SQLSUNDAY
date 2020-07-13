-- SIMPLE SELECT ALL STATEMENT --
-- '*' in SQL represents ALL COLUMNS, Hence in the below query we are selecting all Columns from Table SalesOrderDetail

SELECT * FROM SalesLT.SalesOrderDetail

-- SELECT SPECIFIC COLUMNS --
-- If we do not use '*' and need to specify columns manually, we can do it by naming them individually

SELECT	SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount, LineTotal
FROM	SalesLT.SalesOrderDetail

-- ALIASING TABLES SELECTED --
-- aliasing refers to give a nickname to a particular database object which makes it easy to call
-- in the below example we have specifed alias 't1' to Table 'SalesLT.SalesOrderDetail'
-- it is a good practise to mention the tablename.columnname when making a select statement
-- hence we have explicitly used t1.columnname to make a selection

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal
FROM	SalesLT.SalesOrderDetail t1

-- SORTING DATA --
-- 'Order by' Clause in SQL is used to sort data based on certain column
-- we can sort the columns either ascending (asc) or descending (desc), if nothing is specified it is sorted in ascending order by default
-- Note that Order by clause can slow down your query results, hence it is not recommended to use this unless its is of atmost importance

SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal
FROM	SalesLT.SalesOrderDetail t1
ORDER BY SalesOrderID desc

-- TABLE JOINS --
-- INNER JOIN --
-- We will understand SQL Joins in more details in upcoming sessions

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

-- RENAMING OUTPUT COLUMN NAMES / COMMENTING --
-- Commenting any line/porting of query results in not executing of that line/portion
-- comments can be made by inserting '--', all text after '--' will be commented and not executed for the given line

SELECT	--t1.SalesOrderID, 
--		t1.SalesOrderDetailID, 
		t2.SalesOrderNumber AS [SO NUMBER],
		t2.PurchaseOrderNumber AS [PO NUMBER],
		t2.CustomerID AS [CUSTOMER CODE],
		t2.ShipToAddressID AS [SHIPPING ADDRESS],
		t2.BillToAddressID AS [BILLING ADDRESS],
		t2.OrderDate AS [ORDER DATE],
		t2.DueDate AS [DUE DATE],
		t2.ShipDate AS [SHIPPED DATE],
		t1.OrderQty AS [QUANTITY], 
		t1.ProductID AS [PRODUCT CODE], 
		t1.UnitPrice AS [UNIT PRICE], 
		t1.UnitPriceDiscount AS [UNIT DISCOUNT], 
		t1.LineTotal AS [LINE TOTAL],
		t2.SubTotal AS [SUBTOTAL],
		t2.TaxAmt AS [TAX AMOUNT],
		t2.Freight AS [FREIGHT AMOUNT],
		t2.TotalDue AS [TOTAL DUE]
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID

-- ADDING CALCULATED COLUMNS --
-- GETDATE() RETURNS THE CURRENT SYSTEM DATE 

SELECT	--t1.SalesOrderID, 
--		t1.SalesOrderDetailID, 
		t2.SalesOrderNumber AS [SO NUMBER],
		t2.PurchaseOrderNumber AS [PO NUMBER],
		t2.CustomerID AS [CUSTOMER CODE],
		t2.ShipToAddressID AS [SHIPPING ADDRESS],
		t2.BillToAddressID AS [BILLING ADDRESS],
		t2.OrderDate AS [ORDER DATE],
		t2.DueDate AS [DUE DATE],
		t2.ShipDate AS [SHIPPED DATE],
		t1.OrderQty AS [QUANTITY], 
		t1.ProductID AS [PRODUCT CODE], 
		t1.UnitPrice AS [UNIT PRICE], 
		t1.UnitPriceDiscount AS [UNIT DISCOUNT], 
		t1.LineTotal AS [LINE TOTAL],
		t2.SubTotal AS [SUBTOTAL],
		t2.TaxAmt AS [TAX AMOUNT],
		t2.Freight AS [FREIGHT AMOUNT],
		t2.TotalDue AS [TOTAL DUE],
		t2.TaxAmt / t2.SubTotal * 100 AS [TAX %], -- CALCULATE TAX PERCENTAGE USING (TAX AMOUNT / ORDER AMOUNT) * 100
		CASE WHEN t2.DueDate < GETDATE() THEN 'DUE' ELSE 'NOT DUE' END AS [DUE/NOT DUE] -- APPLIES AN IF CONDITION ON DUE DATE TO CHECK IF THE ORDER IS DUE OR NOT DUE
FROM	SalesLT.SalesOrderDetail t1
INNER JOIN SalesLT.SalesOrderHeader t2
ON		t1.SalesOrderID = t2.SalesOrderID