
-- Link ER Diagram >>> https://dbdiagram.io/d/Sales-Datasets-6610bae103593b6b615275da


-- Create 6 table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  city VARCHAR(50),
  order_count INTEGER
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  payment_method VARCHAR(50),
  amount INTEGER,
  order_id INT,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Order_Details (
  order_id INT,
  product_id INT,
  quantity INTEGER,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  unit_price FLOAT
);

CREATE TABLE Expired_Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  expiration_date DATE
);


-- Insert data into each tables
INSERT INTO Orders (order_id, customer_id, order_date)
VALUES
  (1, '61-9760745', '17-01-2022'),
  (2, '52-3535014', '07-09-2021'),
  (3, '02-1137231', '16-02-2022'),
  (4, '84-5692031', '7/4/2023'),
  (5, '54-2364648', '7/25/2021'),
  (6, '95-8839983', '2/22/2022'),
  (7, '40-2510020', '7/30/2022'),
  (8, '36-4985773', '11/26/2021'),
  (9, '90-7608988', '11/25/2023'),
  (10, '71-4595008', '3/5/2023'),
  (11, '71-7937313', '6/4/2021'),
  (12, '77-7174697', '2/14/2023'),
  (13, '15-0555193', '8/1/2021'),
  (14, '31-7775741', '5/14/2021'),
  (15, '41-5178437', '1/23/2023'),
  (16, '17-9826606', '5/28/2021'),
  (17, '72-9932424', '4/10/2023'),
  (18, '72-1705612', '5/26/2021'),
  (19, '75-3153045', '4/4/2021'),
  (20, '94-7031101', '12/18/2021'),
  (21, '53-0525345', '5/23/2021'),
  (22, '66-1570441', '4/7/2023'),
  (23, '23-0581020', '12/3/2021'),
  (24, '29-0813345', '2/13/2023'),
  (25, '74-0511441', '11/30/2021');


INSERT INTO Products (product_id, product_name, unit_price)
VALUES
  (1, 'Sugar - Brown', 66.52),
  (2, 'Tea - Herbal I Love Lemon', 10.73),
  (3, 'Cloves - Ground', 56.41),
  (4, 'Trout - Rainbow, Frozen', 54.27),
  (5, 'Lychee', 54.62),
  (6, 'Yogurt - Strawberry, 175 Gr', 81.97),
  (7, 'Dates', 32.79),
  (8, 'Potatoes - Fingerling 4 Oz', 35.62),
  (9, 'Pork - Sausage, Medium', 42.65),
  (10, 'Chicken Giblets', 12.21);


INSERT INTO Order_Details (order_id, product_id, quantity)
VALUES
  (1, 1, 3),
  (2, 2, 8),
  (3, 3, 8),
  (4, 4, 1),
  (5, 5, 8),
  (6, 6, 8),
  (7, 7, 1),
  (8, 8, 6),
  (9, 9, 8),
  (10, 10, 6),
  (11, 1, 10),
  (12, 2, 10),
  (13, 3, 10),
  (14, 4, 1),
  (15, 5, 9),
  (16, 6, 10),
  (17, 7, 7),
  (18, 8, 1),
  (19, 9, 6),
  (20, 10, 1),
  (21, 1, 9),
  (22, 3, 5),
  (23, 4, 6),
  (24, 5, 2),
  (25, 10, 3);


