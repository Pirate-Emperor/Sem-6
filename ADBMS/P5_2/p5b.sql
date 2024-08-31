-- Create Tables

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(255),
    category VARCHAR(255),
    PRIMARY KEY (product_id)
);

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT,
    product_id INT,
    inventory_date DATETIME,
    inventory_level INT,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Q1) Top 5 products with the highest inventory levels on the most recent inventory date:

SELECT p.product_name, i.inventory_level, i.inventory_date
FROM Inventory i
JOIN Products p ON p.product_id = i.product_id
WHERE DATE(i.inventory_date) = (SELECT MAX(DATE(inventory_date)) FROM Inventory)
ORDER BY i.inventory_level DESC
LIMIT 5;

-- Q2) Total inventory level for each product category on the most recent inventory date:

SELECT p.category, SUM(i.inventory_level) as total_inventory
FROM Products p
JOIN Inventory i ON p.product_id = i.product_id
WHERE DATE(i.inventory_date) = 
(SELECT MAX(DATE(inventory_date)) FROM Inventory ic 
JOIN Products pc ON pc.product_id = ic.product_id WHERE pc.category = p.category)
GROUP BY p.category;

-- Q3) Average inventory level for each product category for the month of January 2022:

SELECT p.category, AVG(i.inventory_level) as avg_inventory
FROM Products p
JOIN Inventory i ON p.product_id = i.product_id
WHERE MONTH(i.inventory_date) = 1 AND YEAR(i.inventory_date) = 2022
GROUP BY p.category;

-- Q4) Products that had a decrease in inventory level from the previous inventory date to the current inventory date:

SELECT DISTINCT(p.product_name)
FROM Products p
JOIN Inventory i1 ON p.product_id = i1.product_id
JOIN Inventory i2 ON p.product_id = i2.product_id
WHERE i1.inventory_date < i2.inventory_date AND i1.inventory_level > i2.inventory_level;

-- Q5) Overall trend in inventory levels for each product category over the month of January 2022:

SELECT p.category, AVG(i.inventory_level) as avg_inventory, 
COUNT(i.inventory_level) as count_inventory, 
SUM(i.inventory_level) as total_inventory, 
MAX(i.inventory_level) as max_inventory, 
MIN(i.inventory_level) as min_inventory
FROM Products p
JOIN Inventory i ON p.product_id = i.product_id
WHERE MONTH(i.inventory_date) = 1 AND YEAR(i.inventory_date) = 2022
GROUP BY p.category
ORDER BY avg_inventory DESC;
