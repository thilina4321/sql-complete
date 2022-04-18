CREATE OR REPLACE PROCEDURE filterStudentDetails
(filterType IN varchar2)
IS
BEGIN
    declare
    studentCount number := 0;
    popularField varchar(225);
    popularFieldCount number := 0;
    begin
        dbms_output.put_line('**************************************');
        IF filterType = 'PostCode'  THEN
        dbms_output.put_line('Student Records According to PostCode');
        ELSIF filterType = 'State'  THEN
        dbms_output.put_line('Student Records According to State');
        ELSE 
        dbms_output.put_line('Student Records According to City ');
        END IF;
        dbms_output.put_line('**************************************');

        FOR details IN (select * from Course)
        LOOP
            IF filterType = 'State'  THEN
                dbms_output.put_line('Course Name : ' || details.CourseName);
                FOR cityfields IN (SELECT Student.State,COUNT(Student.StudentID) AS studentCount  FROM Enrollment JOIN Student ON Student.StudentID = Enrollment.StudentID WHERE Enrollment.CourseID = details.CourseID GROUP BY Student.State ORDER BY studentCount ASC)
                IF cityfields.studentCount > popularFieldCount THEN
                popularFieldCount = cityfields.studentCount;
                popularField = cityfields.state
                LOOP
                    dbms_output.put_line('State : ' || cityfields.state || '   Count : '  || cityfields.studentCount);
                    popularField := cityfields.state;
                END LOOP;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            ELSIF filterType = 'PostCode'  then
                dbms_output.put_line('Course Name : ' ||details.CourseName);
                FOR cityfields IN (select Student.PostCode,COUNT(Student.StudentID) as studentCount  from Enrollment join Student on Student.StudentID = Enrollment.StudentID where Enrollment.CourseID = details.CourseID GROUP BY Student.PostCode ORDER BY studentCount ASC)
                LOOP
                    dbms_output.put_line('Post Code : ' || cityfields.PostCode || '   Count = '  || cityfields.studentCount);
                    popularField := cityfields.PostCode;
                END LOOP;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            ELSE
                dbms_output.put_line('Course Name = ' || details.CourseName);
                FOR cityfields IN (SELECT Student.City, COUNT(Student.StudentID) AS StudentCount  FROM Enrollment JOIN Student ON Student.StudentID = Enrollment.StudentID WHERE Enrollment.CourseID = details.CourseID GROUP BY Student.City ORDER BY studentCount ASC)
                LOOP
                    dbms_output.put_line('City : ' || cityfields.city || '   Count : '  || cityfields.studentCount);
                    popularField := cityfields.city;
                END LOOP;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            END IF;
        END LOOP;
    end;
END;



EXECUTE filterStudentDetails('State');