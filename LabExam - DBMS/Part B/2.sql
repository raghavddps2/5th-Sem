-- Write a program that gives all employees in department 10 a 15% pay increase.
-- Display a message displaying how many employees were awarded the increase.

declare

    cursor c1 is select * from employee;
    emp c1%rowtype;
    v_count number;

begin

    dbms_output.put_line('Employee salary       Dept no');
    for emp in c1
        loop
            dbms_output.put_line(emp.salary || '        ' || emp.deptno);
        end loop;

    -- Main code
    update employee set salary = salary *  1.15 where deptno = 5;
    v_count := sql%rowcount;
    dbms_output.put_line('No of rows affected ' || v_count);
    -- Main code end;
    dbms_output.put_line('Employee salary       Dept no');
    for emp in c1
        loop
            dbms_output.put_line(emp.salary || '        ' || emp.deptno);
        end loop;

end;
/