INSERT INTO Customers (customer_id, customer_name, city, order_count)
VALUES
  ('61-9760745', 'Frankie', 'Okuta', 3),
  ('52-3535014', 'Izaak', 'Mugumu', 5),
  ('02-1137231', 'Andie', 'Dampit', 6),
  ('84-5692031', 'Brenden', 'Sabanalarga', 5),
  ('54-2364648', 'Lesya', 'Khorostkiv', 4),
  ('95-8839983', 'Pippy', 'Sayama', 2),
  ('40-2510020', 'Stacey', 'Baisha', 1),
  ('36-4985773', 'Ginevra', 'Pajapita', 1),
  ('90-7608988', 'Thor', 'As Suqaylibīyah', 1),
  ('71-4595008', 'Yettie', 'Mora', 10),
  ('71-7937313', 'Rodge', 'Stockholm', 10),
  ('77-7174697', 'Janka', 'Junyang', 8),
  ('15-0555193', 'Sutherlan', 'Dongshangguan', 4),
  ('31-7775741', 'Meredithe', 'Fengjiang', 8),
  ('41-5178437', 'Drucy', 'Trelleborg', 3),
  ('17-9826606', 'Cybill', 'Huaibei', 6),
  ('72-9932424', 'Christie', 'Surulangun Rawas', 6),
  ('72-1705612', 'Jillian', 'Luhansk', 5),
  ('75-3153045', 'Lira', 'Tongliao', 9),
  ('94-7031101', 'Andie', 'Baitu', 9),
  ('53-0525345', 'Reggie', 'Timóteo', 2),
  ('66-1570441', 'Riobard', 'Clones', 7),
  ('23-0581020', 'Stephine', 'Bandera', 9),
  ('29-0813345', 'Jock', 'Frederiksberg', 5),
  ('74-0511441', 'Osgood', 'Dobřany', 8);


INSERT INTO Payments (payment_id, order_id, payment_method, amount)
VALUES
  (1, 1, 'maestro', 40.01),
  (2, 2, 'jcb', 56.67),
  (3, 3, 'diners-club-enroute', 72.84),
  (4, 4, 'jcb', 30.33),
  (5, 5, 'china-unionpay', 66.84),
  (6, 6, 'visa-electron', 77.79),
  (7, 7, 'jcb', 47.14),
  (8, 8, 'jcb', 15.81),
  (9, 9, 'diners-club-carte-blanche', 88.60),
  (10, 10, 'visa', 31.98),
  (11, 11, 'jcb', 16.44),
  (12, 12, 'diners-club-enroute', 21.02),
  (13, 13, 'jcb', 27.92),
  (14, 14, 'mastercard', 51.04),
  (15, 15, 'visa', 46.66),
  (16, 16, 'diners-club-enroute', 44.49),
  (17, 17, 'jcb', 24.45),
  (18, 18, 'mastercard', 34.83),
  (19, 19, 'jcb', 30.27),
  (20, 20, 'china-unionpay', 85.42),
  (21, 21, 'visa-electron', 37.04),
  (22, 22, 'solo', 67.41),
  (23, 23, 'mastercard', 45.35),
  (24, 24, 'jcb', 17.58),
  (25, 25, 'jcb', 67.63);


INSERT INTO Expired_Products (product_id, product_name, expiration_date)
VALUES
  (1, 'Sugar - Brown', '2022-10-31 04:58:50'),
  (2, 'Tea - Herbal I Love Lemon', '2022-05-04 12:33:53'),
  (3, 'Cloves - Ground', '2023-03-26 14:57:03'),
  (4, 'Trout - Rainbow, Frozen', '2021-07-06 18:54:31'),
  (5, 'Lychee', '2021-12-14 20:57:23'),
  (6, 'Yogurt - Strawberry, 175 Gr', '2021-02-05 00:10:18'),
  (7, 'Dates', '2021-03-15 12:30:40'),
  (8, 'Potatoes - Fingerling 4 Oz', '2023-08-18 10:53:20'),
  (9, 'Pork - Sausage, Medium', '2023-06-08 09:06:04'),
  (10, 'Chicken Giblets', '2022-01-16 06:19:44');



-- use .mode box for show data in box
-- use .print \n for print message in new line
.mode box
.print \n Preview each tables
.print \n Customers table
select * from customers limit 5;

.print \n Orders table
select * from Orders limit 5;

.print \n Payments table
select * from Payments limit 5;

.print \n Order_Details table
select * from Order_Details limit 5;

