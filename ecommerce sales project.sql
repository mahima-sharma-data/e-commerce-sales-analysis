CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
DROP DATABASE ecommerce;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price INT
);
INSERT INTO customers VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Aman', 'Delhi'),
(4, 'Neha', 'Pune'),
(5, 'Riya', 'Mumbai');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 'Electronics', 1, 50000),
(102, 2, 'Mobile', 'Electronics', 2, 20000),
(103, 3, 'Headphones', 'Electronics', 3, 2000),
(104, 4, 'Shoes', 'Fashion', 2, 3000),
(105, 5, 'Watch', 'Fashion', 1, 5000),
(106, 1, 'Mobile', 'Electronics', 1, 20000),
(107, 2, 'Shoes', 'Fashion', 1, 3000);
SELECT SUM(quantity * price) AS total_sales
FROM orders;
SELECT product,
       SUM(quantity * price) AS sales
FROM orders
GROUP BY product
ORDER BY sales DESC;
SELECT category,
       SUM(quantity * price) AS sales
FROM orders
GROUP BY category;
SELECT c.customer_name,
       SUM(o.quantity * o.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
SELECT c.customer_name,
       SUM(o.quantity * o.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_spent > 20000;
SELECT product, price
FROM orders
WHERE price = (SELECT MAX(price) FROM orders);
SELECT AVG(price) AS average_price
FROM orders;