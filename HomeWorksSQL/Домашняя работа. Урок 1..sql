USE lesson_1;
CREATE TABLE phones (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
ProductName VARCHAR (30),
Manufacturer VARCHAR (20),
ProductCount INT,
Price BIGINT
);
INSERT INTO phones (ProductName, Manufacturer, ProductCount, Price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone X', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductCount > 2;
SELECT *
FROM phones
WHERE Manufacturer LIKE 'Samsung';
SELECT *
FROM phones
WHERE ProductName REGEXP 'iPhone';
SELECT *
FROM phones
WHERE Manufacturer REGEXP 'Samsung';
SELECT *
FROM phones
WHERE ProductName REGEXP '[0-9]';
SELECT *
FROM phones
WHERE ProductName REGEXP '[%8%]';


