
-- SELECT * FROM ENROLL JOIN COURSE ON ENROLL.CRS_id = COURSE.ID 
-- join student on student.id = enroll.std_id

SELECT s.id,  s.name, c.course_name from student as s left join enroll as e on s.id = e.std_id 
join course as c on c.id = e.crs_id


