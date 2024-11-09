SELECT 
  st.Name AS SalesTerritory,
  sp.BusinessEntityID AS SalesPersonID,
  CONCAT(p.FirstName, ' ', p.LastName) AS SalesPersonName,
  COUNT(soh.SalesOrderID) AS TotalOrders,
  SUM(soh.TotalDue) AS TotalSales,
  SUM(soh.SubTotal) AS SubTotal,
  SUM(soh.TaxAmt) AS TotalTax,
  AVG(soh.TotalDue) AS AverageOrderSize
FROM 
  Sales.SalesOrderHeader AS soh
JOIN 
  Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
JOIN 
  Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN 
  Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY
  st.Name, 
  sp.BusinessEntityID, 
  p.FirstName, 
  p.LastName
ORDER BY 
  SalesTerritory, 
  TotalSales DESC;
