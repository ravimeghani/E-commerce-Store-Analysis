CREATE DATABASE E_commerce;

USE E_commerce;

-- Import customers data table from the dataset-- 

-- Fixing column name with having hidden characters

ALTER TABLE customers
CHANGE COLUMN `ï»¿customer_id` `customer_id` INT;

-- customers table is as follows

SELECT * FROM customers;

-- Import products data table from the dataset-- 

-- Fixing column name with having hidden characters

ALTER TABLE products
CHANGE COLUMN `ï»¿product_id` `product_id` INT;

-- products table is as follows

SELECT * FROM products;














