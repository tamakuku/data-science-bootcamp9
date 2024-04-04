
-- Link ER Diagram >>> https://dbdiagram.io/d/Pizza-Shop-Database-Diagram-65ed39aeb1f3d4062c89a872


-- Create 4 Table
CREATE TABLE shops
( shop_id INT,
  shop_location TEXT);

CREATE TABLE customers
( customer_id INT,
  customer_name TEXT,
  customer_country TEXT);

CREATE TABLE menu
( menu_id INT,
  menu_name TEXT,
  menu_price INT);

CREATE TABLE orders
( order_id INT,
  order_date TEXT,
  customer_id INT,
  shop_id INT,
  menu_id INT);


-- insert data into each tables
INSERT INTO shops
  VALUES
  (1, 'Bangkok'),
  (2, 'Chaing Mai'),
  (3, 'Ranong'),
  (4, 'Udon Thani'),
  (5, 'Chonburi');

INSERT INTO customers VALUES
  (1, 'Tama', 'Japan'),
  (2, 'Kuku', 'Korea'),
  (3, 'Auau', 'Thailand'),
  (4, 'Jugjug', 'Brazil'),
  (5, 'Aokaok', 'USA'),
  (6, 'Toru', 'Japan'),
  (7, 'Yolo', 'USA'),
  (8, 'BugJeod', 'Thailand');

INSERT INTO menu
  VALUES
  (1, 'Ham_pizza', 500),
  (2, 'Cheese_pizza', 300),
  (3, 'Chicken_pizza', 200),
  (4, 'Pork_pizza', 400),
  (5, 'Beef_pizza', 1000),
  (6, 'Vagetable_pizza', 250),
  (7, 'Hawaiian_piza', 700),
  (8, 'Tomyumkung_pizza', 450),
  (9, 'Seafood_pizza', 600),
  (10, 'Tomato_pizza', 150);

INSERT INTO orders
VALUES
(1, '2022-07-01', 1, 3, 1),
(2, '2022-07-02', 2, 2, 6),
(3, '2022-07-03', 3, 2, 3),
(4, '2022-07-04', 4, 5, 4),
(5, '2022-07-05', 5, 1, 4),
(6, '2022-08-05', 2, 2, 4),
(7, '2022-08-06', 1, 4, 5),
(8, '2022-08-06', 3, 5, 4),
(9, '2022-08-07', 2, 5, 4),
(10, '2022-09-08', 2, 5, 8),
(11, '2022-09-08', 6, 1, 9),
(12, '2022-09-08', 7, 3, 10),
(13, '2022-09-09', 8, 2, 1),
(14, '2022-09-09', 8, 4, 7),
(15, '2022-09-10', 1, 2, 2);



-- use .mode box for show data in box
-- use .print \n for print message in new line
.mode box
.print \n View shops table
SELECT * FROM shops;

.print \n View customers table
SELECT * FROM customers;

.print \n View menu table
SELECT * FROM menu;

.print \n View orders table
SELECT * FROM orders;
.print \n ----------------------------------------------------------------------------



-- List the questions & query for the answers --
.print \n Question 1: How many customers have total spend over 500?

.print \n Query process: join 3 table with JOIN ON >>> select customer name that have total spend more than 500.

SELECT
  customer_name,
  SUM(menu_price) AS total_spend
FROM customers AS Cus
JOIN orders AS Ord ON Cus.customer_id = Ord.customer_id
JOIN menu AS Me ON Ord.menu_id = Me.menu_id
GROUP BY customer_name
HAVING total_spend > 1000
ORDER BY total_spend DESC;

.print \n Answers: It has 3 customers who have spent more than 500: Tama, Kuku, and Jugjug.
.print \n ----------------------------------------------------------------------------



.print \n Question 2: How many shops have the most orders?
  
.print \n Query process: join 3 table by WHERE clause, then count order show by 3 first shop location that have most order.

SELECT
    shop_location,
    COUNT(*) AS count_orders
FROM 
    shops AS T1, 
    orders AS T2,
    menu AS T3
WHERE T1.shop_id = T2.shop_id AND T2.menu_id = T3.menu_id
GROUP by 1
ORDER BY 2 DESC
LIMIT 3;

.print \n Answers: It has 3 shop locations that have the most orders: Chaing Mai, Chonburi, and Udon Thani.
.print \n ----------------------------------------------------------------------------



.print \n Question 3: Who is the customer who orders beef pizza and comes from Japan?
  
.print \n Query process: join 3 table with JOIN ON and subqueries for select only firstname customer that order beef pizza and come from Japan.

SELECT
    customer_name,
    menu_name,
    customer_country
FROM
  (SELECT * FROM customers WHERE customer_country = 'Japan') AS T1
JOIN orders AS T2 
  ON T1.customer_id = T2.customer_id
JOIN
  (SELECT * FROM menu WHERE menu_name = 'Beef_pizza') AS T3
  ON T2.menu_id = T3.menu_id;

.print \n Answers: The customer is Tama, who has ordered beef pizza and comes from Japan.
.print \n ----------------------------------------------------------------------------



.print \n Question 4: What is the shop location started with a C letter and got a pork pizza order in September?

.print \n Query process: join 3 table with JOIN ON and use WITH for subqueries, extract total sale each shop location have first letter is C and only pork pizza menu in September.

WITH
Shop_C AS (SELECT * FROM shops WHERE shop_location LIKE 'C%'),
Menu_Pork AS (SELECT * FROM menu WHERE menu_name = 'Pork_pizza'),
Month_08 AS (SELECT * from orders WHERE STRFTIME('%Y-%m', order_date) = '2022-08')

SELECT
    shop_location,
    menu_name,
    order_date,
    SUM(menu_price) AS Total_Sale
FROM Month_08 AS T1
JOIN Menu_Pork AS T2 ON T1.menu_id = T2.menu_id
JOIN Shop_C AS T3 ON T1.shop_id = T3.shop_id
GROUP BY 1
ORDER BY Total_Sale DESC;

.print \n Answers: The shop locations are Chonburi and Chaing Mai.
.print \n ----------------------------------------------------------------------------



.print \n Question 5: Where is the shop located outside of BKK that has customers from Thailand and Japan and has an average spend of less than 500?

.print \n Query proess: join 4 table with WHERE clause and use WITH for subqueries extract total sale from all shop except Bangkok, and choose customer from Thailand and Japan that have average spend not over 500.

WITH
not_BKK_shop AS (SELECT * from shops where shop_location <> 'Bangkok'),
TH_JP_customers AS (SELECT * from customers WHERE customer_country IN ('Thailand', 'Japan'))

SELECT
  shop_location,
  customer_name,
  customer_country,
  ROUND(AVG(menu_price), 2) AS avg_sale
FROM not_BKK_shop AS T1, TH_JP_customers AS T2, menu AS T3, orders AS T4
WHERE T1.shop_id = T4.shop_id
AND T2.customer_id = T4.customer_id
AND T3.menu_id = T4.menu_id
GROUP BY 1
HAVING avg_sale <=500
order by avg_sale DESC;

.print \n Answers: The shop locations are Ranong, Chonburi, and Chaing Mai.
.print \n ----------------------------------------------------------------------------
