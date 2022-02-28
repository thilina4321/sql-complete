CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(4),
    age INT,
    current_status ENUM('employed', 'unemployed'),
    revenue NUMERIC(5,2),
    is_hiring BOOLEAN,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

