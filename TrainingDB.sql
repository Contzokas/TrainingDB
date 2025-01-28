CREATE DATABASE TrainingDB;
GO

USE TrainingDB;
GO

CREATE TABLE EMPLOYEE (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(200),
    PhoneNumber VARCHAR(15),
    SubjectTaught VARCHAR(100),
    Specialization VARCHAR(100) 
);

CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    DepartmentAddress VARCHAR(200)
);

CREATE TABLE EMPLOYEE_DEPARTMENT (
    EmployeeDepartmentID INT PRIMARY KEY,
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
    DepartmentID INT NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID),
    StartDate DATE NOT NULL,
    EndDate DATE,
    Salary DECIMAL(10, 2)
);

CREATE TABLE COURSE (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    TotalHours INT NOT NULL,
    Description VARCHAR(500)
);

CREATE TABLE PREREQUISITE_COURSE (
    PrerequisiteID INT PRIMARY KEY,
    CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
    PrerequisiteCourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID)
);

CREATE TABLE OFFERING (
    OfferingID INT PRIMARY KEY,
    CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(20) CHECK (Type IN ('Mandatory', 'Optional')),
    Hours INT NOT NULL,
    TeacherID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID)
);

ALTER TABLE OFFERING
ADD CONSTRAINT Unique_Offering_Teacher UNIQUE (OfferingID, TeacherID);

CREATE TABLE EMPLOYEE_TRAINEE (
    TraineeID INT PRIMARY KEY,
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID)
);

CREATE TABLE TRAINEE_TEACHER (
    TraineeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE_TRAINEE(TraineeID),
    TeacherID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
    PRIMARY KEY (TraineeID, TeacherID) 
);

CREATE TABLE TRAINEE_COURSE (
    TraineeCourseID INT PRIMARY KEY,
    TraineeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE_TRAINEE(TraineeID),
    CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
    FinalGrade DECIMAL(5, 2)
);

CREATE TABLE TRAINEE_OFFERING_GRADE (
    TraineeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE_TRAINEE(TraineeID),
    OfferingID INT NOT NULL FOREIGN KEY REFERENCES OFFERING(OfferingID),
    Grade DECIMAL(5, 2),
    PRIMARY KEY (TraineeID, OfferingID)
);

INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, JobTitle, Email, Address, PhoneNumber, SubjectTaught, Specialization)
VALUES
(1, 'John', 'Doe', 'Trainer', 'johndoe@example.com', '123 Main St', '555-1234', 'Leadership', NULL),
(2, 'Jane', 'Smith', 'Trainer', 'janesmith@example.com', '456 Elm St', '555-5678', 'Time Management', NULL),
(3, 'Alice', 'Johnson', 'Trainee', 'alicejohnson@example.com', '789 Pine St', '555-9101', NULL, 'Human Resources'),
(4, 'Bob', 'Brown', 'Trainee', 'bobbrown@example.com', '321 Maple St', '555-1122', NULL, 'Marketing'),
(5, 'Charlie', 'White', 'Trainer', 'charliewhite@example.com', '654 Cedar St', '555-3344', 'Conflict Resolution', NULL),
(6, 'Emma', 'Taylor', 'Trainee', 'emmataylor@example.com', '987 Oak St', '555-5566', NULL, 'Finance'),
(7, 'Liam', 'Harris', 'Trainer', 'liamharris@example.com', '741 Walnut St', '555-7788', 'Communication Skills', NULL),
(8, 'Sophia', 'Clark', 'Trainee', 'sophiaclark@example.com', '963 Birch St', '555-9900', NULL, 'Operations'),
(9, 'William', 'Moore', 'Trainer', 'williamm@example.com', '258 Spruce St', '555-2233', 'Project Management', NULL),
(10, 'Mia', 'Davis', 'Trainee', 'miadavis@example.com', '369 Cherry St', '555-4455', NULL, 'IT'),
(11, 'Ethan', 'Adams', 'Trainer', 'ethanadams@example.com', '147 Maplewood St', '555-6677', 'Team Building', NULL),
(12, 'Olivia', 'Hall', 'Trainee', 'oliviahall@example.com', '951 Willow St', '555-8899', NULL, 'Logistics'),
(13, 'Lucas', 'Allen', 'Trainer', 'lucasallen@example.com', '852 Sycamore St', '555-1010', 'Negotiation', NULL),
(14, 'Ava', 'Young', 'Trainee', 'avayoung@example.com', '753 Poplar St', '555-2020', NULL, 'Quality Assurance'),
(15, 'James', 'King', 'Trainer', 'jamesking@example.com', '159 Aspen St', '555-3030', 'Leadership', NULL);

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, DepartmentAddress)
VALUES
(1, 'HR', '1 Corporate Ave'),
(2, 'IT', '2 Tech Blvd'),
(3, 'Finance', '3 Money St'),
(4, 'Marketing', '4 Brand Rd'),
(5, 'Operations', '5 Logistics Ln'),
(6, 'Sales', '6 Revenue Ct'),
(7, 'Quality Assurance', '7 QA Ave'),
(8, 'Customer Support', '8 Helpdesk St'),
(9, 'Logistics', '9 Supply Way'),
(10, 'R&D', '10 Innovation Dr'),
(11, 'Training', '11 Education Blvd'),
(12, 'Procurement', '12 Purchase St'),
(13, 'Legal', '13 Justice Blvd'),
(14, 'Admin', '14 Admin Rd'),
(15, 'Engineering', '15 Build Ln');

