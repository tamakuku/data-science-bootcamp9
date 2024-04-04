
-- ER Diagram View Link >>> https://dbdiagram.io/d/Customer-Review-Diagram-6519135bffbf5169f0ce6d84


-- Create 3 tables
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  contact_info TEXT
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT
);

CREATE TABLE reviews (
  review_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  product_id INTEGER,
  rating INTEGER,
  review_text TEXT,
  date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);



-- Insert data into customers table
INSERT INTO customers (name, contact_info) VALUES
('John Doe', 'john.doe@example.com'),
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Emma Davis', 'emma.davis@example.com'),
('Michael Brown', 'michael.brown@example.com'),
('Sarah Wilson', 'sarah.wilson@example.com'),
('David Lee', 'david.lee@example.com'),
('Emily White', 'emily.white@example.com'),
('Daniel Miller', 'daniel.miller@example.com'),
('Olivia Taylor', 'olivia.taylor@example.com');

-- Insert data into products table
INSERT INTO products (product_name) VALUES
  ('Product A'),
  ('Product B'),
  ('Product C');

-- Insert data into reviews table
INSERT INTO reviews (customer_id, product_id, rating, review_text, date) VALUES
(1, 1, 5, 'Excellent product!', '2024-03-01'),
(2, 1, 4, 'Good product, but could be improved.', '2024-03-02'),
(1, 2, 3, 'Not satisfied with the quality.', '2024-03-03'),
(3, 3, 5, 'Amazing experience with Product C.', '2024-03-04'),
(2, 2, 2, 'Very disappointed with Product B.', '2024-03-05'),
(1, 3, 4, 'Impressed with Product C features.', '2024-03-06'),
(4, 1, 5, 'Great service and fast delivery.', '2024-03-07'),
(5, 2, 4, 'Decent product for the price.', '2024-03-08'),
(6, 3, 2, 'Not recommended, poor quality.', '2024-03-09'),
(7, 1, 3, 'Average product, nothing special.', '2024-03-10'),
(8, 2, 4, 'Satisfied with the purchase.', '2024-03-11'),
(9, 3, 5, 'Best product I have ever bought!', '2024-03-12'),
(10, 1, 2, 'Terrible experience, never buying again.', '2024-03-13'),
(1, 2, 4, 'Improved quality compared to previous purchases.', '2024-03-14'),
(2, 3, 3, 'Product meets expectations, nothing extraordinary.', '2024-03-15'),
(3, 1, 5, 'Highly recommend, great value for money.', '2024-03-16'),
(4, 2, 1, 'Worst purchase ever, complete waste of money.', '2024-03-17'),
(5, 3, 4, 'Good product with fast shipping.', '2024-03-18'),
(6, 1, 2, 'Disappointed, did not live up to the hype.', '2024-03-19'),
(7, 2, 5, 'Exceeded expectations, fantastic product!', '2024-03-20'),
(8, 3, 3, 'Average quality, but the price is reasonable.', '2024-03-21'),
(9, 1, 4, 'Impressive features, would recommend.', '2024-03-22'),
(10, 2, 1, 'Regret buying, poor quality and bad customer service.', '2024-03-23'),
(1, 3, 5, 'Absolutely love it, worth every penny!', '2024-03-24'),
(2, 1, 3, 'Okay product, but there are better alternatives.', '2024-03-25');



-- use .mode box for print reults as table
-- use .print \n for print text line
-- Preview tables
.mode box
.print \n Preview all tables

.print \n customers table
SELECT * FROM customers LIMIT 5;

.print \n products table
SELECT * FROM products LIMIT 5;

.print \n reviews table
SELECT * FROM reviews LIMIT 5;
.print \n --------------------------------------------------------------------



-- Query find the answers for each questions
.print \n Questions 01: How many average of rating from each product?

.print \n Query process: join 2 table with reviews and products table, caluate average of rating, then show result group by product_id

SELECT p.product_id, p.product_name, ROUND(AVG(r.rating)) AS average_rating
FROM products AS p
JOIN reviews AS r ON p.product_id = r.product_id
GROUP BY p.product_id;

