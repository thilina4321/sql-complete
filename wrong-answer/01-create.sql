CREATE TABLE enroll(
    std_id int,
    crs_id int,
    FOREIGN KEY (std_id) REFERENCES student(id),
    FOREIGN KEY (crs_id) REFERENCES course(id)
)

 -- CREATE TABLE course(id int AUTO_INCREMENT PRIMARY KEY, course_name TEXT)
-- CREATE TABLE student(id int AUTO_INCREMENT PRIMARY KEY, name TEXT)