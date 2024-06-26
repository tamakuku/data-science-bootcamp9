
# Project Summary: ETL Sales Dataset and SQL Queries

Test Run Code [_Click Replit_](https://replit.com/@spanthu/SalesDatasets)

see ER-Diagram [_Click DB diagram_](https://dbdiagram.io/d/Sales-Datasets-6610bae103593b6b615275da)

This project come from practice made by Datayolk.
website https://datayolk.net/
Thanks for the practice.

## Project Overview
This project involves creating a database for a sales dataset, inserting data into it, and running SQL queries to extract and analyze information. The project aims to enhance skills in ETL (Extract, Transform, Load) processes and SQL querying.

### 01 Create 6 table
- Customers, Orders, Payments, Order_Details, Products, Expired_Produccts

### 02 Insert data into tables
- customer_id, customer_name, city, order_count >>> Customers
- order_id, order_date, customer_id >>> Orders
- payment_id, payment_method, amount, order_id >>> Payments
- order_id, product_id, quanity >>> Order_Details
- product_id, product_name, unit_price >>> Products
- product_id, product_name, expiration_date >>> Expired_Products

### 03 use SQL syntax query data to find the answers for questions
- Clause >>> SELECT, FROM, JOIN ON, WHERE, GROUP BY, HAVING, ORDER BY, OVER, PARTITION BY, LIMIT
- Sub-queries by WITH for CTE and Nested Sub-queries by SELECT ( SELECT FROM ) FROM
- Aggregate Fucntion >>> SUM, AVG, MIN, MAX, COUNT
- Operators >>> AS, ROUND, LIKE, = > <, STRFTIME, BETWEEN, IN, AND

### 04 List of questions
- Please extract all customer data that comes from Mora City.
- Please extract the latest order data from each customer.
- How many total orders from each customer?
- How much is the running total of sales for each product over time?
- What products have a unit price less than 20?
- Who is the customer with the highest order amount?
- What payment method has a total amount less than 200?
- Please calculate the average order count for each city.
- Who of the top 5 customers has the highest total order amount?
- Please extract the product list and total quantity sold.
- What is the payment method that has the highest total amount?
- How much is the total revenue that comes from orders when the quantity is multiplied by the unit price?
- Please extract the product name list with a unit price between 20 and 50.
- How much is the percentage of total sales for each payment method?
- Please delete all records of products that have expired before 2022.
- What is the product name that expired after 2022?
- Please extract the latest order for each product.
- How much is the total amount of payment from each customer?
- Who is the customer with the highest total amount of payment?
- Please rank products based on total revenue.
