USE lesson_3;
CREATE TABLE salespeople (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
snum INT,
sname VARCHAR (20),
city VARCHAR (20),
comm CHAR (3)
);
INSERT INTO salespeople (snum, sname, city, comm)
VALUES
('1001', 'Peel', 'London', '.12'),
('1002','Serres', 'San Jose', '.13'),
('1004', 'Motika', 'London', '.11'),
('1007', 'Rifkin', 'Barcelona', '.15'),
('1003', 'Axelrod', 'New York', '.10');

CREATE TABLE castomers (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
cnum INT,
cname VARCHAR (20),
city VARCHAR (20),
rating INT,
snum INT
);
INSERT INTO castomers (cnum, cname, city, rating, snum)
VALUES
('2001', 'Hoffman', 'London', '100', '1001'),
('2002', 'Giovanni', 'Rome', '200', '1003'),
('2003', 'Liu', 'San Jose', '200', '1002'),
('2004', 'Grass', 'Berlin', '300', '1002'),
('2006', 'Clemens', 'London', '100', '1001'),
('2008', 'Cisneros', 'San Jose', '300', '1007'),
('2007', 'Pereira', 'Rome', '100', '1004');

CREATE TABLE orders (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
onum INT,
amt DECIMAL (7,2),
odate DATE,
cnum INT,
snum INT
);
INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
('3001', '18.69', '1990-03-10', '2008', '1007'),
('3003', '767.19', '1990-03-10', '2001','1001'),
('3002', '1900.10', '1990-03-10', '2007', '1004'),
('3005', '5160.45', '1990-03-10', '2003', '1002'),
('3006', '1098.16', '1990-03-10', '2008', '1007'),
('3009', '1713.23', '1990-04-10', '2002', '1003'),
('3007', '75.75', '1990-04-10', '2004', '1002'),
('3008', '4723.00', '1990-05-10', '2006', '1001'),
('3010', '1309.95', '1990-06-10', '2004', '1002'),
('3011', '9891.88', '1990-06-10', '2006', '1001');

SELECT city, sname, snum, comm
FROM salespeople;
SELECT city, cname, cnum
FROM castomers;

SELECT rating, cname, city
FROM castomers
WHERE city = 'San Jose';

SELECT DISTINCT snum
FROM salespeople;

SELECT *
FROM castomers
WHERE cname LIKE 'G%';

SELECT *
FROM orders
WHERE amt > 1000;

SELECT MIN(amt)
FROM orders;

SELECT *
FROM castomers
WHERE city = 'Rome'
HAVING rating > 100;

SELECT *
FROM workers
ORDER BY salary ASC;

SELECT *
FROM workers
ORDER BY salary DESC;

SELECT *
FROM workers
ORDER BY salary DESC
LIMIT 5;

select specialty, sum(salary)
from workers
group by specialty
having sum(salary) >= 100000;
