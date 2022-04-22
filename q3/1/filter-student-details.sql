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
                LOOP
                IF cityfields.studentCount >= popularFieldCount THEN
                    popularFieldCount := cityfields.studentCount;
                    popularField := cityfields.state;
                ELSE
                    popularField := '';
                END IF;
                    dbms_output.put_line('State : ' || cityfields.state || '   Count : '  || cityfields.studentCount);
                END LOOP;
                popularFieldCount := 0;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            ELSIF filterType = 'PostCode'  THEN
                dbms_output.put_line('Course Name : ' ||details.CourseName);
                FOR cityfields IN (SELECT Student.PostCode,COUNT(Student.StudentID) AS studentCount  FROM Enrollment JOIN Student ON Student.StudentID = Enrollment.StudentID WHERE Enrollment.CourseID = details.CourseID GROUP BY Student.PostCode ORDER BY studentCount ASC)
                LOOP
                    IF cityfields.studentCount >= popularFieldCount THEN
                        popularFieldCount := cityfields.studentCount;
                        popularField := cityfields.PostCode;
                    ELSE
                        popularField := '';
                    END IF;
                    dbms_output.put_line('Post Code : ' || cityfields.PostCode || '   Count = '  || cityfields.studentCount);
                END LOOP;
                popularFieldCount := 0;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            ELSE
                dbms_output.put_line('Course Name = ' || details.CourseName);
                FOR cityfields IN (SELECT Student.City, COUNT(Student.StudentID) AS StudentCount  FROM Enrollment JOIN Student ON Student.StudentID = Enrollment.StudentID WHERE Enrollment.CourseID = details.CourseID GROUP BY Student.City ORDER BY studentCount ASC)
                LOOP
                    IF cityfields.studentCount >= popularFieldCount THEN
                        popularFieldCount := cityfields.studentCount;
                        popularField := cityfields.city;
                    ELSE
                        popularField := '';
                    END IF;
                    dbms_output.put_line('City : ' || cityfields.city || '   Count : '  || cityfields.studentCount);
                END LOOP;
                popularFieldCount := 0;
                dbms_output.put_line('Popular City : ' || popularField);
                dbms_output.put_line('**************************************');
            END IF;
        END LOOP;
    end;
END;



EXECUTE filterStudentDetails('City');