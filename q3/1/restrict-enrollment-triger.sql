
CREATE OR REPLACE TRIGGER RestrictEnteringEnrollmentData
BEFORE INSERT OR UPDATE OR DELETE ON Enrollment
BEGIN
    IF(TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '09:00' AND '17:00' OR TO_CHAR(SYSDATE,'DY') = 'SAT' OR TO_CHAR(SYSDATE,'DY') = 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20399,'Enrollment Details Not allow to change other than  9:00 AM - 05:00 PM in weekdays.');
    END IF;
END;