.print \n Products table
select * from Products limit 5;

.print \n Expired_Products table
select * from Expired_Products limit 5;

.print \n ----------------------------------------------------------------------------


.print \n Question 01: Please extract all customer data that comes from Mora City.

.print \n Quecy process: select all data from 'Customers' table, and filter 'city' column = 'Mora'
  
SELECT *
FROM Customers
WHERE city = 'Mora';

.print \n Answer: The customer that comes from Mora City is Yettie.
.print \n ----------------------------------------------------------------------------


.print \n Question 02: Please extract the latest order data from each customer.

.print \n Query process: Join 2 table 'Orders' and 'Customers', use MAX() to find lastest 'order_date', then show result group by 'customer_id' from 'Orders' table
  
SELECT Ord.customer_id, customer_name, MAX(order_date) AS lastest_order_date
FROM Orders AS Ord
JOIN Customers AS Cus
ON Ord.customer_id = Cus.customer_id
GROUP BY Ord.customer_id;

.print \n Answer: The last order from each customer is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 03: How many total orders from each customer?

.print \n Query process: Join 2 table 'Customers' and 'Orders', and count 'order_id', then show result group by 'customer_id' from 'Customers' table

SELECT Cus.customer_id, customer_name, COUNT(order_id) AS total_order
FROM Customers AS Cus
JOIN Orders AS Ord
ON Cus.customer_id = Ord.customer_id
GROUP BY Cus.customer_id;

.print \n Answer: The total order from each customer is shown in the table above.
.print \n ----------------------------------------------------------------------------

  
.print \n Question 04: How much is the running total of sales for each product over time?

.print \n Query process: Join 3 table 'Order_Details', 'Orders' and 'Products', then find running total sales over time by OVER( PARTITION BY 'product_id' and ORDER BY 'order_date') like a find cumulative sum.

SELECT
    Od.product_id,
    O.order_date,
    SUM(Od.quantity * P.unit_price) OVER (PARTITION BY Od.product_id ORDER BY O.order_date) AS running_total
FROM
    Order_Details AS Od
JOIN
    Orders AS O ON Od.order_id = O.order_id
JOIN
    products AS P ON Od.product_id = P.product_id;

.print Answer: The running total of sales for each product over time is shown in the table.
.print \n ----------------------------------------------------------------------------


.print \n Question 05: What products have a unit price less than 20?

.print \n Query process: select 2 column is 'product_name' and 'unitprice' from 'Products' table, then filter unit price < 20
  
SELECT product_name, unit_price
FROM Products
WHERE unit_price < 20;

.print \n Answer: The products with a unit price less than 20 are 'Tea - Herbal I Love Lemon' and 'Chicken Giblets'.
.print \n ----------------------------------------------------------------------------


.print \n Question 06: Who is the customer with the highest order amount?

.print \n Query process: Join 3 table is 'Customers', 'Orders' and 'Payments', then sort 'amount' from max to min

SELECT customer_name, amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Payments ON Orders.order_id = Payments.order_id
ORDER BY amount DESC;

.print \n Answer: The customer with the highest order amount is 'Thor'.
.print \n ----------------------------------------------------------------------------


.print \n Question 07: What payment method has a total amount less than 200?

.print \n Query proess: calculate sum of 'amount', show result group by 'payment_method', then filter total_amount < 200 and sort from max to min

SELECT payment_method, SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method
HAVING total_amount < 200
ORDER BY total_amount DESC;

.print \n Answer: The payment method with a total amount less than 200 is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 08: Please calculate the average order count for each city.

.print \n Query process: calculate average 'order_count', show result group by 'city'
  
SELECT city, AVG(order_count) AS average_order_count
FROM Customers
GROUP BY city;

.print \n Answer: The average order count per city is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 09: Who of the top 5 customers has the highest total order amount?

.print Query process: Join 3 table is 'Customers', 'Orders' and 'Payments', calculate total order amount from each customer group by 'customer_id', then sort total order amount from max to min

