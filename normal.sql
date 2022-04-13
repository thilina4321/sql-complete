INSERT INTO GRADE (ID, Student_ID, Course_ID, Final_Mark, Grade) VALUES (10, 1,100, 90, A);
INSERT INTO GRADE (ID, Student_ID, Course_ID, Final_Mark, Grade) VALUES (11, 2,110, 80, A);
INSERT INTO GRADE (ID, Student_ID, Course_ID, Final_Mark, Grade) VALUES (12, 3,120, 55, C);
SELECT * FROM GRADE;


ID number not null constraint grade_pk primary key,
Student_ID number not null constraint gra_stu_fk REFERENCES Student(Student_ID),
Course_ID number not null constraint gra_cour_fk REFERENCES Course(Course_ID),
Final_Mark number not null,
Grade varchar2(255) not null


