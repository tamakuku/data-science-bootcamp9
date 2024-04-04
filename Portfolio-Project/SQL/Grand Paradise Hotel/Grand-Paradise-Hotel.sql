
-- ER Diagram Link >>> https://dbdiagram.io/d/Grand-Paradise-Hotel-ER-Diagram-660e5a4f03593b6b61268a53

-- Create 2 Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('available', 'occupied'))
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    room_id INT,
    customer_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Inserting data into the Rooms table
INSERT INTO Rooms (room_id, room_type, status) VALUES
(1, 'Deluxe', 'available'),
(2, 'Deluxe', 'available'),
(3, 'Executive Suite', 'available'),
(4, 'Presidential Suite', 'available'),
(5, 'Deluxe', 'occupied'),
(6, 'Presidential Suite', 'occupied'),
(7, 'Executive Suite', 'occupied'),
(8, 'Deluxe', 'available'),
(9, 'Presidential Suite', 'available');

-- Inserting data into the Reservations table
INSERT INTO Reservations (reservation_id, room_id, customer_id, check_in_date, check_out_date, amount_paid) VALUES
(1, 1, 101, '2024-02-01', '2024-02-05', 500),
(2, 2, 102, '2024-02-02', '2024-02-07', 800),
(3, 3, 103, '2024-02-03', '2024-02-10', 1200),
(4, 4, 104, '2024-02-04', '2024-02-06', 1000),
(5, 5, 105, '2024-02-05', '2024-02-09', 1500),
(6, 6, 106, '2024-02-06', '2024-02-08', 2000),
(7, 7, 107, '2024-02-07', '2024-02-11', 1800),
(8, 8, 108, '2024-02-08', '2024-02-12', 1600),
(9, 9, 109, '2024-02-09', '2024-02-13', 1400);



.mode box
.print \n Preview Rooms table
select * from Rooms limit 5;

.print \n Preview Reservations table
select * from Reservations limit 5;


.print \n Question 01: How many type of room have status are available for now?

.print \n Query process: Join 2 table with 'Rooms' and 'Reservations', filter status is 'available', then count the number of room_type, and show result group by room_type
  
SELECT room_type, amount_paid, COUNT(*) AS available_rooms
FROM Rooms AS RO
JOIN Reservations AS RE ON RO.room_id = RE.room_id
WHERE RO.status = 'available'
GROUP BY room_type;

.print \n ------------------------------------------------------------


.print \n Question 02: How many average amounts were paid that customers must pay for each time?

.print \n Query process: Calculate average of amount_paid.

SELECT ROUND( AVG(amount_paid), 2) AS average_amount
FROM Reservations;

.print \n ------------------------------------------------------------


.print \n Question 03: Who are the top spenders among customers, and how many times have they reserved?

SELECT customer_id, amount_paid, COUNT(*) AS reservation_count
FROM Reservations
GROUP BY customer_id
ORDER BY amount_paid DESC;

.print \n Answer: The top spender is customer_id 106, whose amount paid is 2,000 and reserved only once.
.print \n ------------------------------------------------------------


.print \n Question 04: What day of the week has the most reservations?

.print \n Query process: use CASE WHEN comebine with STRFTIME for segment day of week, then count the number of reservation for each day of week, then show result group by day of week, and sort by reservation count
  
SELECT
  CASE STRFTIME('%w', check_in_date)
    WHEN '0' THEN '07 Sunday'
    WHEN '1' THEN '01 Monday'
    WHEN '2' THEN '02 Tuesday'
    WHEN '3' THEN '03 Wednesday'
    WHEN '4' THEN '04 Thursday'
    WHEN '5' THEN '05 Friday'
    WHEN '6' THEN '06 Saturday'
  END AS day_of_week,
  COUNT(*) AS reservation_count
FROM Reservations
GROUP BY day_of_week
ORDER BY reservation_count DESC;

.print \n Answer: The days of the week with the most reservations are Friday and Thursday.
.print \n ------------------------------------------------------------


.print \n Question 05: Please calculate the occupancy rate (occupied divided by available, then x 100) of this hotel.
.print \n Query process:
.print \n - use SUM(status = 'occupied') to count 'occupied' status directly, because in SQL, boolean expressions like status = 'occupied' are evaluated to 1 when true and 0 when false.
.print \n - and COUNT(*) to count all rows in the table.
.print \n - then wrap the entire calculation in COALESCE to handle the case where the denominator is zero, returning 0 instead of NULL.

SELECT
    ROUND( COALESCE(
            (SUM(status = 'occupied') * 100.0) / NULLIF(COUNT(*), 0),
            0),
          2) AS occupancy_rate
FROM rooms;

.print \n Anwer: The occupancy rate of this hotel is 33.33.
.print \n ------------------------------------------------------------
