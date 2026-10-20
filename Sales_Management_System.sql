-- Sales Management System
CREATE DATABASE SalesManagement;
USE SalesManagement;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES 
(1,'Arjun Kumar','Chennai','9876543210'),
(2,'Priya S','Coimbatore','9876543211'),
(3,'Rahul M','Madurai','9876543212');

INSERT INTO Products VALUES
(101,'Laptop Dell i5','Electronics',55000.00),
(102,'Wireless Mouse','Electronics',800.00),
(103,'Office Chair','Furniture',4500.00);

INSERT INTO Orders VALUES
(1,1,'2024-01-15'),
(2,2,'2024-01-16'),
(3,3,'2024-02-10');

INSERT INTO OrderDetails VALUES
(1,1,101,1,55000.00),
(2,1,102,2,1600.00),
(3,2,103,1,4500.00);

-- Analysis Queries
-- City-wise Sales
SELECT c.city, SUM(od.amount) FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
JOIN OrderDetails od ON o.order_id=od.order_id
GROUP BY c.city;

-- Top Product
SELECT p.product_name, SUM(od.quantity) FROM Products p
JOIN OrderDetails od ON p.product_id=od.product_id
GROUP BY p.product_name ORDER BY SUM(od.quantity) DESC;
