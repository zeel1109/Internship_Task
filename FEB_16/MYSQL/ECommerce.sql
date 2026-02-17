/* ECommerce Database Schema */

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

/* Customers Table */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);



/* Products Table */

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);



/* Orders Table */

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);




/* Order Items Table */

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



/* Reviews Table */

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);





/* Inserting Records: */


INSERT INTO customers (customer_name, email, join_date) VALUES
('Zeel', 'zeel@gmail.com', '2024-01-05'),
('Dhruv', 'dhruv@gmail.com', '2024-01-10'),
('Khwahish', 'khwahish@gmail.com', '2024-02-01'),
('Harsh', 'harsh@gmail.com', '2024-02-12'),
('Janvi', 'janvi@gmail.com', '2024-03-03');


INSERT INTO products (product_name, price, category) VALUES
('Laptop', 60000, 'Electronics'),
('Mobile Phone', 25000, 'Electronics'),
('Headphones', 3000, 'Accessories'),
('Office Chair', 7000, 'Furniture'),
('Smart Watch', 5000, 'Electronics');


INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-03-10'),
(2, '2024-03-12'),
(1, '2024-04-05'),
(3, '2024-04-18'),
(4, '2024-05-02'),
(5, '2024-05-10');


INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 5, 1),
(4, 4, 1),
(5, 2, 2),
(6, 3, 1);


INSERT INTO reviews (product_id, customer_id, rating, review_date) VALUES
(1, 1, 5, '2024-03-15'),
(2, 2, 4, '2024-03-20'),
(3, 1, 5, '2024-03-16'),
(4, 3, 3, '2024-04-20'),
(2, 4, 4, '2024-05-05'),
(3, 5, 5, '2024-05-12');