SELECT Cu.customer_id, customer_name, SUM(amount) AS total_order_amount
FROM Customers AS Cu
JOIN Orders AS Ord ON Cu.customer_id = Ord.customer_id
JOIN Payments AS Pa ON Ord.order_id = Pa.order_id
GROUP BY Cu.customer_id, customer_name
ORDER BY total_order_amount desc
LIMIT 5;

.print \n Answer: The top 5 customers with the highest total order amount are 'Thor', 'Andie', 'Pippy', 'Andie' and 'Osgood'.
.print \n ----------------------------------------------------------------------------


.print \n Question 10: Please extract the product list and total quantity sold.

.print \n Query process: Join 2 table is 'Products' and 'Order_Details', calculate total of 'quantity', then show result group by 'product_name'

SELECT product_name, SUM(quantity) AS total_quantity
FROM Products AS Pr
JOIN Order_Details AS Od ON Pr.product_id = Od.product_id
GROUP BY product_name;

.print \n Answer: The product list and total quantity sold is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 11: What is the payment method that has the highest total amount?

.print \n Query process: calculate sum of 'amount', show result group by 'payment_method', then sort total amount from max to min

SELECT payment_method, SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method
ORDER BY total_amount DESC;

.print \n Answer: The payment method that has the highest total amount is 'jcb'.
.print \n ----------------------------------------------------------------------------

.print \n Question 12: Please calculate the total revenue that comes from orders when the quantity is multiplied by the unit price.

.print \n Query process: Join 3 table is 'Orders', 'Products' and 'Order_Details', calculate total revenue by sum of quantity multiply unit price
  
SELECT SUM(quantity * unit_price) AS total_amount
FROM Orders AS O
JOIN Order_details AS Ord
ON O.order_id = Ord.order_id
JOIN Products AS P
ON Ord.product_id = P.product_id;

.print \n Answer: The total revenue from orders is 7,132.27.
.print \n ----------------------------------------------------------------------------


.print \n Question 13: Please extract the product name list with a unit price between 20 and 50.

.print \n Query process: select 2 column is 'product_name' and 'unit_price' from 'Product' table, then filter unit price between 20 and 50

SELECT product_name, unit_price
FROM Products
WHERE unit_price BETWEEN 20 AND 50;

.print \n Answer: The product name list that has units priced between 20 and 50 is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 14: Please calculate the percentages of total sales for each payment method.

.print \n Query process: calculate sum of 'amount' divide with total sales * 100, then set descimal number with ROUND(), and show result group by 'payment_method'

SELECT payment_method, SUM(amount) AS total_sales,
      ROUND( SUM(amount) / (
                    SELECT SUM(amount) FROM Payments
                    ) * 100 , 2) AS percentage_of_total_sales
FROM Payments
GROUP BY payment_method;

.print \n Answer: The percentage of total sales for each payment method is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 15: Please delete all records of products that have expired before 2022.

.print \n Query process: view all data from 'expired_products' table, then use DELETE FROM and filter Year < 2022 by WHERE + CAST( AS INTEGER) + STRFTIME('%Y'), and view update data again

.print \n Before deleting expired products
SELECT * FROM expired_products
ORDER BY CAST( STRFTIME('%Y', expiration_date) AS INTEGER) DESC;

DELETE FROM expired_products
WHERE CAST( STRFTIME('%Y', expiration_date) AS INTEGER) < 2022;

.print \n Reheck expired products before 2022 were deleted.
SELECT * FROM expired_products
ORDER BY CAST( STRFTIME('%Y', expiration_date) AS INTEGER) DESC;

.print \n Answer: All expired products before 2022 are shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 16: Please extract the product name with expired date after 2022.

.print \n Query process: extract data from 'expired_products' table, then filter Year after 2022 by WHERE + CAST( AS INTEGER) + STRFTIME('%Y')

