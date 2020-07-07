-- SIMPLE SELECT ALL STATEMENT --
SELECT * FROM SalesLT.SalesOrderDetail

-- SELECT SPECIFIC COLUMNS --
SELECT	SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount, LineTotal
FROM	SalesLT.SalesOrderDetail

-- ALIASING TABLES SELECTED --
SELECT	t1.SalesOrderID, 
		t1.SalesOrderDetailID, 
		t1.OrderQty, 
		t1.ProductID, 
		t1.UnitPrice, 
		t1.UnitPriceDiscount, 
		t1.LineTotal
FROM	SalesLT.SalesOrderDetail t1

-- SORTING DATA --
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