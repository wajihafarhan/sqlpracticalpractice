--a. Create a new database named "EmployeeManagement".
create database EmployeeManagement;
--b. Create a table named "Employees" with the following columns:
--
--EmployeeID 
--FirstName 
--LastName 
--DepartmentID 
--Salary 
CREATE TABLE Employees(

EmployeeID INT PRIMARY KEY,
FirstName varchar (50),
LastName varchar (50),
DepartmentID int,
Salary decimal (10,2),
foreign key (DepartmentID) REFERENCES Department (DepartmentID)
);
Insert INTO Employees (EmployeeID,FirstName,LastName,DepartmentID,Salary)
VALUES
(1,'wajiha','nadeem',1,70000.00),
(2,'ayesha','khan',2,80000.00),
(3,'sonia','mirza',3,90000.00),
(4,'arham','ahmed',4,40000.00),
(5,'shibra','mosa',5,20000.00),
(6,'simra','saleem',6,90000.00),
(7,'rameen','ali',7,70000.00),
(8,'sara','shoaib',8,60000.00),
(9,'samreen','nadeem',9,50000.00),
(10,'komal','khan',10,80000.00),
(11,'aira','jaffer',11,90000.00),
(12,'shiza','farhan',12,30000.00),
(13,'anaya','khateeb',13,80000.00);


--create a table Department with column DeptID, dept_name
CREATE TABLE Department(
DepartmentID INT not null unique identity,
DepartmentName varchar(50)
);

INSERT INTO Department (DepartmentName)
VALUES
    ('HR'),
    ( 'Marketing Department'),
	( 'Administration'),    
	( 'Finance'),
    ( 'Sales'),
	('computerscience'),
	('physics'),
	('mathematics'),
	('english'),
	('chemistry'),
	('algebra'),
	('java'),
	('sql');

	
	--1. Create a new table named Project.
	CREATE TABLE Projects (
    ProjectID INT not null unique identity,
    ProjectName VARCHAR(50),
	EmployeesID int,
	StartDate int
	foreign key (EmployeesID) references Employees(EmployeeID)

);
INSERT INTO Projects (ProjectName ,EmployeesID , StartDate)
VALUES
    ( 'Database' , 3, 12-12-2023),
    ( 'Web Designing', 2 , 14-12-2023),
    ( 'Destop Application',1, 17-12-2023),
	( 'Database' , 4, 20-12-2023),
    ( 'Web Designing', 5 , 19-12-2023),
    ( 'Destop Application',6, 15-12-2023),
	( 'Database' , 7, 16-12-2023),
    ( 'Web Designing', 8 , 10-12-2023),
    ( 'Destop Application',9, 18-12-2023);
	select* from Department;
	select* from Employees;
	--b. Update the salary of all employees in the "Sales" department to increase by 10%.
	 UPDATE Employees SET Salary = Salary + (Salary * 10/100);
     update Employees set FirstName = 'Alyana', LastName = 'Fakhar' where DepartmentID =1;
	 --c. Delete the record of the employee with the lowest salary.
	 DELETE FROM Employees WHERE Salary BETWEEN 10000.00 AND 40000.00;
	 --a. Create a SQL Server login named "HR_Manager" with password "password".
       create login HR_Manager with password ='password';

	--b. Create a new user named "HR_Manager" with password "StrongPassword".

	create user HR_Manager for login HR_Manager;
	GO

	--c. Grant SELECT permission on the "Employees" table to the user "HR_Manager".

	grant select, update, insert on Employees to HR_Manager;
	--c. Revoke INSERT permission on the "Employees" table from the user "HR_Manager".
	--revoke
	revoke select, update  on Employees from HR_Manager;
	--a. create a trigger named 'employeeTrigger' on the current database for all 
	--DML Operations and store the information of the triggers 
    --in the separate table.
		-- creating audit table--

create table insert_trigger_details(
id int primary key identity,
auditInfo varchar(60)
);
create trigger employeeTrigger on Employees
after insert
as
begin
declare @id int, @name varchar(50)
select @id= EmployeeID,@name = FirstName from inserted
insert into insert_trigger_details values ('user with id ' + cast(@id as varchar(50)) + 'with name ' + @name + ' is inserted in the table')
end
select * from insert_trigger_details;
Insert INTO Employees (FirstName,LastName,DepartmentID,Salary)
VALUES
('sabika','nadeem',1,70000.00);

	
-- 2. Retrieve the details of employees whose salary is above 50000.
select * from Employees as Emp Join Department as Dept on Emp.DepartmentID = Dept.DepartmentID join Projects as pro on Emp.EmployeeID = Pro.EmployeesID where Emp.Salary < 50000;
--a. Retrieve all employees whose last name starts with "S".
select * from Employees as Emp Join Department as Dept on Emp.DepartmentID = Dept.DepartmentID;
 SELECT * FROM Employees as Emp WHERE Emp.FirstName LIKE 'S%';
 --b. Retrieve all employees whose first name contains the substring "an".
  SELECT * FROM Employees as Emp WHERE Emp.FirstName LIKE 'an%';
--c. Retrieve all employees whose last name ends with "son".
SELECT * FROM Employees as Emp WHERE Emp.FirstName LIKE 'son%';
--a. Create a table named "Students" with the following columns:

--StudentID
--FirstName
--LastName 
--Age 
--percentage
-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Percentage DECIMAL(5, 2)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseName VARCHAR(50) PRIMARY KEY,
    Instructor VARCHAR(50)
);

-- Create Enrollments table with foreign keys
CREATE TABLE Enrollments (
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseName) REFERENCES Courses(CourseName)
);

-- Insert 5 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Age, Percentage)
VALUES
    (1, 'John', 'Doe', 20, 85.5);
   

-- Insert at least 3 records into Courses table
INSERT INTO Courses (CourseName, Instructor)
VALUES
    ('Mathematics', 'Prof. Anderson'),
    ('Computer Science', 'Prof. Davis');
   

   


--c. Enroll one student in at least two courses.

INSERT INTO Enrollments (StudentID, CourseName)
VALUES
    (1, 'Mathematics'),
    (1, 'Computer Science');
--a. Retrieve the first name and last name of the student who has the highest GPA.
create view highest_GPA
as
select FirstName,LastName,Percentage from students where Percentage>80;
select * from highest_GPA;
--b. Retrieve the course name along with the number of enrolled students in each course.
--c. Retrieve the average GPA of students enrolled in the "Computer Science" course.

--EXTRA PRACTICE

create view cview
as
select FirstName,Percentages from students;
select * from students;
select * from cview;
create view cview1
as
select FirstName,LastName,Percentages from students where Percentages>80;
select * from cview3;
create view cview2
as
select * from cview where FirstName='wajiha';
create view cview3
as
select avg(Percentages) as AveragePercentagesof1view from students;
create table std();
select * from Enrollments;
drop table Enrollments;
drop table students;
drop table courses;
			
