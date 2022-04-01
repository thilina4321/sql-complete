-- three way data joining...
-- SELECT * FROM users_surge AS u JOIN city_surge AS c ON
-- u.address_id = c.id JOIN address_surge AS a ON c.city_id = a.id;

-- left join
SELECT * FROM users_surge AS u LEFT JOIN city_surge AS c ON
u.address_id = c.id