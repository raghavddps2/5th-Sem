
declare
    cursor c1 is select * from employee;
    emp c1%rowtype;

    cursor c2 is select * from emp_copy;
    emp_cpy c2%rowtype;

begin

    for emp in c2
        loop

            insert into emp_copy(ssn,name,deptno,age,address,salary) values(emp.ssn,emp.name,emp.deptno,emp.age,emp.address,emp.salary);
        
        end loop;

    dbms_output.put_line('SSN       Name        Age      DeptNo     address     salary');
    for emp_cpy in c2 
        loop
            dbms_output.put_line(emp_cpy.ssn || '       ' || emp_copy.name|| '       ' || emp_cpy.age|| '       ' ||emp_cpy.deptno|| '       ' ||emp.address|| '       ' ||emp.salary);
        end loop;
end;
/