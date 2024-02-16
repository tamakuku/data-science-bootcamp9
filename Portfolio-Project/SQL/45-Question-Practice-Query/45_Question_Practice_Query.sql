
-- Q1 select ProductName, UnitPrice and UnitsInStock column from Products table.
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products;


-- Q2 Change name column UnitPrice to Price.
SELECT ProductName, UnitPrice AS Price, UnitsInStock
FROM Products;


-- Q3 Sort Price from Max to min
SELECT ProductName, UnitPrice AS Price, UnitsInStock
FROM Products
ORDER BY Price DESC;


-- Q4 Show Product Limits 5 first ROW
SELECT ProductName, UnitPrice AS Price, UnitsInStock
FROM Products
ORDER BY Price DESC
LIMIT 5;


-- Q5 insert new PriceStatus Column by Segment data in Price Column
-- IF > 80 = Expensive, Between 40-80 = Reasonable, < 40 = Cheap
SELECT ProductName, UnitPrice AS Price,
	CASE
		WHEN UnitPrice > 80 THEN 'Expensive'
		WHEN UnitPrice BETWEEN 40 AND 80 THEN 'Reasonable'
		ELSE 'Cheap'
	END AS PriceStatus
FROM Products;

-- Q6 insert new column ValueInStock by Aggregate Price * UnitsInStock
SELECT ProductName AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products;

-- Q7 change ProductName to Upper text
SELECT upper( ProductName ) AS Product ,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products;


-- Q8 Sort Product by ValueInStock column from Max to min
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
ORDER BY ValueInStock DESC;


-- Q9 Show Product only ValueInStock >= 3000
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
WHERE ValueInStock >= 3000
ORDER BY ValueInStock DESC;


-- Q10 Show Product only ValueInStock >= 3000 AND Price below 50
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
WHERE ValueInStock >= 3000 AND UnitPrice < 50
ORDER BY ValueInStock DESC;


-- Q11 Show Product have Price above 80 or UnitsInStock = 0 and Sort ValueInStock Max to min
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
WHERE UnitPrice > 80 OR UnitsInStock = 0
ORDER BY ValueInStock DESC;


-- Q12 Show Product have Stock between 15 to 20 and Sort UnitsInStock max to min
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
WHERE UnitsInStock BETWEEN 15 AND 20
ORDER BY UnitsInStock DESC;


-- Q13 Show Product have stock only 0, 10, 20 and Sort UnitsInStock max to min
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock,
		UnitPrice * UnitsInStock AS ValueInStock
FROM Products
WHERE UnitsInStock IN ( 0, 10, 20 )
ORDER BY UnitsInStock DESC;


-- Q14 Show Product have price above average price and Sort pice min to max
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock
FROM Products
WHERE UnitPrice > ( 
					SELECT avg( UnitPrice )
					FROM Products
					)
ORDER BY UnitPrice;


-- Q15 Show Product have Price less than price of product name 'Longlife Tofu' and sort Price max to min
SELECT upper( ProductName ) AS Product,
		UnitPrice AS Price,
		UnitsInStock
FROM Products
WHERE UnitPrice < ( 
					SELECT UnitPrice
					FROM Products
					WHERE upper( ProductName = 'Longlife Tofu' ) 
					)
ORDER BY UnitPrice DESC;


-- Q16 Show Customer stay in Country and City same as CustomerId 'FISSA'
SELECT CustomerId,
		CompanyName,
		Country,
		City
FROM Customers
WHERE Country = (
				SELECT Country
				FROM Customers
				WHERE CustomerId = 'FISSA'
			)
AND City = (
			SELECT City
			FROM Customers
			WHERE CustomerId = 'FISSA'
			)
AND CustomerId != 'FISSA'
;

-- Q17 Show data from Suppliers TABLE
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers;


-- Q18 Show DISTINCT Country from Suppliers and Sort A-Z
SELECT DISTINCT Country
FROM Suppliers
ORDER BY Country;


-- Q19 Show CompanyName from Suppliers table stay in USA
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country = 'USA';


-- Q20 Show CompanyName stay in USA and not have Fax data
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country = 'USA' AND Fax is NULL;


-- Q21 Show CompanyName come from country start with 'S'
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country like 'S%';


-- Q22 Show CompanyName come from country end with 'a'
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country like '%a';


-- Q23 Show CompanyName come from country contain 'an'
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country like '%an%';


-- Q24 Show CompanyName come from country contain 'a' in second position
SELECT CompanyName,
		ContactName,
		Country,
		City,
		Fax
FROM Suppliers
WHERE Country like '_a%';


-- Q25 show data CompanyName in Customers TABLE stay in Country endwith 'land'
SELECT CompanyName,
		Country,
		City
FROM Customers AS CU, Orders AS ORD
WHERE CU.CustomerId = ORD.CustomerId
AND Country like '%land'
GROUP BY CompanyName;


-- Q26 show Country that have Orders from Customers 
SELECT Country
FROM Customers AS CU, Orders AS ORD
WHERE CU.CustomerId = ORD.CustomerId
GROUP BY Country;

-- Q27 Show data in Employees TABLE
SELECT TitleOfCourtesy,
		FirstName,
		LastName,
		BirthDate
FROM Employees;


-- Q28 insert new column is Employee that combine TitleOfCourtesy + FirstName + LastName
-- and change text to upper
SELECT upper( TitleOfCourtesy || ' ' || FirstName || ' ' || LastName ) AS Employee,
		BirthDate
FROM Employees;


-- Q29 Show Employee with younger to older
SELECT upper( TitleOfCourtesy || ' ' || FirstName || ' ' || LastName ) AS Employee,
		BirthDate
FROM Employees
ORDER BY BirthDate DESC;


