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

EmployeeID Int not null unique identity,
FirstName varchar (50),
LastName varchar (50),
DepartmentID int,
Salary decimal (10,2),
foreign key (DepartmentID) REFERENCES Department (DepartmentID)
);
Insert INTO Employees (FirstName,LastName,DepartmentID,Salary)
VALUES
('wajiha','nadeem',1,70000.00),
('ayesha','khan',2,80000.00),
('sonia','mirza',3,90000.00),
('arham','ahmed',4,40000.00),
('shibra','mosa',5,20000.00),
('simra','saleem',6,90000.00),
('rameen','ali',7,70000.00),
('sara','shoaib',8,60000.00),
('samreen','nadeem',9,50000.00),
('komal','khan',10,80000.00),
('aira','jaffer',11,90000.00),
('shiza','farhan',12,30000.00),
('anaya','khateeb',13,80000.00);


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
ALTER trigger employeeTrigger on Employees
after insert
as
begin
declare @id int, @name varchar(50)
select @id= EmployeeID,@name = FirstName from inserted
insert into insert_trigger_details values ('user with id ' + cast(@id as varchar(50)) + 'with name ' + @name + 'is inserted in the table')
end
select * from insert_trigger_details;
Insert INTO Employees (FirstName,LastName,DepartmentID,Salary)
VALUES
('wajiha','nadeem',1,70000.00);
--a. Retrieve all employees whose last name starts with "S".

SELECT *
FROM Employees
WHERE FirstName LIKE '%S'