INSERT INTO EMPLOYEE_DEPARTMENT (EmployeeDepartmentID, EmployeeID, DepartmentID, StartDate, EndDate, Salary)
VALUES
(1, 1, 11, '2020-01-01', NULL, 50000),
(2, 2, 11, '2020-02-01', NULL, 55000),
(3, 3, 1, '2021-01-01', NULL, 45000),
(4, 4, 4, '2021-03-01', NULL, 46000),
(5, 5, 11, '2020-05-01', NULL, 60000),
(6, 6, 3, '2021-06-01', NULL, 48000),
(7, 7, 11, '2020-07-01', NULL, 52000),
(8, 8, 5, '2021-09-01', NULL, 47000),
(9, 9, 11, '2020-10-01', NULL, 58000),
(10, 10, 2, '2021-12-01', NULL, 49000),
(11, 11, 11, '2020-01-15', NULL, 51000),
(12, 12, 9, '2021-03-15', NULL, 47000),
(13, 13, 11, '2020-04-15', NULL, 56000),
(14, 14, 7, '2021-06-15', NULL, 45000),
(15, 15, 11, '2020-08-15', NULL, 57000);

INSERT INTO COURSE (CourseID, Title, TotalHours, Description)
VALUES
(1, 'Leadership Training', 40, 'Develop leadership skills'),
(2, 'Time Management', 30, 'Manage your time effectively'),
(3, 'Conflict Resolution', 25, 'Handle workplace conflicts'),
(4, 'Finance Basics', 35, 'Understanding financial reports'),
(5, 'Marketing Essentials', 30, 'Learn the basics of marketing'),
(6, 'IT Security', 50, 'Secure your systems and data'),
(7, 'Project Management', 40, 'Plan and execute projects'),
(8, 'Team Building', 20, 'Enhance team collaboration'),
(9, 'Communication Skills', 30, 'Improve workplace communication'),
(10, 'Quality Assurance', 25, 'Ensure product and service quality'),
(11, 'Customer Support Basics', 30, 'Provide excellent customer service'),
(12, 'Logistics Management', 40, 'Manage supply chains effectively'),
(13, 'Negotiation Skills', 25, 'Learn effective negotiation'),
(14, 'Advanced IT Concepts', 60, 'In-depth IT skills'),
(15, 'Operations Optimization', 45, 'Streamline business operations');

INSERT INTO PREREQUISITE_COURSE (PrerequisiteID, CourseID, PrerequisiteCourseID)
VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 5, 1),
(5, 6, 4),
(6, 7, 3),
(7, 8, 2),
(8, 9, 1),
(9, 10, 6),
(10, 11, 8),
(11, 12, 5),
(12, 13, 9),
(13, 14, 6),
(14, 15, 7),
(15, 7, 5);

INSERT INTO OFFERING (OfferingID, CourseID, Name, Type, Hours, TeacherID)
VALUES
(1, 1, 'Leadership Advanced', 'Mandatory', 40, 1),
(2, 2, 'Time Management Pro', 'Optional', 30, 2),
(3, 3, 'Conflict Handling', 'Mandatory', 25, 5),
(4, 4, 'Finance 101', 'Optional', 35, 9),
(5, 5, 'Marketing Masterclass', 'Mandatory', 30, 13),
(6, 6, 'Cybersecurity Basics', 'Optional', 50, 9),
(7, 7, 'Project Planning', 'Mandatory', 40, 11),
(8, 8, 'Teamwork Bootcamp', 'Optional', 20, 11),
(9, 9, 'Effective Communication', 'Mandatory', 30, 7),
(10, 10, 'QA Excellence', 'Optional', 25, 15),
(11, 11, 'Customer Service Fundamentals', 'Mandatory', 30, 7),
(12, 12, 'Supply Chain Mastery', 'Mandatory', 40, 11),
(13, 13, 'Negotiation Workshop', 'Optional', 25, 13),
(14, 14, 'Advanced IT Concepts', 'Mandatory', 60, 2),
(15, 15, 'Optimized Operations', 'Optional', 45, 9);

INSERT INTO EMPLOYEE_TRAINEE (TraineeID, EmployeeID)
VALUES
(1, 3),
(2, 4),
(3, 6),
(4, 8),
(5, 10),
(6, 12),
(7, 14),
(8, 3),
(9, 4),
(10, 6),
(11, 8),
(12, 10),
(13, 12),
(14, 14),
(15, 3);

INSERT INTO TRAINEE_TEACHER (TraineeID, TeacherID)
VALUES
(1, 1),
(2, 2),
(3, 5),
(4, 9),
(5, 13),
(6, 9),
(7, 11),
(8, 7),
(9, 15),
(10, 11),
(11, 7),
(12, 11),
(13, 13),
(14, 2),
(15, 9);

INSERT INTO TRAINEE_COURSE (TraineeCourseID, TraineeID, CourseID, FinalGrade)
VALUES
(1, 1, 1, 85.5),
(2, 2, 2, 78.0),
(3, 3, 3, 92.0),
(4, 4, 4, 88.5),
(5, 5, 5, 76.0),
(6, 6, 6, 89.0),
(7, 7, 7, 84.5),
(8, 8, 8, 95.0),
(9, 9, 9, 80.0),
(10, 10, 10, 77.5),
(11, 11, 11, 82.0),
(12, 12, 12, 91.0),
(13, 13, 13, 87.0),
(14, 14, 14, 90.5),
(15, 15, 15, 93.0);

INSERT INTO TRAINEE_OFFERING_GRADE (TraineeID, OfferingID, Grade)
VALUES
(1, 1, 85.5),
(2, 2, 78.0),
(3, 3, 92.0),
(4, 4, 88.5),
(5, 5, 76.0),
(6, 6, 89.0),
(7, 7, 84.5),
(8, 8, 95.0),
(9, 9, 80.0),
(10, 10, 77.5),
(11, 11, 82.0),
(12, 12, 91.0),
(13, 13, 87.0),
(14, 14, 90.5),
(15, 15, 93.0);