.print \n Answer: The average rating from each product is between 3.0 and 4.0.
.print \n --------------------------------------------------------------------


.print \n Question 02: Who is customer give rating more than 4?

.print \n Query process: join 2 table with reviews and customers table, filter rating > 4, then show result group by customer_id

SELECT c.customer_id, c.name, c.contact_info, r.rating
FROM customers AS c
JOIN reviews AS r ON c.customer_id = r.customer_id
WHERE r.rating > 4
GROUP BY c.customer_id;

.print \n Answer: Have five customers give a rating higher than 4.
.print \n --------------------------------------------------------------------


.print \n Question 03: How many times does each customer give a total rating?

.print \n Query proess: join 2 table with customers and reviews, find count of rating, then show result group by customer_id

SELECT c.customer_id, c.name, c.contact_info, COUNT(r.rating) AS count_rating
FROM customers AS c
JOIN reviews AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

.print \n Answer: The total count of ratings for each customer is around 2–5.
.print \n --------------------------------------------------------------------


.print \n Question 04: How many average ratings from each day of the week?

.print \n Query process: use strftime function to get day of the week, and find average of rating, then group and sort result by day of week.

SELECT
  CASE STRFTIME('%w', date)
    WHEN '0' THEN '07 Sunday'
    WHEN '1' THEN '01 Monday'
    WHEN '2' THEN '02 Tuesday'
    WHEN '3' THEN '03 Wednesday'
    WHEN '4' THEN '04 Thursday'
    WHEN '5' THEN '05 Friday'
    WHEN '6' THEN '06 Saturday'
  END AS day_of_week,
  ROUND(AVG(rating)) AS avg_rating
FROM reviews
GROUP BY day_of_week
ORDER BY day_of_week;

.print \n Answer: Each day of the week has an average rating around 3.0-4.0.
.print \n --------------------------------------------------------------------


.print \n Question 05: What products have an average rating equal to or over 3.5?

.print \n Query process: join 2 table with reviews and products table, caluate average of rating group by product_id, and use having filter average of rating >= 3.5

SELECT p.product_id, p.product_name, ROUND( AVG(r.rating), 2) AS avg_rating
FROM products AS p
JOIN reviews AS r ON p.product_id = r.product_id
GROUP BY p.product_id
HAVING avg_rating >= 3.5;

.print \n Answer: We have two products: Products A and C, which have an average rating equal to or over 3.5.
.print \n --------------------------------------------------------------------


.print \n Question 06: How many negative review have "disappointed" in the review text?

.print \n Query process: use like operators to find "disappointed" in review_text, and count all of this review, then show result group by review_text

SELECT review_text, COUNT(review_text) AS count_negative_review
FROM reviews
WHERE review_text LIKE '%disappointed%'
GROUP BY review_text;

.print \n Answer: There are 2 reviews that have "disappointed" in the review text.
.print \n --------------------------------------------------------------------


.print \n Question 07: How many customers have a positive review or have "excellent,"  "impressive," or "recommended" in the review text and have a rating equal to or over 4?

.print \n Query process: join 2 table with reviews and customers table, filter review_text like "%excellent%" or "impressive" or "recommended", and rating >= 4

SELECT c.customer_id, c.name, r.rating, r.review_text
FROM customers AS c
JOIN reviews AS r ON c.customer_id = r.customer_id
WHERE r.review_text LIKE '%excellent%' 
   OR r.review_text LIKE '%impressive%' 
   OR r.review_text LIKE '%recommend%'
   AND r.rating >= 4;

.print \n Answer: There are 3 customers who have a positive review with a condition met in the question.
.print \n --------------------------------------------------------------------


.print \n Question 08: How many average text review lengths from each customer?

.print \n Query process: join 2 table with reviews and customers table, calculate average of review_text length, and show result group by customer_id, then sort by average of review_text length from max to min
  
SELECT c.customer_id, c.name, AVG(LENGTH(r.review_text)) AS avg_length_review
FROM customers AS c
JOIN reviews AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY avg_length_review DESC;

.print \n Answer: The average text review length for each customer is around 30.5–46.5.
.print \n --------------------------------------------------------------------
