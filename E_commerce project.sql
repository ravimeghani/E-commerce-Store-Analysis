CREATE DATABASE E_commerce;

USE E_commerce;

-- Importing customers, products, orders data table from the dataset-- 

-- Fixing column name having hidden characters

ALTER TABLE customers
CHANGE COLUMN `ï»¿customer_id` `customer_id` INT;

ALTER TABLE products
CHANGE COLUMN `ï»¿product_id` `product_id` INT;

ALTER TABLE orders
CHANGE COLUMN `ï»¿order_id` `order_id` INT;

-- Questions  

-- 1) What is the avergae price of the products

SELECT avg(price) AS avg_price FROM products;        

-- 2) What is the highest price of a product

SELECT max(price) AS max_price FROM products;          

-- 3) List all unique products available

SELECT DISTINCT product_name FROM products;

-- 4) Find products which costs more than 500

SELECT DISTINCT product_name, price FROM Products WHERE price > 500;

-- 5) Find all orders placed in 2024

SELECT * FROM Orders WHERE YEAR(order_date) = 2024;

-- 6) Get the latest 10 orders:

SELECT * FROM Orders ORDER BY order_date DESC LIMIT 10;

-- 7) Find customers who have placed more than one orders

SELECT customer_id, count(order_id) AS orders_placed
FROM orders
GROUP BY customer_id
HAVING count(order_id) > 1;


-- 8) Find the total revenue from all the orders

SELECT SUM(price) AS total_revenue
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id;


-- 9) Find products that have never been ordered:

SELECT product_name 
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Orders);

-- 10) List the top 5 most ordered products:

SELECT product_name, COUNT(orders.product_id) AS order_count
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY product_name
ORDER BY order_count DESC
LIMIT 5;

-- 11) Find the total number of orders placed by each customer:

SELECT customers.customer_id, COUNT(order_id) AS total_orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

-- 12) Calculate the total revenue generated by each customer:

SELECT customers.customer_id, SUM(Products.price) AS total_spent
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY Customers.customer_id;

-- 13) List all orders placed in the last 30 days:

SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 14) Find customers who haven't placed any orders in the last 6 months:

SELECT Customers.first_name, Customers.last_name
FROM Customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM Orders WHERE order_date >= CURDATE() - INTERVAL 6 MONTH
);

-- 15) List all products and the number of times each product has been ordered: 

SELECT product_name, count(order_id) AS orders
FROM products 
LEFT JOIN orders
ON products.product_id = orders.product_id
GROUP BY product_name;

