-- Q30 Show Employee only MR.
SELECT upper( TitleOfCourtesy || ' ' || FirstName || ' ' || LastName ) AS Employee,
		BirthDate
FROM Employees
WHERE TitleOfCourtesy = 'Mr.'
ORDER BY BirthDate DESC;


-- Q31 Show Employee BirthDate is 1995
SELECT upper( TitleOfCourtesy || FirstName || ' ' || LastName ) AS Employee,
		BirthDate
FROM Employees
WHERE BirthDate like '1995%';


-- Q32 Show Employee BirthDate is Jan
SELECT upper( TitleOfCourtesy || ' ' || FirstName || ' ' || LastName ) AS Employee,
		BirthDate
FROM Employees
WHERE BirthDate like '%-01-%';


-- Q33 JOIN 2 TABLE Products and Suppliers then show ProductName and CompanyName ( AS SupplierName )
SELECT ProductName,
		CompanyName AS SupplierName
FROM Products AS PR, Suppliers AS SU
WHERE PR.SupplierId = SU.SupplierId;


-- Q34 JOIN 3 TABLE Products, Categories and Suppliers
-- then show ProductName, CategoryName ( AS Category ) and CompanyName ( AS SupplierName )
SELECT ProductName,
		CategoryName AS Category,
		CompanyName AS SupplierName
FROM Products AS PR, Categories AS CA, Suppliers AS SU
WHERE PR.CategoryId = CA.CategoryId
AND PR.SupplierId = SU.SupplierId;


-- Q35 JOIN 4 TABLE Orders, Customers, Employees and Shippers
-- then show OrderId, OrderDate from Orders table
-- CompanyName ( AS Customer ) from Customers table
-- Full Name from Employees table
-- and CompanyName ( AS Shopper ) from Shippers table
-- group by OrderId
SELECT OrderId,
		OrderDate,
		CU.CompanyName AS Customer,
		TitleOfCourtesy || FirstName || ' ' || LastName AS Employee,
		SH.CompanyName AS Shipper
	FROM Orders AS ORD,
		Customers AS CU,
		Employees AS EM,
		Shippers AS SH
WHERE ORD.CustomerId = CU.CustomerId
AND ORD.EmployeeId = EM.EmployeeId
GROUP BY OrderId;


-- Q36 Show basic Aggregate Function for ProductName and UnitPrice in Products TABLE
SELECT count( ProductName ) AS NoOfProduct,
		sum( UnitPrice ) AS SumOfUnitPrice,
		max( UnitPrice ) AS MaxOfUnitPrice,
		min( UnitPrice ) AS MinOfUnitPrice,
		avg( UnitPrice ) AS AverageOfUnitPrice
FROM Products;


-- Q37 join 2 table Categories and Products
-- Count product each Categories and sort max to min
SELECT CategoryName,
	count( ProductName ) AS NoOfProduct
FROM Categories AS CA, Products AS PR
WHERE CA.CategoryId = PR.CategoryId
GROUP BY CategoryName
ORDER BY count( ProductName ) DESC;


-- Q38 from Q42 filter CategoryName have count product below 10
SELECT CategoryName,
	count( ProductName ) AS NoOfProduct
FROM Categories AS CA, Products AS PR
WHERE CA.CategoryId = PR.CategoryId
GROUP BY CategoryName
HAVING count( ProductName ) < 10 
ORDER BY count( ProductName )
DESC;


-- Q39 join 2 table Customers and Orders
-- Show CompanyName in Customers AS Customer
-- that have most count order top 10 and sort max to min
SELECT CompanyName AS Customer,
		count( OrderID ) AS NoOfOrder
FROM Customers AS CU, Orders AS ORD
WHERE CU.CustomerId = ORD.CustomerId
GROUP BY CompanyName
ORDER BY count( OrderID ) DESC
LIMIT 10;


-- Q40 join 2 table Customers and Orders
-- show Country, CompanyName AS Customer and count ORDER
-- sort by Country A-Z
SELECT Country,
		CompanyName AS Customer,
		count( OrderID ) AS NoOfOrder
FROM Customers AS CU, Orders AS ORD
WHERE CU.CustomerId = ORD.CustomerId
GROUP BY CompanyName
ORDER BY Country;


-- Q41 from Q46 show Customer dont have any order
SELECT CompanyName AS Customer,
		OrderId
FROM Customers AS CU
LEFT JOIN Orders AS ORD
ON CU.CustomerId = ORD.CustomerId
WHERE OrderId is NULL
GROUP BY CompanyName;


-- Q42 join 2 table Shippers and Orders
-- show CompanyName ( AS Shipper ) from Shippers TABLE
-- and sum Freight from orders TABLE
SELECT CompanyName AS Shipper,
		sum( Freight ) AS SumOfFreight
FROM Shippers AS SH, Orders AS ORD
WHERE SH.ShipperID = ORD.ShipVia
GROUP BY CompanyName;


-- Q43 insert new data into column CategoryId, CategoryName and Description in Categories table
-- ( 9, 'catename1', NULL )
-- ( 10, 'catename2', des2 )
INSERT INTO Categories ( CategoryId, CategoryName, Description )
VALUES
	( 9, 'catename1', NULL ),
	( 10, 'catename2', 'des2' );

-- recheck data
SELECT * FROM Categories;


-- Q44 chage data in Description column in CategoryId = 10
-- from 'desc2' to 'update des3'
UPDATE Categories
SET Description = 'update desc3'
WHERE CategoryId = 10;

-- recheck data
SELECT * FROM Categories;


-- Q45 DELETE all data row 9-10 from Q49
DELETE FROM Categories
WHERE CategoryId IN ( 9, 10 );

-- recheck data
SELECT * FROM Categories;

