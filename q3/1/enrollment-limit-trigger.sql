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