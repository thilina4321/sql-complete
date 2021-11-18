-- CREATE DATABASE talently;

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_created DATE DEFAULT (CURRENT_DATE),
    date_fullfiled DATE,
    customer_name VARCHAR(250) NOT NULL,
    product_name VARCHAR(250) NOT NULL,
    volume NUMERIC(10,2) NOT NULL CHECK(volume >= 0),
    is_recurring BOOLEAN DEFAULT FALSE


);