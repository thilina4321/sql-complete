CREATE OR REPLACE PROCEDURE finalMarkSheet
(id_of_student IN number)
IS
BEGIN
    declare
    student_id number;
    student_name varchar2(255);
    course_id number;
    course_name varchar2(255);
    course_description varchar2(255);
    final_mark number := 0;
    begin
        FOR studentMark IN (select Course.CourseID, Course.Description, Course.CourseName from Enrollment JOIN Course ON Course.CourseID = Enrollment.CourseID WHERE StudentID = id_of_student)
        LOOP
            FOR marksOfAssesments IN (SELECT * FROM CourseSection JOIN Section ON CourseSection.SectionID = Section.SectionID WHERE COURSEID = studentMark.CourseID AND StudentID = id_of_student)
            LOOP
                final_mark := final_mark + marksOfAssesments.Mark;
            END LOOP;
            final_mark := final_mark / 3;
            SELECT StudentName,StudentID INTO student_name,student_id  FROM Student WHERE StudentID =id_of_student;
            dbms_output.put_line(student_id || '|' || student_name || '|' || studentMark.CourseName || '|' || studentMark.Description || '|' || ROUND(final_mark));
            final_mark := 0;
        END LOOP;
    end;
END;
/
EXECUTE finalMarkSheet(1)


--------------------------------------------------------------



CREATE OR REPLACE PROCEDURE StatisticalReports
IS
BEGIN
    declare
    name_of_the_instruntor varchar2(255);
    student_name number;
    minimum_mark number;
    maximum_mark number;
    average_mark number;
    std_dev number;
    first_grade number := 0;
    second_grade number := 0;
    third_grade number := 0;
    failures number := 0;
    begin
        FOR coursedetail IN(select * from Course)
        LOOP
            dbms_output.put_line('*********************** Courses Statictical Reports ***********************');
            dbms_output.put_line(coursedetail.CourseName || '|' || coursedetail.Description);
            dbms_output.put_line('Section');
            dbms_output.put_line(' ');
            FOR sectiondetails IN (select Section.SectionID,Section.SectionName,Section.StartDate,Section.StaffID from Section join Course on Section.CourseID = Course.CourseID where Course.CourseID = coursedetail.CourseID)
            LOOP
                select NAME into name_of_the_instruntor  from Staff where StaffID = sectiondetails.StaffID;
                select COUNT(StudentID) into student_name from CourseSection where SectionID = sectiondetails.SectionID;
                select MIN(Mark) into minimum_mark from CourseSection where SectionID = sectiondetails.SectionID;
                select MAX(Mark) into maximum_mark from CourseSection where SectionID = sectiondetails.SectionID;
                select AVG(Mark) into average_mark from CourseSection where SectionID = sectiondetails.SectionID;
                select STDDEV(Mark) into std_dev from CourseSection where SectionID = sectiondetails.SectionID;
                dbms_output.put_line(sectiondetails.SectionName || '|' || sectiondetails.StartDate || '|' || name_of_the_instruntor);
                dbms_output.put_line('No of Students Enrolled'|| ' = ' || student_name);
                dbms_output.put_line('Minimumn Mark'|| ' = ' || minimum_mark);
                dbms_output.put_line('Maximumn Mark'|| ' = ' || maximum_mark);
                dbms_output.put_line('Average Mark'|| ' = ' || ROUND(average_mark,2));
                dbms_output.put_line('Standerd Deviation '|| ' = ' || ROUND(std_dev,2));
                first_grade := 0;
                second_grade := 0;
                failures := 0;
                third_grade := 0;
                FOR coursesectiondetails IN (select CourseSection.Mark from CourseSection where section_id :== sectiondetails.SectionID)
                  LOOP
                    IF coursesectiondetails.Mark > 80 then
                        first_grade := first_grade + 1;
                    ELSIF coursesectiondetails.Mark > 70 then
                        second_grade := second_grade + 1;
                    ELSIF coursesectiondetails.Mark > 60 then
                        third_grade := third_grade +1;
                    ELSE
                      failures := failures + 1;
                    END IF;
                  END LOOP;
                dbms_output.put_line('Number of First Grade Students'|| ' = ' || first_grade);
                dbms_output.put_line('Number of Secomd Grade Students'|| ' = ' || second_grade);
                dbms_output.put_line('Number of Third Grade Students'|| ' = ' || third_grade);
                dbms_output.put_line('Number of Failures'|| ' = ' || failures);
                dbms_output.put_line(' ==================================== ');
            END LOOP;
        END LOOP;
    end;
END;

EXECUTE StatisticalReports()