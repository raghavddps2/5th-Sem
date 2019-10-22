
/*
CREATE TABLE employee
(
	SSN varchar(10) PRIMARY KEY,
	Name varchar(40) not null,
	DeptNo int(5) not null
);

CREATE TABLE project
(
	ProjectNo int(5) PRIMARY KEY,
	ProjectArea varchar(255)
);

CREATE TABLE assigned_to
(
	SSN varchar(10) not null,
	ProjectNo int(5) not null,
	FOREIGN KEY (SSN) REFERENCES employee(SSN) ON DELETE CASCADE,
	FOREIGN KEY (ProjectNo) REFERENCES project(ProjectNo)
	ON DELETE CASCADE
);


INSERT INTO employee (SSN, Name, DeptNo) VALUES ('IS11','Affan', 1);
INSERT INTO project (ProjectNo, ProjectArea) VALUES (124,'Adhoc Networks'),(125,'Databases'),(126,'OOPS'),(127,'Graphics');

INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS01',123);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS02',123);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS03',124);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS04',124);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS05',125);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS06',125);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS07',126);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS08',126);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS09',127);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS10',127);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS11',123);
INSERT INTO assigned_to (SSN, ProjectNo) VALUES ('IS03',123), ('IS04',123), ('IS05',123), ('IS06',123), ('IS07',123), ('IS08',123), ('IS09',123), ('IS10',123);

CSV Data Dump for employee table:
IS02,Aditya,1
IS03,Ayush,2
IS04,Apeksha,4
IS05,Anusha,3
IS06,Anisha,5
IS07,Amisha,2
IS08,Akshatha,1
IS09,Amrutha,3
IS10,Amritha,4
IS11,Arpitha,5

*/

/*Queries

Create the above tables, insert suitable tuples and perform the following operations in SQL: */
--a.Obtain the SSN of employees assigned to database projects.
SELECT SSN from assigned_to where ProjectNo = (Select ProjectNo from project where ProjectArea like 'database%');

--b.Find the number of employees working in each department
select deptNo,count(SSN) as'employees' from employee group by deptNo;

--c.Update the ProjectNo of Employee bearing SSN=IS11 to ProjectNo=126
update assigned_to set ProjectNo = 126 where SSN = 'IS11';

--d.Display all the employee names assigned to database projects
Select name from employee where SSN in (SELECT SSN from assigned_to where ProjectNo = (Select ProjectNo from project where ProjectArea like 'database%')); 
--e.Display the number of employees working in each project
select assigned_to.ProjectNo,ProjectArea,count(SSN) as'employees' from assigned_to,project where project.ProjectNo = assigned_to.ProjectNo group by assigned_to.ProjectNo;

--f. List project nos. of projects, which involve all employees.
select projectNo from assigned_to group by projectNo having count(ssn) = (select count(*) from employee);


--g. List project area which has max employees working.
select ProjectArea,max(employees) as employees from (select assigned_to.ProjectNo,ProjectArea,count(SSN) as'employees' from assigned_to,project where project.ProjectNo = assigned_to.ProjectNo group by assigned_to.ProjectNo) result;

--h. Find department which has least no of employees
select DeptNo, min(employees) as employees from (select DeptNo,count(ssn) as employees from employee group by deptno order by employees asc) result;

--i. Find project nos of projects who's names start with 'D'
select ProjectNo from project where ProjectArea like 'D%' or ProjectArea like 'd%';
--j. list employees and project areas that they are working on
select name, projectArea from employee,assigned_to,project where employee.ssn = assigned_to.ssn and assigned_to.projectNo = project.ProjectNo order by employee.ssn;
                                                                                                                                                                           
--k. Delete an employee from employee table and demonstrate the cascading effect on other tables.
delete from employee where SSN = 'IS11';
--l. Retrieve the names of employees working on both database and testings projects.
Select name from employee where SSN in (SELECT SSN from assigned_to where ProjectNo in (Select ProjectNo from project where ProjectArea like 'Database%')) and SSN in (SELECT SSN from assigned_to where ProjectNo in (Select ProjectNo from project where ProjectArea like 'Testing%'));
--m. Retrieve the names of employees working only on database projects and not on any other project.
Select name from employee where SSN in (select f.SSN from (SELECT SSN from assigned_to where ProjectNo = (Select ProjectNo from project where ProjectArea like 'Database%')) g, (select SSN from assigned_to group by SSN having count(projectNo) = 1)f where g.ssn = f.ssn);
--n. Retrieve the employees working on database projects, and not testing projects.
Select name from employee where SSN in (SELECT SSN from assigned_to where ProjectNo in (Select ProjectNo from project where ProjectArea like 'Database%')) and SSN not in (SELECT SSN from assigned_to where ProjectNo in (Select ProjectNo from project where ProjectArea like 'Testing%'));


