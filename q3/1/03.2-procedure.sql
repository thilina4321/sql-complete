CREATE OR REPLACE PROCEDURE StatisticalReports
IS
BEGIN
    declare
    student_count number;
    lecture_name varchar2(255);
    maximum_mark number;
    minimum_mark number;
    average_mark number;
    standard_deviation number;
    failed_students_count number := 0;
    grade_one_students_count number := 0;
    grade_two_students_count number := 0;
    grade_three_students_count number := 0;
    begin
        FOR courseDetails IN(SELECT * from Course)
        LOOP
            dbms_output.put_line('********************  Course Details ' ||  '******************** ');
            dbms_output.put_line('Course Name : ' || courseDetails.CourseName);
            dbms_output.put_line('Course Description : ' || courseDetails.Description);
            dbms_output.put_line('*********************************************************');
            dbms_output.put_line('Course Sections of the ' || courseDetails.CourseName || ' Course :' );
            dbms_output.put_line('*********************************************************');
            FOR sectiondata IN (SELECT Section.SectionID,Section.SectionName,Section.StartDate,Section.StaffID,Section.Duration FROM Section JOIN Course ON Section.CourseID = Course.CourseID WHERE Course.CourseID = courseDetails.CourseID)
            LOOP
                SELECT NAME INTO lecture_name  FROM Staff WHERE StaffID = sectiondata.StaffID;
                SELECT COUNT(StudentID) INTO student_count FROM CourseSection WHERE SectionID = sectiondata.SectionID;
                SELECT MIN(Mark) INTO minimum_mark FROM CourseSection WHERE SectionID = sectiondata.SectionID;
                SELECT MAX(Mark) INTO maximum_mark FROM CourseSection WHERE SectionID = sectiondata.SectionID;
                SELECT AVG(Mark) INTO average_mark FROM CourseSection WHERE SectionID = sectiondata.SectionID;
                SELECT STDDEV(Mark) INTO standard_deviation FROM CourseSection WHERE SectionID = sectiondata.SectionID;
                dbms_output.put_line('Name of the section : ' || sectiondata.SectionName);
                dbms_output.put_line('Name of the lecturer : ' || lecture_name);
                dbms_output.put_line('Enrolled student count :'||  student_count);
                dbms_output.put_line( 'Section Duration : ' || sectiondata.Duration );
                dbms_output.put_line( 'Section Start Date : ' || sectiondata.StartDate );
                dbms_output.put_line('Average mark'|| ' : ' || ROUND(average_mark,2));
                dbms_output.put_line('Maximumn Mark'|| ' : ' || maximum_mark);
                dbms_output.put_line('Minimumn Mark'|| ' : ' || minimum_mark);
                dbms_output.put_line('Standerd Deviation '|| ' : ' || ROUND(standard_deviation,2));
                grade_one_students_count := 0;
                grade_two_students_count := 0;
                failed_students_count := 0;
                grade_three_students_count := 0;
                FOR coursesectiondata IN (SELECT CourseSection.Mark FROM CourseSection WHERE SectionID = sectiondata.SectionID)
                  LOOP
                    IF coursesectiondata.Mark > 80 THEN
                        grade_one_students_count := grade_one_students_count + 1;
                    ELSIF coursesectiondata.Mark > 70 THEN
                        grade_two_students_count := grade_two_students_count + 1;
                    ELSIF coursesectiondata.Mark > 60 THEN
                        grade_three_students_count := grade_three_students_count +1;
                    ELSE
                      failed_students_count := failed_students_count + 1;
                    END IF;
                  END LOOP;
                dbms_output.put_line('First Grade Students count'|| ' : ' || grade_one_students_count);
                dbms_output.put_line('Secomd Grade Students count'|| ' : ' || grade_two_students_count);
                dbms_output.put_line('Third Grade Students count'|| ' : ' || grade_three_students_count);
                dbms_output.put_line('Failed Students count'|| ' : ' || failed_students_count);
                dbms_output.put_line('*********************************************************');
            END LOOP;
        END LOOP;
    end;
END;


EXECUTE StatisticalReports()