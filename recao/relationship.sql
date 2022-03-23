-- CREATE TABLE address (
--     id INT AUTO_INCREMENT ,
--     address VARCHAR(255),
--     PRIMARY KEY (id),
--     recap_id INT,
--     FOREIGN Key (recap_id) REFERENCES recap(id)
-- )

-- ALTER TABLE users 
-- CHANGE  nams full_name TEXT;

-- insert into address (address, recap_id)
-- values 
-- ('thilina_address' , 1),
-- ('dilshan_address' , 2)

SELECT * FROM address

-- alter table address
-- CHANGE address address_details varchar(255)