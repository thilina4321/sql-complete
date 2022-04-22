CREATE OR REPLACE TRIGGER EnrollmentLimitTrigger
BEFORE INSERT ON Enrollment
DECLARE
availableEnrollmentPlaces number := 0;
studentCount number := 0;
BEGIN
    SELECT COUNT(*) INTO studentCount FROM Enrollment;
    availableEnrollmentPlaces := 700 - studentCount;
    IF (availableEnrollmentPlaces <= 0) THEN
      RAISE_APPLICATION_ERROR(-20001,'Enrollment over for this year');
    ELSIF (5 >= availableEnrollmentPlaces) THEN
        dbms_output.put_line('For this year only ' || availableEnrollmentPlaces  || ' student can enroll');
    END IF;
END;


CREATE OR REPLACE TRIGGER StudentEnrollmentLimit
BEFORE INSERT ON Enrollment
DECLARE
countOfStudents number := 0;
availableSpaces number := 0;
BEGIN
    SELECT COUNT(*) INTO countOfStudents FROM Enrollment;
    availableSpaces := 30 - countOfStudents;
    IF (availableSpaces <= 0) THEN
      RAISE_APPLICATION_ERROR(-20001,'Student Enrollement Limit over!!');
    ELSIF (5 >= availableSpaces) THEN
        dbms_output.put_line('Only ' || availableSpaces  || ' student can enroll for this year');
    END IF;
END;


CREATE OR REPLACE TRIGGER StudentEnrollmentLimit
BEFORE INSERT ON Enrollment
DECLARE
countOfStudents number := 0;
BEGIN
    SELECT COUNT(*) INTO countOfStudents FROM Enrollment;
    IF (495 >= countOfStudents) THEN
        RAISE_APPLICATION_ERROR(-20189,'Student Enrollment is near to end');
    END IF;
END;




