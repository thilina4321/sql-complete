-- SELECT * FROM users;

-- SELECT * FROM addres;

-- SELECT * FROM course;

SELECT * FROM users AS u
INNER JOIN addres AS a ON u.address_id = a.id;