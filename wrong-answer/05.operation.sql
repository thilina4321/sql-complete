SELECT * from enroll as e 
join student as s on  s.id = e.std_id
where e.std_id = 1 