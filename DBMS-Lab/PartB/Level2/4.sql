
create table employee_copy1(
    ssn varchar(10) primary key,
    name varchar(10),
    salary int,
    dept_no int
);
declare
    e_ssn employee.ssn%type;
    e_name employee.name%type;
    e_salary employee.salary%type;
    e_dept_no employee.dept_no%type;

    cursor c1 is
        select ssn,name,salary,dept_no from employee;

begin

    open c1;
        loop
            fetch c1 into e_ssn,e_name,e_salary,e_dept_no;
                -- inserting into new table
                exit when c1%notfound;
            insert into employee_copy values(e_ssn,e_name,e_salary,e_dept_no);
            
        end loop;
    close c1;
end;
