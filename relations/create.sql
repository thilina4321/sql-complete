CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    age INT,
    address_id INT,
    course_id INT

);

CREATE TABLE addres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    addres VARCHAR(300)
);

CREATE TABLE course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(300),
    fee INT
);