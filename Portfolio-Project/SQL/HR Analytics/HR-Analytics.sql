
-- ER Diagram Link >>> https://dbdiagram.io/d/6613967603593b6b616f2dfa


-- Create 3 table
CREATE TABLE Team (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(50)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) UNIQUE,
    hire_date DATE,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE Salary (
  employee_id INT PRIMARY KEY,
  role VARCHAR(50),
  salary INTEGER
);


-- Insert data into each table
INSERT INTO Employee (employee_id, first_name, last_name, email, hire_date, team_id)
VALUES (1, 'Warde', 'Remon', 'wremon0@zimbio.com','1-Jun-23', 1),
(2, 'Orlando', 'Groneway', 'ogroneway1@wikipedia.org', '22-Jun-23', 1),
(3, 'Amalita', 'Shorland', 'ashorland2@npr.org', '25-Mar-23', 1),
(4, 'Reinwald', 'Pickersail', 'rpickersail3@skyrock.com', '24-Jun-23', 1),
(5, 'Ilario', 'Anfrey', 'ianfrey4@google.com','2-Jan-23',1),
(6,'Davey', 'Frowen', 'dfrowen5@nsw.gov.au', '3-Mar-23', 6),
(7, 'Leigha', 'Randlesome', 'lrandlesome6@alibaba.com', '15-Oct-22', 6),
(8,'Junia', 'Yakovliv', 'jyakovliv7@artisteer.com', '31-Jul-23', 6),
(9, 'Rochell', 'Waggatt', 'rwaggatt8@opera.com', '15-Apr-23', 6),
(10, 'Moises', 'Ardley', 'mardley9@webnode.com', '21-Jun-23', 6);

INSERT INTO Team (team_id, team_name)
VALUES (1, 'plan_A'),
(6, 'plan_B');

INSERT INTO Salary (employee_id, role, salary)
VALUES (1, 'Sales', 40153),
(2, 'Marketing', 46670),
(3, 'Legal', 71983),
(4, 'Sales', 15857),
(5, 'Software Engineer', 95174),
(6, 'Sales', 27819),
(7, 'Legal', 75323),
(8, 'Software Engineer', 90525),
(9, 'Tax Accountant', 85946),
(10, 'Marketing', 56575);



-- use .mode box for show data in box
-- use .print \n for print message in new line
.mode box
.print \n Preview each tables
.print \n Employee table
SELECT * FROM Employee LIMIT 5;

.print \n Team table
SELECT * FROM Team;

.print \n Salary table
SELECT * FROM Salary LIMIT 5;

.print \n ----------------------------------------------------------------------------


.print \n Question 01: Please extract our employee data, including important information.

.print \n Query process: Join 2 table is 'Employee' and ' Salary', then select the column we need

SELECT
  first_name, 
  last_name, 
  email, 
  hire_date, 
  role,
  salary
FROM Employee AS E
LEFT JOIN Salary AS S
ON E.employee_id = S.employee_id;

.print \n Answer: The employee data is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 02: Who is the latest three employee start work with us?

.print \n Query process: Join 2 table is 'Employee' and ' Team', then select the column we need, and use RANK() + OVER( ORDER BY ) for ranking 'hire_date' data and sort from max to min, then show result only 3 first rows

SELECT
  first_name,
  last_name,
  email,
  team_name,
  E.team_id,
  hire_date,
  RANK() OVER( ORDER BY hire_date DESC) AS hire_date_rank
FROM Employee AS E
LEFT JOIN Team AS T
ON E.team_id = T.team_id
LIMIT 3;

.print \n Answer: The latest three employees to start working with us are 'Junia', 'Davey', and 'Amalita'.
.print \n ----------------------------------------------------------------------------


.print \n Question 03: What is the average salary for each position? And what is the proportion of the total employee salary?

.print \n Query process: Join 2 table is 'Salary' and 'Employee', then calculate average of salary each role, and then calculate the proportion of the total employee salary by sum of salary each role multiply with 1.0 and divide with sum of all salary, then show result group by role

SELECT
  role, 
  AVG(salary) AS average_salary,
  ROUND( SUM(salary) * 1.0 / (SELECT SUM(salary)
                              FROM Salary ), 2)
  AS percentage_of_salary
FROM Salary AS S
JOIN Employee AS E
ON S.employee_id = E.employee_id
GROUP BY role;

.print \n Answer: The average salary for each position and proportion of the total employee salary is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 04: Please segment employees that have a salary over 75,000 as 'Manager', between 45,000 and 75,000 as 'Senior', and the rest as 'Staff'.

.print \n Query process: Join 2 table is 'Salary' and 'Employee', then use CASE WHEN for segment 'staff_level' by salary range

SELECT
  first_name,
  last_name,
  salary,
  CASE
    WHEN salary > 75000 THEN 'Manager'
    WHEN salary BETWEEN 45000 AND 75000 THEN 'Senior'
    ELSE 'Staff'
    END AS staff_level
FROM Employee AS E
JOIN Salary AS S
ON E.employee_id = S.employee_id;

.print \n Answer: The segmentation of employees by staff level and range of salary is shown in the table above.
.print \n ----------------------------------------------------------------------------


.print \n Question 05: If have a new employee starts work on October 14, 2023, in the 'Marketing' role, then how much is the average salary from this role change?

.print \n Query process: calculate average of salary filter role is 'Marketing'

.print \n Calculate average salary for 'Marketing' role first
  SELECT 
    role,
    ROUND( AVG(salary), 2) AS average_salary
  FROM Salary
  WHERE role = 'Marketing';
  
.print \n Insert new employee data into 'Employee' and 'Salary' table first

INSERT INTO Employee (employee_id, first_name, last_name, email, hire_date, team_id)
VALUES (11, 'Tama', 'Kuku', 'tama@kuku.com','14-Oct-23', 6);

INSERT INTO Salary (employee_id, role, salary)
VALUES (11, 'Marketing', 45000);

.print \n Then recheck result
SELECT *
FROM Employee
ORDER BY employee_id DESC
LIMIT 1;

SELECT *
FROM Salary
ORDER BY employee_id DESC
LIMIT 1;

.print \n Then calculate average salary for 'Marketing' role again
SELECT 
  role,
  ROUND( AVG(salary), 2) AS average_salary
FROM Salary
WHERE role = 'Marketing';

.print \n Answer: The average salary for the 'Marketing' role changes from 51,622.5 to 49,415 when a new employee comes.
.print \n ----------------------------------------------------------------------------
