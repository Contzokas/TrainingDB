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
    

    CREATE TABLE EMPLOYEE_TEACHER (
        TeacherID INT PRIMARY KEY,
        EmployeeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
        SubjectTaught VARCHAR(100), 

    );

    CREATE TABLE COURSE (
        CourseID INT PRIMARY KEY,
        Title VARCHAR(100) NOT NULL,
        TotalHours INT NOT NULL,
        Description VARCHAR(500)
    );

    CREATE TABLE PREREQUISITE_COURSE (
        CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
        PrerequisiteCourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
        PRIMARY KEY (CourseID, PrerequisiteCourseID)
    );

    CREATE TABLE OFFERING (
        OfferingID INT PRIMARY KEY,
        CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
        Name VARCHAR(100) NOT NULL,
        Type VARCHAR(20) CHECK (Type IN ('Mandatory', 'Optional')),
        Hours INT NOT NULL,
        TeacherID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE_TEACHER(TeacherID)
    );

    ALTER TABLE OFFERING
    ADD CONSTRAINT Unique_Offering_Teacher UNIQUE (OfferingID, TeacherID);

    CREATE TABLE EMPLOYEE_TRAINEE (
        TraineeID INT PRIMARY KEY,
        EmployeeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
        CourseID INT NOT NULL FOREIGN KEY REFERENCES COURSE(CourseID),
        Specialization VARCHAR(100) ,
        FinalGrade DECIMAL(5, 2)
    );

    CREATE TABLE TRAINEE_OFFERING_GRADE (
        TraineeOfferingGradeID INT PRIMARY KEY,
        TraineeID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEE_TRAINEE(TraineeID),
        OfferingID INT NOT NULL FOREIGN KEY REFERENCES OFFERING(OfferingID),
        Grade DECIMAL(5, 2)
    );

    -- Insert records into DEPARTMENT table
    INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, DepartmentAddress) VALUES
    (1, 'HR', '123 Main St'),
    (2, 'IT', '456 Elm St'),
    (3, 'Finance', '789 Oak St'),
    (4, 'Marketing', '101 Pine St'),
    (5, 'Sales', '202 Maple St'),
    (6, 'R&D', '303 Birch St'),
    (7, 'Customer Service', '404 Cedar St'),
    (8, 'Logistics', '505 Spruce St'),
    (9, 'Legal', '606 Fir St'),
    (10, 'Procurement', '707 Ash St'),
    (11, 'Production', '808 Willow St'),
    (12, 'Quality Assurance', '909 Poplar St'),
    (13, 'Maintenance', '1010 Redwood St'),
    (14, 'Security', '1111 Sequoia St'),
    (15, 'Administration', '1212 Cypress St');

    -- Insert records into EMPLOYEE table
    INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, JobTitle, Email, Address, PhoneNumber) VALUES
    (1, 'John', 'Doe', 'Manager', 'john.doe@example.com', '123 Main St', '555-1234'),
    (2, 'Jane', 'Smith', 'Developer', 'jane.smith@example.com', '456 Elm St', '555-5678'),
    (3, 'Jim', 'Brown', 'Analyst', 'jim.brown@example.com', '789 Oak St', '555-8765'),
    (4, 'Jake', 'White', 'Designer', 'jake.white@example.com', '101 Pine St', '555-4321'),
    (5, 'Jill', 'Black', 'Sales Rep', 'jill.black@example.com', '202 Maple St', '555-6789'),
    (6, 'Jack', 'Green', 'Engineer', 'jack.green@example.com', '303 Birch St', '555-9876'),
    (7, 'Jenny', 'Blue', 'Support', 'jenny.blue@example.com', '404 Cedar St', '555-5432'),
    (8, 'Jerry', 'Red', 'Logistics Coordinator', 'jerry.red@example.com', '505 Spruce St', '555-6543'),
    (9, 'Jessica', 'Yellow', 'Lawyer', 'jessica.yellow@example.com', '606 Fir St', '555-7654'),
    (10, 'Jordan', 'Purple', 'Buyer', 'jordan.purple@example.com', '707 Ash St', '555-8765'),
    (11, 'Jasmine', 'Orange', 'Operator', 'jasmine.orange@example.com', '808 Willow St', '555-9876'),
    (12, 'James', 'Pink', 'Inspector', 'james.pink@example.com', '909 Poplar St', '555-0987'),
    (13, 'Janet', 'Gray', 'Technician', 'janet.gray@example.com', '1010 Redwood St', '555-1098'),
    (14, 'Jason', 'Silver', 'Guard', 'jason.silver@example.com', '1111 Sequoia St', '555-2109'),
    (15, 'Jared', 'Gold', 'Admin Assistant', 'jared.gold@example.com', '1212 Cypress St', '555-3210');

    -- Insert records into EMPLOYEE_DEPARTMENT table
    INSERT INTO EMPLOYEE_DEPARTMENT (EmployeeDepartmentID, EmployeeID, DepartmentID, StartDate, EndDate) VALUES
    (1, 1, 1, '2020-01-01', NULL),
    (2, 2, 2, '2019-02-01', NULL),
    (3, 3, 3, '2018-03-01', NULL),
    (4, 4, 4, '2017-04-01', NULL),
    (5, 5, 5, '2016-05-01', NULL),
    (6, 6, 6, '2015-06-01', NULL),
    (7, 7, 7, '2014-07-01', NULL),
    (8, 8, 8, '2013-08-01', NULL),
    (9, 9, 9, '2012-09-01', NULL),
    (10, 10, 10, '2011-10-01', NULL),
    (11, 11, 11, '2010-11-01', NULL),
    (12, 12, 12, '2009-12-01', NULL),
    (13, 13, 13, '2008-01-01', NULL),
    (14, 14, 14, '2007-02-01', NULL),
    (15, 15, 15, '2006-03-01', NULL);

    -- Insert records into EMPLOYEE_TRAINEE table
    INSERT INTO EMPLOYEE_TRAINEE (TraineeID, EmployeeID, CourseID, Specialization, FinalGrade) VALUES
    (1, 1, 1, 'Business Administration', 85.5),
    (2, 2, 2, 'Software Engineering', 90.0),
    (3, 3, 3, 'Financial Analysis', 88.0),
    (4, 4, 4, 'Graphic Design', 92.5),
    (5, 5, 5, 'Sales Management', 87.0),
    (6, 6, 6, 'Mechanical Engineering', 89.5),
    (7, 7, 7, 'Customer Support', 91.0),
    (8, 8, 8, 'Supply Chain Management', 86.0),
    (9, 9, 9, 'Corporate Law', 93.0),
    (10, 10, 10, 'Purchasing', 84.5),
    (11, 11, 11, 'Manufacturing', 95.0),
    (12, 12, 12, 'Quality Control', 83.0),
    (13, 13, 13, 'Technical Support', 94.5),
    (14, 14, 14, 'Security Management', 82.0),
    (15, 15, 15, 'Office Management', 96.0);

    -- Insert records into TRAINEE_OFFERING_GRADE table
    INSERT INTO TRAINEE_OFFERING_GRADE (TraineeOfferingGradeID, TraineeID, OfferingID, Grade) VALUES
    (1, 1, 1, 85.5),
    (2, 2, 2, 90.0),
    (3, 3, 3, 88.0),
    (4, 4, 4, 92.5),
    (5, 5, 5, 87.0),
    (6, 6, 6, 89.5),
    (7, 7, 7, 91.0),
    (8, 8, 8, 86.0),
    (9, 9, 9, 93.0),
    (10, 10, 10, 84.5),
    (11, 11, 11, 95.0),
    (12, 12, 12, 83.0),
    (13, 13, 13, 94.5),
    (14, 14, 14, 82.0),
    (15, 15, 15, 96.0);

    -- Insert records into EMPLOYEE_TEACHER table
    INSERT INTO EMPLOYEE_TEACHER (TeacherID, EmployeeID, SubjectTaught) VALUES
    (1, 1, 'Management'),
    (2, 2, 'Computer Science'),
    (3, 3, 'Finance'),
    (4, 4, 'Design'),
    (5, 5, 'Sales'),
    (6, 6, 'Engineering'),
    (7, 7, 'Customer Service'),
    (8, 8, 'Logistics'),
    (9, 9, 'Law'),
    (10, 10, 'Procurement'),
    (11, 11, 'Production'),
    (12, 12, 'Quality Assurance'),
    (13, 13, 'Maintenance'),
    (14, 14, 'Security'),
    (15, 15, 'Administration');

-- Insert records into COURSE table
INSERT INTO COURSE (CourseID, Title, Description) VALUES
(1, 'Management 101', 'Introduction to Management'),
(2, 'Software Engineering', 'Principles of Software Engineering'),
(3, 'Financial Analysis', 'Basics of Financial Analysis'),
(4, 'Graphic Design', 'Fundamentals of Graphic Design'),
(5, 'Sales Management', 'Strategies for Sales Management'),
(6, 'Mechanical Engineering', 'Introduction to Mechanical Engineering'),
(7, 'Customer Support', 'Effective Customer Support Techniques'),
(8, 'Supply Chain Management', 'Logistics and Supply Chain Management'),
(9, 'Corporate Law', 'Overview of Corporate Law'),
(10, 'Purchasing', 'Principles of Purchasing'),
(11, 'Manufacturing', 'Basics of Manufacturing Processes'),
(12, 'Quality Control', 'Quality Control Techniques'),
(13, 'Technical Support', 'Technical Support Fundamentals'),
(14, 'Security Management', 'Principles of Security Management'),
(15, 'Office Management', 'Effective Office Management');
