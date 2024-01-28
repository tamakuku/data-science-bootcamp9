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

.mode box
SELECT * FROM shops;

SELECT * FROM customers;

SELECT * FROM menu;

SELECT * FROM orders;

-- Query 1 Join 3 Table โดยใช้ JOIN ON และ SUM เพื่อดูรายชื่อลูกค้า ที่มียอดสั่งซื้อ pizza รวมมากกว่า 500
SELECT 
  customer_name,
  SUM(menu_price) AS total_spend
FROM customers AS Cus
JOIN orders AS Ord ON Cus.customer_id = Ord.customer_id
JOIN menu AS Me ON Ord.menu_id = Me.menu_id
GROUP BY customer_name
HAVING total_spend > 500
ORDER BY total_spend DESC;

-- Query 2 Join 3 Table ด้วย WHERE แล้วใช้ COUNT เพื่อดูว่า Shop ที่มีจำนวน Order มากที่สุด โดยเรียงจาก มากสุด ไป น้อยสุด 3 อันดับแรก
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

-- Query 3 Join 3 Table ด้วย JOIN ON แล้วใช้ Subqueries แบบ Standard เพื่อดึง firstname ลูกค้า ที่สั่งซื้อเฉพาะ Menu Beef_pizza และ country อยู่ใน Japan
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


-- Query 4 Join 3 Table แล้วใช้ WITH สร้าง Subqueries สำหรับเงื่อนไข ในการดึงข้อมูล หายอดขาย Pork_pizza ของ Shop ที่ขึ้นต้นด้วยตัว C เฉพาะในเดือน 08 (ใช้ STRFTIME)
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

-- query 5 Join 4 Table ด้วย WHERE Clause และ ใช้ WITH ทำเงื่อนไขทั้งหมดให้เป็น Subqueries เพื่อหายอดขายทุกร้าน ยกเว้นสาขา Bangkok เลือกเฉพาะลูกค้า Thailand กับ japan และที่มียอดสั่งซื้อเฉลี่ย ไม่เกิน 500 โดยเรียงจากยอดขาย มากสุดไปน้อยสุด
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