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
    assignmentCount number := 0;
    begin
        FOR studentMark IN (select Course.CourseID, Course.Description, Course.CourseName  from Enrollment JOIN Course ON Course.CourseID = Enrollment.CourseID WHERE StudentID = id_of_student)
        LOOP
            FOR marksOfAssesments IN (SELECT * FROM CourseSection JOIN Section ON CourseSection.SectionID = Section.SectionID WHERE COURSEID = studentMark.CourseID AND StudentID = id_of_student)
            LOOP
                final_mark := final_mark + marksOfAssesments.Mark;
                assignmentCount := assignmentCount + 1;
            END LOOP;
            IF final_mark = 0 THEN
            final_mark := final_mark;
            ELSE 
            final_mark := final_mark / assignmentCount;
            END IF;
            SELECT StudentName,StudentID INTO student_name,student_id  FROM Student WHERE StudentID = id_of_student;
            dbms_output.put_line( 'Student ID : ' || student_id );
            dbms_output.put_line( 'Student Name : ' || student_name );
            dbms_output.put_line( 'Course Name : ' || studentMark.CourseName );
            dbms_output.put_line( 'Course Description : ' || studentMark.Description );
            dbms_output.put_line( 'Final Mark : ' || ROUND(final_mark) );
            dbms_output.put_line( ' ======================================= ');
            final_mark := 0;
            assignmentCount := 0;
        END LOOP;
    end;
END;

EXECUTE finalMarkSheet(1);