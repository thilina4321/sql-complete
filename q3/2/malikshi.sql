create table Student (
    StudentID number not null constraint student_pk primary key,
    StudentName varchar2(255) not null,
    Email varchar2(255) not null,
    DateOfBirth varchar2(255) not null,
    MobileNumber varchar2(255) not null,
    State varchar2(255) not null,
    City varchar2(255) not null,
    Postcode varchar2(255) not null
);

create table Staff (
    StaffMemberID number not null constraint staff_mem_pk primary key,
    MemberName varchar2(255) not null
);

create table Course (
    CourseID number not null constraint course_pk primary key,
    CourseName varchar2(255) not null,
    CourseCode varchar2(255) not null,
    Description varchar2(255) not null,
    CourseCost varchar2(255) not null,
    StaffMemberID number not null constraint cor_sta_fk REFERENCES Staff(StaffMemberID)
);



create table Section (
    SectionID number not null constraint section_pk primary key,
    SectionName varchar2(255) not null,
    SectionStartDate varchar2(255) not null,
    StaffMemberID number not null constraint sec_sta_fk REFERENCES Staff(StaffMemberID),
    CourseID number not null constraint sec_cour_fk REFERENCES Course(CourseID)
);

create table CourseSection (
    SectionID number not null constraint corses_sec_fk REFERENCES Section(SectionID),
    StudentID number not null constraint corses_stu_fk REFERENCES Student(StudentID),
    SectionMark number not null
);

create table Enrollment ( 
    EnrollmentID number not null constraint enrollment_pk primary key, 
    StudentID number not null constraint enr_stu_fk REFERENCES Student(StudentID), 
    CourseID number not null constraint enr_cour_fk REFERENCES Course(CourseID), 
    EnrollmentDate varchar2(255) not null,
    EnrollmentTimeIn varchar2(255) not null,
    EnrollmentTimeOut varchar2(255) not null,
    RegistraitonNumber number not null 
);

create table Grade (
    GradeID number not null constraint grade_pk primary key,
    StudentID number not null constraint gra_stu_fk REFERENCES Student(StudentID), 
    CourseID number not null constraint gra_cour_fk REFERENCES Course(CourseID),
    FinalMark number not null,
    Grade varchar2(255) not null
);