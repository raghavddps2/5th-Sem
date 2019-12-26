-- Consider the relations
-- EMPLOYEE (SSN, Name, DeptNo)
-- ASSIGNED_TO (USN , ProjectNo)
-- PROJECT (ProjectNo, ProjectArea)
--  Create the above tables, insert suitable tuples and perform the following operations
-- in Oracle SQL
-- a. Obtain the SSN of employees assigned to database projects.
-- b. Find the number of employees working in each department
-- c. Update the ProjectNo of Employee bearing SSN=1 to ProjectNo=20

create table EMPLOYEE(
    ssn varchar(10) NOT NULL,
    name varchar(10),
    deptNo Number,
    primary key (ssn)
);

create table project(

    projectNo Number NOT NULL,
    projectArea varchar(10),
    primary key(projectNo)
);

create table assigned_to(

    usn varchar(10) NOT NULL,
    projectNo Number NOT NULL,
    foreign key(usn) references EMPLOYEE(ssn),
    foreign key(projectNo) references project(projectNo)
);


insert into EMPLOYEE(ssn,name,deptNo) values('EMP1','Ram',3);
insert into EMPLOYEE(ssn,name,deptNo) values('EMP2','Ramu',3);
insert into EMPLOYEE(ssn,name,deptNo) values('EMP3','Ramesh',1);
insert into EMPLOYEE(ssn,name,deptNo) values('EMP4','Shyam',2);
insert into EMPLOYEE(ssn,name,deptNo) values('EMP5','Mohan',1);

insert into project(projectNo,projectArea) values(1,'Databases');
insert into project(projectNo,projectArea) values(2,'Android');
insert into project(projectNo,projectArea) values(3,'Network');
insert into project(projectNo,projectArea) values(4,'Databases');
insert into project(projectNo,projectArea) values(5,'MachineL');

insert into assigned_to(usn,projectNo) values('EMP1',1);
insert into assigned_to(usn,projectNo) values('EMP2',2);
insert into assigned_to(usn,projectNo) values('EMP3',2);
insert into assigned_to(usn,projectNo) values('EMP4',3);
insert into assigned_to(usn,projectNo) values('EMP5',4);


-- Query1: Obtain the SSN of employees assigned to database projects
select ssn from EMPLOYEE where ssn IN (select usn from assigned_to where projectNo IN (select projectNo from project 
    where projectArea = 'Databases'))

select ssn from assigned_to where projectNo IN (select projectNo from project where projectArea = 'Databases')

-- Query2 : Find the number of employees working in each department
select deptNo,count(ssn) from EMPLOYEE group by deptNo


-- Query3 : Update the ProjectNo of Employee bearing SSN=1 to ProjectNo=20
update assigned_to set projectNo = 3 where usn = 'EMP2';

