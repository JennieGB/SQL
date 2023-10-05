USE lesson_2;
CREATE TABLE sales (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_date DATE,
bucket VARCHAR (30)
);
INSERT INTO sales (order_date, bucket)
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

SELECT *,
CASE
   WHEN bucket < 100 
      THEN 'Маленький заказ'
   WHEN bucket > 100 AND bucket < 300
      THEN 'Средний заказ'
   ELSE 'Большой заказ'
END AS sales_size
FROM sales;
# Второй вариант
SELECT *,
CASE
   WHEN bucket < 100 
      THEN 'Маленький заказ'
   WHEN bucket > 100 AND bucket < 300
      THEN 'Средний заказ'
   WHEN bucket > 300
       THEN 'Большой заказ'
END AS sales_size
FROM sales;


CREATE TABLE orderss (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
empoloyeeid CHAR (3),
amount DECIMAL (5,2),
orderstatus VARCHAR (10)
);
INSERT INTO orderss (empoloyeeid, amount, orderstatus)
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED'),
('e04', '99.99', 'OPEN');
SELECT id, orderstatus,
CASE 
   WHEN orderstatus = 'OPEN'
     THEN 'Order is in open state'
   WHEN orderstatus = 'CLOSED'
     THEN 'Order is closed'
   WHEN orderstatus = 'CANCELLED'
     THEN 'Order is canceled'  
END AS order_summary
FROM orderss;


      