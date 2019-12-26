-- Write a program that gives all employees in department 10 a 15% pay increase.
-- Display a message displaying how many employees were awarded the increase.

create table employee(
    ssn number NOT NULL,
    name varchar(10),
    deptno number,
    age number,
    address varchar(10),
    salary number NOT NULL,
    primary key(ssn)
);


create table emp_copy(
    ssn number NOT NULL,
    name varchar(10),
    deptno number,
    age number,
    address varchar(10),
    salary number NOT NULL,
    primary key(ssn)
);
insert into employee(ssn,name,deptno,age,address,salary) values(1,'rahul',1,34,'Bangalore',23000);
insert into employee(ssn,name,deptno,age,address,salary) values(2,'suresh',2,42,'Bangalore',24000);
insert into employee(ssn,name,deptno,age,address,salary) values(3,'rampesh',3,35,'Bangalore',25000);
insert into employee(ssn,name,deptno,age,address,salary) values(4,'coolesh',4,57,'Bangalore',26000);
insert into employee(ssn,name,deptno,age,address,salary) values(5,'lolesh',5,56,'Bangalore',27000);
insert into employee(ssn,name,deptno,age,address,salary) values(6,'bholesh',1,21,'Bangalore',28000);
insert into employee(ssn,name,deptno,age,address,salary) values(7,'dholesh',2,25,'Bangalore',29000);
insert into employee(ssn,name,deptno,age,address,salary) values(8,'kholesh',3,23,'Bangalore',32000);
insert into employee(ssn,name,deptno,age,address,salary) values(9,'faltuesh',4,34,'Bangalore',33000);
insert into employee(ssn,name,deptno,age,address,salary) values(10,'bbyesh',5,32,'Bangalore',34000);