INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        1,
        'Smith',
        'smith@gmail.com',
        'Male',
        'Sydney',
        'New South Wales',
        '12500'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        2,
        'Root',
        'root@gmail.com',
        'Male',
        'Melbourne',
        'Victoria',
        '34588'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        3,
        'Green',
        'green@gmail.com',
        'Male',
        'Adalaide',
        'Perth',
        '55476'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        4,
        'Mooney',
        'mooney@gmail.com',
        'Female',
        'Sydney',
        'New South Wales',
        '12500'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        5,
        'Perry',
        'perry@gmail.com',
        'Female',
        'Hobart',
        'Tasmania',
        '23432'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        6,
        'Kevin',
        'kevin@gmail.com',
        'Male',
        'Sydney',
        'New South Wales',
        '12500'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        7,
        'Peter',
        'peter@gmail.com',
        'Male',
        'Hobart',
        'Tasmania',
        '23432'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        8,
        'Mandana',
        'mandana@gmail.com',
        'Female',
        'Melbourne',
        'Victoria',
        '34588'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        9,
        'Knight',
        'knight@gmail.com',
        'Female',
        'Adalaide',
        'Perth',
        '55476'
    );
INSERT INTO Student (
        StudentID,
        StudentName,
        Email,
        Gender,
        City,
        State,
        PostCode
    )
VALUES (
        10,
        'Lee',
        'lee@gmail.com',
        'Female',
        'Sydney',
        'New South Wales',
        '12500'
    );
SELECT *
FROM Student;
INSERT INTO Staff (StaffID, Name, Email, Gender)
VALUES (201, 'Adam', 'adam@gmail.com', 'Male');
INSERT INTO Staff (StaffID, Name, Email, Gender)
VALUES (202, 'Joss', 'joss@gmail.com', 'Male');
INSERT INTO Staff (StaffID, Name, Email, Gender)
VALUES (203, 'Mishka', 'mishka@gmail.com', 'Female');
INSERT INTO Staff (StaffID, Name, Email, Gender)
VALUES (204, 'James', 'james@gmail.com', 'Male');
INSERT INTO Staff (StaffID, Name, Email, Gender)
VALUES (205, 'Roos', 'roos@gmail.com', 'Female');
SELECT *
FROM Staff;
INSERT INTO Course (CourseID, CourseName, Description, StaffID)
VALUES (
        301,
        'Network Security',
        'Course for the future network security specialist',
        201
    );
INSERT INTO Course (CourseID, CourseName, Description, StaffID)
VALUES (
        302,
        'Software Engineering',
        'Course for the future software engineers',
        202
    );
INSERT INTO Course (CourseID, CourseName, Description, StaffID)
VALUES (
        303,
        'Computer Science',
        'Course for the future computer scientists',
        203
    );
INSERT INTO Course (CourseID, CourseName, Description, StaffID)
VALUES (
        304,
        'Businees Studies',
        'Course that help to learn about the business studies and accounts',
        204
    );
INSERT INTO Course (CourseID, CourseName, Description, StaffID)
VALUES (305, 'Arts', 'Course for the future Artists', 205);
SELECT *
FROM Course;
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        401,
        'Fundamantals of programming',
        'Quiz',
        '2022-02-12',
        '4 months',
        202,
        302
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        402,
        'Linux introduction',
        'Quiz',
        '2022-02-15',
        '3 months',
        201,
        303
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        403,
        'Operating Systems',
        'Mid Term',
        '2022-02-18',
        '3 months',
        203,
        302
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        404,
        'Ecomonics',
        'Quiz',
        '2022-02-21',
        '4 months',
        204,
        304
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        405,
        'Singing',
        'Exam',
        '2022-02-12',
        '5 months',
        205,
        304
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        406,
        'Ethical Hancking',
        'Mid Term',
        '2022-02-18',
        '3 months',
        201,
        301
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        407,
        'Voice Training',
        'Exam',
        '2022-02-12',
        '5 months',
        205,
        305
    );
INSERT INTO Section (
        SectionID,
        SectionName,
        Assesment,
        StartDate,
        Duration,
        StaffID,
        CourseID
    )
VALUES (
        408,
        'Accounts',
        'Exam',
        '2022-02-19',
        '4 months',
        204,
        304
    );
SELECT *
FROM Section;
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (501, 60, 401, 1);
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (502, 72, 404, 2);
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (503, 89, 405, 2);
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (504, 35, 408, 3);
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (505, 63, 403, 1);
INSERT INTO CourseSection (CourseSectionsID, Mark, SectionID, StudentID)
VALUES (505, 45, 404, 3);
SELECT *
FROM CourseSection;
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (601, 1, 302);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (602, 1, 303);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (603, 2, 304);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (604, 2, 305);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (605, 3, 304);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (607, 4, 302);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (608, 4, 301);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (609, 5, 302);
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES (600, 5, 304);
SELECT *
FROM Enrollment;
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (700, 80, 'A', 1, 302);
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (701, 56, 'F', 2, 304);
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (702, 23, 'F', 3, 305);
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (703, 12, 'F', 4, 301);
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (704, 96, 'A', 4, 302);
INSERT INTO GRADE (GradeID, FinalMark, Grade, StudentID, CourseID)
VALUES (705, 63, 'C', 1, 303);
SELECT *
FROM GRADE;