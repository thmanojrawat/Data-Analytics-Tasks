-- DAY 9
USE data_analytics;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(80) NOT NULL,
    category VARCHAR(40),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_name VARCHAR(80) NOT NULL,
    customer_age INT NOT NULL CHECK (customer_age >= 18),
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    courier VARCHAR(50) NOT NULL,
    shipment_status VARCHAR(20) NOT NULL
        CHECK (shipment_status IN ('Pending','Shipped','Delivered','Cancelled')),
    tracking_no VARCHAR(50) UNIQUE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    return_reason VARCHAR(100) NOT NULL,
    return_status VARCHAR(20) NOT NULL
        CHECK (return_status IN ('Requested','Approved','Rejected','Refunded')),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO products VALUES
(101,'Laptop','Electronics',65000,20),
(102,'Headphones','Electronics',2500,80),
(103,'Office Chair','Furniture',7000,35),
(104,'Keyboard','Electronics',1500,60),
(105,'Backpack','Accessories',1800,45);

INSERT INTO orders VALUES
(5001,101,'Aman',21,1,'2026-09-01'),
(5002,102,'Riya',24,2,'2026-09-02'),
(5003,103,'Karan',28,1,'2026-09-03'),
(5004,104,'Neha',22,3,'2026-09-04'),
(5005,105,'Vikas',31,1,'2026-09-05');

INSERT INTO shipments VALUES
(9001,5001,'BlueDart','Delivered','BD10001'),
(9002,5002,'Delhivery','Shipped','DL10002'),
(9003,5003,'DTDC','Pending','DT10003'),
(9004,5004,'BlueDart','Delivered','BD10004'),
(9005,5005,'Delhivery','Cancelled','DL10005');

INSERT INTO returns VALUES
(7001,5002,'Damaged item','Approved'),
(7002,5004,'Wrong product','Requested');

