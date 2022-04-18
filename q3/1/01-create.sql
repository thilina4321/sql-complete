create table Student (
    StudentID number not null constraint student_pk primary key,
    StudentName varchar2(255) not null,
    Email varchar2(255) not null,
    Gender varchar2(255) not null,
    State varchar2(255) not null,
    City varchar2(255) not null,
    PostCode varchar2(255) not null
);

create table Staff (
    StaffID number not null constraint staff_pk primary key,
    Name varchar2(255) not null,
    Email varchar2(255) not null,
    Gender varchar2(255) not null
);

create table Course (
    CourseID number not null constraint course_pk primary key,
    CourseName varchar2(255) not null,
    Description varchar2(255) not null,
    StaffID number not null constraint course_staff_fk REFERENCES Staff(StaffID)
);

create table Section (
    SectionID number not null constraint section_pk primary key,
    SectionName varchar2(255) not null,
    Assesment varchar2(255) not null,
    StartDate varchar2(255) not null,
    Duration varchar2(255) not null,
    StaffID number not null constraint section_staff_fk REFERENCES Staff(StaffID),
    CourseID number not null constraint section_course_fk REFERENCES Course(CourseID)

);

create table CourseSection (
    CourseSectionsID number not null constraint coursesection_pk primary key,
    Mark number not null,
    SectionID number not null constraint corses_sec_fk REFERENCES Section(SectionID),
    StudentID number not null constraint corses_stu_fk REFERENCES Student(StudentID)
);

create table Enrollment ( 
    EnrollmentID number not null constraint enrollment_pk primary key, 
    StudentID number not null constraint enrollment_student_fk REFERENCES Student(StudentID), 
    CourseID number not null constraint enrollment_course_fk REFERENCES Course(CourseID) 
);

create table Grade (
    GradeID number not null constraint grade_pk primary key,
    FinalMark number not null,
    Grade varchar2(255) not null,
    StudentID number not null constraint grade_student_fk REFERENCES Student(StudentID), 
    CourseID number not null constraint grade_course_fk REFERENCES Course(CourseID)
);