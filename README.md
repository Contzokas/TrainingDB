The Tables
1.COURSE
COURSEID	Title	TotalHours	Description
1	Leadership Basics	40	Learn essential leadership skills.
2	Cybersecurity Fundamentals	45	Introduction to cybersecurity principles.
3	Advanced Financial Techniques	50	Advanced concepts in corporate finance.
4	Winning Clients	35	Techniques for client acquisition.
5	Digital Strategies	60	Mastering digital marketing techniques.
6	IT Security Basics	55	Fundamentals of IT security.
7	Optimized Supply Chains	70	Streamlining supply chain processes.
8	Python Data Tools	40	Using Python for data analysis.
9	Training Programs	30	Design and development of training programs.
10	Corporate Tax Laws	45	Basics of corporate tax compliance.
11	Legal Contracts	50	Drafting and managing contracts.
12	Clear Communication	55	Enhancing communication skills.
13	Conflict Resolution Skills	60	Managing and resolving conflicts.
14	Cloud Basics	65	Introduction to cloud computing.
15	Managing Projects	50	Project management essentials.








2.DEPARTMENT
DepartmentID	DepartmentName	DepartmentAddress
1	HR	123 Main St
2	IT	456 Elm St
3	Finance	789 Oak St
4	Marketing	101 Pine St
5	Sales	202 Maple St
6	R&D	303 Birch St
7	Customer Service	404 Cedar St
8	Logistics	505 Spruce St
9	Legal	606 Fir St
10	Procurement	707 Ash St
11	Production	808 Willow St
12	Quality Assurance	909 Poplar St
13	Maintenance	1010 Redwood St
14	Security	1111 Sequoia St
15	Administration	1212 Cypress St


























3.EMPLOYEE

EmployeeID	FirstName	LastName	JobTitle	Email	Address	PhoneNumber
1	John	Doe	Manager	john.doe@example.com	123 Main St	555-1234
2	Jane	Smith	Developer	jane.smith@example.com	456 Elm St	555-5678
3	Jim	Brown	Analyst	jim.brown@example.com	789 Oak St	555-8765
4	Jake	White	Designer	jake.white@example.com	101 Pine St	555-4321
5	Jill	Black	Sales Rep	jill.black@example.com	202 Maple St	555-6789
6	Jack	Green	Engineer	jack.green@example.com	303 Birch St	555-9876
7	Jenny	Blue	Support	jenny.blue@example.com	404 Cedar St	555-5432
8	Jerry	Red	Logistics Coordinator	jerry.red@example.com	505 Spruce St	555-6543
9	Jessica	Yellow	Lawyer	jessica.yellow@example.com	606 Fir St	555-7654
10	Jordan	Purple	Buyer	jordan.purple@example.com	707 Ash St	555-8765
11	Jasmine	Orange	Operator	jasmine.orange@example.com	808 Willow St	555-9876
12	James	Pink	Inspector	james.pink@example.com	909 Poplar St	555-0987
13	Janet	Gray	Technician	janet.gray@example.com	1010 Redwood St	555-1098
14	Jason	Silver	Guard	jason.silver@example.com	1111 Sequoia St	555-2109
15	Jared	Gold	Admin Assistant	jared.gold@example.com	1212 Cypress St	555-3210



4.EMPLOYEE_DEPARTMENT
EmployeeDepartmentID	EmployeeID	DepartmentID	StartDate	EndDate	Salary
1	1	1	2020-01-01	NULL	70000.00
2	2	5	2021-02-01	NULL	65000.00
3	3	5	2019-06-15	NULL	60000.00
4	4	3	2018-09-10	NULL	75000.00
5	5	2	2020-03-20	NULL	72000.00
6	6	5	2021-11-01	NULL	68000.00
7	7	4	2017-08-25	NULL	63000.00
8	8	5	2019-12-05	NULL	69000.00
9	9	6	2020-05-30	NULL	71000.00
10	10	5	2022-01-10	NULL	64000.00
11	11	5	2019-04-15	NULL	67000.00
12	12	7	2018-07-01	NULL	76000.00
13	13	9	2020-10-20	NULL	73000.00
14	14	8	2017-02-14	NULL	74000.00
15	15	5	2021-06-01	NULL	69000.00













5. EMPLOYEE_TEACHER
TeacherID	EmployeeID	SubjectTaught
1	1	Management
2	2	Computer Science
3	3	Finance
4	4	Design
5	5	Sales
6	6	Engineering
7	7	Customer Service
8	8	Logistics
9	9	Law
10	10	Procurement
11	11	Production
12	12	Quality Assurance
13	13	Maintenance
14	14	Security
15	15	Administration

6. EMPLOYEE_TRAINEE
TraineeID	EmployeeID	CourseID	Specialization	FinalGrade
1	2	1	Leadership	85.50
2	3	2	Cybersecurity	90.00
3	4	3	Finance	88.00
4	5	4	Marketing	92.50
5	6	5	Digital Marketing	89.00
6	7	6	IT Security	87.50
7	8	7	Supply Chain	91.00
8	9	8	Data Analysis	86.00
9	10	9	Training Programs	85.00
10	11	10	Tax Compliance	84.50
11	12	11	Legal Management	93.00
12	13	12	Communication Skills	94.50
13	14	13	Conflict Resolution	89.50
14	15	14	Cloud Computing	92.00
15	1	15	Project Management	90.50




7. OFFERING
OfferingID	CourseID	Name	Type	Hours	TeacherID
1	1	Leadership Basics - Spring 2023	Mandatory	40	1
2	2	Cybersecurity Fundamentals - Spring 2023	Mandatory	45	3
3	3	Advanced Financial Techniques - Summer 2023	Optional	50	13
4	4	Winning Clients - Summer 2023	Mandatory	35	8
5	5	Digital Strategies - Fall 2023	Optional	60	5
6	6	IT Security Basics - Fall 2023	Mandatory	55	3
7	7	Optimized Supply Chains - Winter 2023	Mandatory	70	14
8	8	Python Data Tools - Winter 2023	Optional	40	6
9	9	Training Programs - Spring 2024	Optional	30	10
10	10	Corporate Tax Laws - Spring 2024	Mandatory	45	9
11	11	Legal Contracts - Summer 2024	Optional	50	11
12	12	Clear Communication - Summer 2024	Mandatory	55	15
13	13	Conflict Resolution Skills - Fall 2024	Mandatory	60	7
14	14	Cloud Basics - Fall 2024	Optional	65	12
15	15	Managing Projects - Winter 2024	Mandatory	50	4


8. PREREQUISITE_COURSE
CourseID	PrerequisiteCourseID
2	1
3	1
4	1
5	1
6	2
7	6
8	2
9	8
10	9
11	10
12	1
13	12
14	6
15	1
15	3

9. TRAINEE_OFFERING_GRADE
TraineeOfferingGradeID	TraineeID	OfferingID	Grade
1	1	1	85.00
2	2	2	88.50
3	3	3	90.00
4	4	4	92.00
5	5	5	87.50
6	6	6	89.00
7	7	7	91.50
8	8	8	86.00
9	9	9	85.00
10	10	10	84.50
11	11	11	93.00
12	12	12	94.50
13	13	13	89.50
14	14	14	92.00
15	15	15	90.50