SELECT product_name, expiration_date
FROM Expired_Products
WHERE CAST( STRFTIME('%Y', expiration_date) AS INTEGER) > 2022;

.print \n Answer: The product name with expired date after 2022 is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 17: Please extract the latest order for each product.

.print \n Query process: Join 3 table is 'Orders', 'Order_Details' and 'Products' then use MAX() to find lastest 'order_date', then show result group by 'product_id'

SELECT Ord.product_id, P.product_name, MAX(order_date) AS latest_order_date
FROM Orders AS O
JOIN Order_Details AS Ord
ON O.order_id = Ord.order_id
JOIN Products AS P
ON P.product_id = Ord.product_id
GROUP BY P.product_id;

.print \n Answer: The latest order for each product is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 18: How much is the total amount of payment from each customer?

.print \n Query process: Join 3 table is 'Payments', 'Orders' and 'Customers', then calculate total amount, and show result group by 'customer_id' and 'customer_name'
  
SELECT C.customer_id, customer_name, payment_method, SUM(amount) AS total_amount
FROM Payments AS P
LEFT JOIN Orders AS O
ON P.order_id = O.order_id
LEFT JOIN Customers AS C
ON C.customer_id = O.customer_id
GROUP BY C.customer_id, customer_name;

.print \n Answer: The total amount of payment from each customer is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 19: Who is the customer with the highest total amount of payment?

.print \n Query process: use the syntax from Question 18 and sort by total_amonut from max to min, then limit show result only first one
  
SELECT C.customer_id, customer_name, payment_method, SUM(amount) AS total_amount
FROM Payments AS P
LEFT JOIN Orders AS O
ON P.order_id = O.order_id
LEFT JOIN Customers AS C
ON C.customer_id = O.customer_id
GROUP BY C.customer_id, customer_name
ORDER BY total_amount DESC
LIMIT 1;

.print \n Answer: The customer with the highest total amount of payment is 'Thor'.
.print \n ----------------------------------------------------------------------------

/* Optional for Question 19 use WITH for CTE

  WITH CustomerPayments AS (
    SELECT
      c.customer_id,
      c.customer_name,
      COALESCE(SUM(p.amount), 0) AS total_payments
    FROM
      Customers c
      LEFT JOIN Orders o ON c.customer_id = o.customer_id
      LEFT JOIN Payments p ON o.order_id = p.order_id
    GROUP BY
      c.customer_id, c.customer_name
  ),
  RankedCustomers AS (
    SELECT
      customer_id,
      customer_name,
      total_payments,
      RANK() OVER (ORDER BY total_payments DESC) AS payment_rank
    FROM
      CustomerPayments
  )
  SELECT
    customer_id,
    customer_name,
    total_payments
  FROM
    RankedCustomers
  WHERE
    payment_rank = 1;

*/

.print \n Question 20: Please rank products based on total revenue.

.print \n Query process: Join 2 table is 'Products' and 'Order_Details', calculate total revenue by sum of 'quantity' multiply with 'unit_price', then show result group by 'product_id' and 'product_name', with sort total revenue from max to min

SELECT 
  P.product_id,
  product_name, 
  SUM(quantity * unit_price) AS total_revenue,
  RANK() OVER (ORDER BY SUM(quantity * unit_price) DESC) AS rank_of_revenue
FROM Products AS P
LEFT JOIN Order_Details AS Ord
ON P.product_id = Ord.product_id
GROUP BY P.product_id, product_name
ORDER BY total_revenue DESC;

.print \n Answer: The rank of products based on total revenue is shown in the table above.
.print \n ----------------------------------------------------------------------------

/* Optional for Question 20 use WITH for CTE

WITH ProductRevenue AS (
SELECT p.product_id, p.product_name, COALESCE(SUM(od.quantity * p.unit_price), 0) AS total_revenue
FROM Products p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
)
SELECT product_id, product_name, total_revenue,
RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM ProductRevenue;

*/
