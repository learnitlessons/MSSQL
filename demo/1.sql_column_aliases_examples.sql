-- Query without aliases
SELECT
	BusinessEntityID,
	FirstName,
	LastName
FROM Person.Person;

-- Same query with descriptive aliases
SELECT
	BusinessEntityID AS EmployeeID,
	FirstName AS GivenName,
	LastName AS Surname
FROM Person.Person;

-- Method 1: Using AS keyword
SELECT
	soh.SalesOrderID AS OrderNumber,
	soh.OrderDate AS PurchaseDate,
	soh.TotalDue AS OrderTotal
FROM Sales.SalesOrderHeader AS soh;

-- Method 2: Using equals sign
SELECT
	OrderNumber = soh.SalesOrderID,
	PurchaseDate = soh.OrderDate,
	OrderTotal = soh.TotalDue  
FROM Sales.SalesOrderHeader soh;

-- Calculated Columns (Sales analysis example)
SELECT
	sod.SalesOrderID AS OrderNumber, --43659
	sod.UnitPrice AS ListPrice, --100$
	sod.UnitPriceDiscount AS DiscountAmount, --10$
	sod.OrderQty AS Quantity, --5 units
	sod.UnitPrice * sod.OrderQty AS GrossAmount, --$100 x 5 = 500
	(sod.UnitPrice * sod.OrderQty) - --$500 gross
	(sod.UnitPriceDiscount * sod.OrderQty) --minus ($10 x 5 = $50 discount)
	AS NetAmount --$450 final price
FROM Sales.SalesOrderDetail AS sod;
