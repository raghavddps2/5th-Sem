create table employee(
    name varchar(10),
    ssn number primary key,
    dept varchar(10),
    design varchar(10)
);
insert into employee values('Raghav',1,'ISE','Student');
insert into employee values('Raghav',2,'ISE','Student');
insert into employee values('Raghav',3,'ISE','Student');
insert into employee values('Raghav',4,'ISE','Student');
insert into employee values('Raghav',5,'ISE','Student');
insert into employee values('Raghav',6,'ISE','Student');


create table employee1(
    name varchar(10),
    ssn number primary key,
    dept varchar(10),
    design varchar(10)
);


declare
    name employee.name%type;
    ssn employee.ssn%type;
    dept employee.dept%type;
    design employee.design%type;

    cursor c1 is
        select name,ssn,dept,design from employee;
begin

    open c1;
        loop
            fetch c1 into name,ssn,dept,design;
            exit when c1%notfound;
            insert into employee1 values(name,ssn,dept,design);
        end loop;
    close c1;
    dbms_output.put_line('Successfully copied into a new table');
   
end;
/
 select * from employee1;