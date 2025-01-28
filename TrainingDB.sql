CREATE DATABASE TrainingDB;
GO

USE TrainingDB;
GO

CREATE TABLE EMPLOYEE(
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(100),
    EmailAddress VARCHAR(100),
    HomeAddress VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(255)
);

CREATE TABLE EMPLOYEE_DEPARTMENT (
    EmployeeID INT,
    DepartmentID INT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Salary DECIMAL(18,2),
    PRIMARY KEY (EmployeeID, DepartmentID, StartDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE COURSE (
    CourseID INT PRIMARY KEY,
    CourseTitle VARCHAR(100) NOT NULL,
    TotalHours INT,
    CourseDescription VARCHAR(255)
);

CREATE TABLE OFFERING (
    OfferingID INT PRIMARY KEY,
    CourseID INT,
    OfferingName VARCHAR(100) NOT NULL,
    OfferingType VARCHAR(50),
    TotalHours INT,
    TeacherID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE EMPLOYEE_TEACHER (
    EmployeeID INT PRIMARY KEY,
    SubjectSpecialization VARCHAR(100),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE EMPLOYEE_TRAINEE (
    EmployeeID INT PRIMARY KEY,
    AreaOfSpecialization VARCHAR(100),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE TRAINEE_COURSE (
    TraineeID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    FinalGrade VARCHAR(10),
    PRIMARY KEY (TraineeID, CourseID),
    FOREIGN KEY (TraineeID) REFERENCES EmployeeTrainee(EmployeeID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE PREREQUISITE_COURSE (
    CourseID INT,
    PrerequisiteCourseID INT,
    PRIMARY KEY (CourseID, PrerequisiteCourseID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Course(CourseID)
);

INSERT INTO EMPLOYEE (EmployeeID, FullName, JobTitle, EmailAddress, HomeAddress, PhoneNumber)
VALUES
(1, 'John Doe', 'Software Engineer', 'john.doe@example.com', '123 Main St', '1234567890'),
(2, 'Jane Smith', 'Data Analyst', 'jane.smith@example.com', '456 Oak St', '1234567891'),
(3, 'Bob Johnson', 'HR Manager', 'bob.johnson@example.com', '789 Pine St', '1234567892'),
(4, 'Alice Brown', 'Project Manager', 'alice.brown@example.com', '321 Maple St', '1234567893'),
(5, 'Charlie Davis', 'Business Analyst', 'charlie.davis@example.com', '654 Cedar St', '1234567894'),
(6, 'Emily Evans', 'Marketing Specialist', 'emily.evans@example.com', '987 Elm St', '1234567895'),
(7, 'David Wilson', 'UI/UX Designer', 'david.wilson@example.com', '159 Willow St', '1234567896'),
(8, 'Sophia Moore', 'Quality Assurance', 'sophia.moore@example.com', '753 Birch St', '1234567897'),
(9, 'James Taylor', 'Software Developer', 'james.taylor@example.com', '258 Spruce St', '1234567898'),
(10, 'Olivia White', 'Technical Writer', 'olivia.white@example.com', '369 Aspen St', '1234567899'),
(11, 'Liam Harris', 'Network Engineer', 'liam.harris@example.com', '789 Redwood St', '1234567800'),
(12, 'Emma Clark', 'Cloud Architect', 'emma.clark@example.com', '147 Cypress St', '1234567801'),
(13, 'Noah Walker', 'Cybersecurity Specialist', 'noah.walker@example.com', '258 Magnolia St', '1234567802'),
(14, 'Mia Hill', 'DevOps Engineer', 'mia.hill@example.com', '369 Cherry St', '1234567803'),
(15, 'Ethan Allen', 'Database Administrator', 'ethan.allen@example.com', '951 Walnut St', '1234567804');

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, Location)
VALUES
(1, 'IT Department', 'Building A'),
(2, 'HR Department', 'Building B'),
(3, 'Finance Department', 'Building C'),
(4, 'Marketing Department', 'Building D'),
(5, 'Sales Department', 'Building E'),
(6, 'Operations Department', 'Building F'),
(7, 'Support Department', 'Building G'),
(8, 'R&D Department', 'Building H'),
(9, 'Training Department', 'Building I'),
(10, 'Admin Department', 'Building J'),
(11, 'Procurement Department', 'Building K'),
(12, 'Compliance Department', 'Building L'),
(13, 'Legal Department', 'Building M'),
(14, 'Public Relations', 'Building N'),
(15, 'Logistics Department', 'Building O');

INSERT INTO EMPLOYEE_DEPARTMENT (EmployeeID, DepartmentID, StartDate, EndDate, Salary)
VALUES
(1, 1, '2020-01-01', NULL, 50000),
(2, 1, '2021-02-15', NULL, 52000),
(3, 2, '2019-03-10', NULL, 60000),
(4, 1, '2020-05-20', NULL, 70000),
(5, 3, '2018-04-05', NULL, 65000),
(6, 4, '2022-06-10', NULL, 48000),
(7, 5, '2020-08-25', NULL, 55000),
(8, 6, '2021-09-30', NULL, 53000),
(9, 7, '2017-11-15', NULL, 62000),
(10, 8, '2021-12-01', NULL, 58000),
(11, 9, '2023-01-01', NULL, 60000),
(12, 10, '2016-02-15', NULL, 65000),
(13, 11, '2020-03-10', NULL, 70000),
(14, 12, '2019-05-20', NULL, 72000),
(15, 13, '2022-06-10', NULL, 64000);

INSERT INTO COURSE (CourseID, CourseTitle, TotalHours, CourseDescription)
VALUES
(1, 'Data Science 101', 40, 'Introduction to data science'),
(2, 'Advanced Python', 60, 'In-depth Python programming'),
(3, 'Cybersecurity Basics', 50, 'Fundamentals of cybersecurity'),
(4, 'Cloud Computing', 45, 'Introduction to cloud platforms'),
(5, 'DevOps Practices', 55, 'Best practices in DevOps'),
(6, 'UI/UX Design', 30, 'Basics of user interface and experience design'),
(7, 'Digital Marketing', 35, 'Marketing in the digital age'),
(8, 'Project Management', 40, 'Managing projects effectively'),
(9, 'SQL Mastery', 50, 'Advanced SQL and database concepts'),
(10, 'AI and Machine Learning', 60, 'Introduction to AI and ML'),
(11, 'Business Analytics', 50, 'Data analytics for business'),
(12, 'Leadership Skills', 30, 'Improving leadership skills'),
(13, 'Negotiation Techniques', 25, 'Effective negotiation strategies'),
(14, 'Public Speaking', 20, 'Mastering the art of speaking'),
(15, 'Time Management', 15, 'Enhancing productivity');

INSERT INTO OFFERING (OfferingID, CourseID, OfferingName, OfferingType, TotalHours, TeacherID)
VALUES
(1, 1, 'Data Science Bootcamp', 'Online', 40, 1),
(2, 2, 'Python Advanced Workshop', 'In-person', 60, 2),
(3, 3, 'Cybersecurity for Beginners', 'Online', 50, 3),
(4, 4, 'Cloud Essentials', 'Hybrid', 45, 4),
(5, 5, 'DevOps Masterclass', 'Online', 55, 5),
(6, 6, 'UI/UX Fundamentals', 'In-person', 30, 6),
(7, 7, 'Digital Marketing Basics', 'Online', 35, 7),
(8, 8, 'Agile Project Management', 'Hybrid', 40, 8),
(9, 9, 'SQL for Professionals', 'Online', 50, 9),
(10, 10, 'AI and ML Foundations', 'In-person', 60, 10),
(11, 11, 'Business Analytics Pro', 'Online', 50, 11),
(12, 12, 'Leadership Essentials', 'Hybrid', 30, 12),
(13, 13, 'Negotiation Mastery', 'In-person', 25, 13),
(14, 14, 'Public Speaking Seminar', 'Online', 20, 14),
(15, 15, 'Productivity Hacks', 'Hybrid', 15, 15);

INSERT INTO EMPLOYEE_TEACHER (EmployeeID, SubjectSpecialization)
VALUES
(1, 'Data Science'),
(2, 'Python Programming'),
(3, 'Cybersecurity'),
(4, 'Cloud Computing'),
(5, 'DevOps'),
(6, 'UI/UX Design'),
(7, 'Digital Marketing'),
(8, 'Project Management'),
(9, 'Database Management'),
(10, 'AI and Machine Learning'),
(11, 'Business Analytics'),
(12, 'Leadership Skills'),
(13, 'Negotiation Strategies'),
(14, 'Public Speaking'),
(15, 'Time Management');

INSERT INTO EMPLOYEE_TRAINEE (EmployeeID, AreaOfSpecialization)
VALUES
(1, 'Machine Learning'),
(2, 'Data Analysis'),
(3, 'Network Security'),
(4, 'Cloud Engineering'),
(5, 'Software Development'),
(6, 'UX Research'),
(7, 'Content Marketing'),
(8, 'Agile Practices'),
(9, 'Database Optimization'),
(10, 'Artificial Intelligence'),
(11, 'Business Intelligence'),
(12, 'Organizational Leadership'),
(13, 'Conflict Resolution'),
(14, 'Presentation Skills'),
(15, 'Efficiency Improvement');

INSERT INTO TRAINEE_COURSE (TraineeID, CourseID, EnrollmentDate, FinalGrade)
VALUES
(1, 1, '2024-01-10', 'A'),
(2, 2, '2024-01-15', 'B'),
(3, 3, '2024-01-20', 'A'),
(4, 4, '2024-01-25', 'A-'),
(5, 5, '2024-02-01', 'B+'),
(6, 6, '2024-02-05', 'A'),
(7, 7, '2024-02-10', 'B'),
(8, 8, '2024-02-15', 'A'),
(9, 9, '2024-02-20', 'A+'),
(10, 10, '2024-02-25', 'A'),
(11, 11, '2024-03-01', 'B'),
(12, 12, '2024-03-05', 'B+'),
(13, 13, '2024-03-10', 'A'),
(14, 14, '2024-03-15', 'A-'),
(15, 15, '2024-03-20', 'A+');

INSERT INTO PREREQUISITE_COURSE (CourseID, PrerequisiteCourseID)
VALUES
(2, 1),
(3, 2),
(4, 1),
(5, 3),
(6, 4),
(7, 2),
(8, 5),
(9, 1),
(10, 3),
(11, 7),
(12, 8),
(13, 9),
(14, 10),
(15, 11),
(1, 12);
