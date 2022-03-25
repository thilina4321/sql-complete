-- Inner Join 

SELECT user_name FROM users 
JOIN comments ON
users.id = comments.user_id

[   ]  |||||||||  [   ]


Left outer join 

SELECT user_name FROM users 
LEFT JOIN comments ON
users.id = comments.user_id

[|||||]  |||||||||  [   ]


Right outer join 

SELECT user_name FROM users 
RIGHT JOIN comments ON
users.id = comments.user_id

[]  |||||||||  [|||||]


full JOIN


SELECT user_name FROM users 
FULL JOIN comments ON
users.id = comments.user_id

[|||||]  |||||||||  [|||||]

Three way joining

SELECT user_name, photo, comment 
FROM photos JOIN comment ON comment.user_id = photos.user_id
JOIN users On users.id = comment.user_id AND user.id = photos.user_id


aggregations means looking at several rows to get the single value
joining means merging several rows at several relational tables to provide multiple values
