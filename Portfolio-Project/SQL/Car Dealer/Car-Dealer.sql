
-- ER Diagram Link >>> https://dbdiagram.io/d/Car-Dealer-ER-Diagram-660df7cf03593b6b611f378b

-- Create Vehicle Table
CREATE TABLE Vehicles (
    VehicleID INTEGER PRIMARY KEY,
    ModelName TEXT,
    VehicleType TEXT,
    Price REAL,
    FuelType TEXT
);

-- Create Salesperson Table
CREATE TABLE Salesperson (
    SalespersonID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT
);

-- Create Sales Transaction Table
CREATE TABLE SalesTransaction (
    TransactionID INTEGER PRIMARY KEY,
    VehicleID INTEGER,
    SalespersonID INTEGER,
    SaleDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

-- Insert Data for Vehicle Table
INSERT INTO Vehicles (ModelName, VehicleType, Price, FuelType) VALUES
('Sedan A', 'Sedan', 1200000, 'Petrol'),
('SUV X', 'SUV', 1500000, 'Electric'),
('Hatchback B', 'Hatchback', 800000, 'Petrol'),
('Sedan C', 'Sedan', 900000, 'Electric'),
('Truck Y', 'Truck', 2000000, 'Diesel'),
('SUV A', 'SUV', 1700000, 'Electric'),
('SUV Y', 'SUV', 1800000, 'Electric'),
('SUV Z', 'SUV', 1700000, 'Electric'),
('Hatchback C', 'Hatchback', 2100000, 'Petrol'),
('Sedan X', 'Sedan', 1500000, 'Petrol'),
('SUV B', 'SUV', 1300000, 'Electric');

-- Insert Data for Salesperson Table
INSERT INTO Salesperson (FirstName, LastName) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Bob', 'Johnson');

-- Insert Data for Sales Transaction Table
INSERT INTO SalesTransaction (VehicleID, SalespersonID, SaleDate) VALUES
(1, 1, '2023-03-01'),
(2, 2, '2023-03-02'),
(3, 1, '2023-03-03'),
(4, 3, '2023-03-03'),
(5, 2, '2023-03-04'),
(6, 2, '2023-03-04'),
(7, 2, '2024-03-04'),
(8, 3, '2024-03-04'),
(9, 3, '2024-03-04'),
(10, 2, '2024-03-04'),
(11, 1, '2024-03-04'),
(12, 2, '2024-03-04');

-- Preview all table
.mode box
.print \n Preview Vehicles table
select * from Vehicles limit 5;

.print \n Preview Salesperson table
select * from Salesperson limit 5;

.print \n Preview SalesTransaction table
select * from SalesTransaction limit 5;

.print \n ------------------------------------------------------------


.print \n Question 01: Please show sales of each vehicle type and sort from max to min.

.print \n Query process: Join 2 table with 'Vehicles' and 'SalesTransaction', and count transaction from each vehicle type, then show result group by vehicle type, and sort TolalSales from max to min

SELECT V.VehicleType, COUNT( S.TransactionID) AS TotalSales
FROM Vehicles AS V
JOIN SalesTransaction AS S ON V.VehicleID = S.VehicleID
GROUP BY V.VehicleType
ORDER BY TotalSales DESC;

.print \n ------------------------------------------------------------


.print \n Question 02: Who is the sales person have the most sale performance? And please show total transaction.

.print \n Query process: Join 2 table with 'Salesperson' and 'SalesTransaction', calculate count of transaction, and show result group by 'SalespersonID', then sort count from max to min
  
SELECT S.FirstName, S.LastName, COUNT(T.TransactionID) AS TotalTransaction
FROM Salesperson AS S
JOIN SalesTransaction AS T ON S.SalespersonID = T.SalespersonID
GROUP BY S.SalespersonID
ORDER BY TotalTransaction DESC;

.print \n Anwers: The best sales person is Jane Smith, who has sold 6 transaction.

.print \n ------------------------------------------------------------


.print \n Question 03: Please calculate the total sales of each sales person.

.print \n Query process: Join 3 table with 'Salesperson', 'SalesTransaction' and 'Vehicles', calculate sum of sales from 'Price', and show result group by SalespersonID, then sort TotalRevenue from max to min

SELECT S.FirstName, S.LastName, SUM(V.Price) AS TotalRevenue
FROM Salesperson AS S
JOIN SalesTransaction AS T ON S.SalespersonID = T.SalespersonID
JOIN Vehicles AS V ON T.VehicleID = V.VehicleID
GROUP BY S.SalespersonID
ORDER BY TotalRevenue DESC;

.print \n ------------------------------------------------------------


.print \n Question 04: What vehicles in fuel type between 'Electric' and 'Petrol' had the most popular sales in 2023?

.print \n Query process: Join 2 table with 'Vehicles' and 'SalesTransaction', calculate count of transaction from each fuel type, and filter sale date only year 2023 and fuel type only 'Electric' and 'Petorl', then show result group by fuel type
  
SELECT V.FuelType, COUNT(S.TransactionID) AS TotalSales
FROM Vehicles AS V
JOIN SalesTransaction AS S ON V.VehicleID = S.VehicleID
WHERE STRFTIME( '%Y', SaleDate) = '2023'
GROUP BY V.FuelType
HAVING V.FuelType BETWEEN 'Electric' AND 'Petrol';

.print \n ------------------------------------------------------------


.print \n Question 05: Please segment the vehicles model if it has a price over 1 million as 'Flagship Model' and under 1 million as 'Normal Model'.

.print \n Query process: use Case When to segment the vehicles model if it has a price over 1 million as 'Flagship Model' and under 1 as 'Normal Model', then show result sort by price from max to min

SELECT ModelName, Price,
CASE
  WHEN Price > 1000000 THEN 'Flagship Model'
  ELSE 'Normal Model'
  END ModelSegment
FROM Vehicles
ORDER BY Price DESC;

.print \n ------------------------------------------------------------
