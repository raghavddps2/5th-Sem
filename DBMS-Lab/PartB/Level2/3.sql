create table employee(
    ssn varchar(10) primary key,
    name varchar(10),
    salary int,
    dept_no int
);

insert into employee(ssn,name,salary,dept_no) values ('emp1001','Rakesh',10000,5);
insert into employee(ssn,name,salary,dept_no) values ('emp1002','Ramesh',20000,10);
insert into employee(ssn,name,salary,dept_no) values ('emp1003','Rupesh',30000,10);
insert into employee(ssn,name,salary,dept_no) values ('emp1004','Rishikesh',40000,11);
insert into employee(ssn,name,salary,dept_no) values ('emp1005','Rhitik',40000,10);



declare
    e_ssn employee.ssn%type;
    e_name employee.name%type;
    e_salary employee.salary%type;
    e_dept_no employee.dept_no%type;

    cursor c1 is
        select * from employee;

begin
    update employee 
        set employee.salary = 1.5*employee.salary
        where employee.dept_no = 5;
        dbms_output.put_line(sql%rowcount || 'rows affected');
    
    open c1;
        loop    
            fetch c1 into e_ssn,e_name,e_salary,e_dept_no;
                dbms_output.put_line(e_ssn || '     ' ||e_name ||'      ' || e_salary || '      ' || e_dept_no );
            exit when c1%notfound;
        end loop;
    close c1;
end;
/