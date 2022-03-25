-- CREATE TABLE users_surge(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email TEXT,
--     address_id INT
-- )

-- CREATE TABLE city_surge(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     address TEXT,
--     address_number INT,
--     city_id Int
-- )


CREATE TABLE address_surge(
    id INT AUTO_INCREMENT PRIMARY KEY,
    city TEXT
)