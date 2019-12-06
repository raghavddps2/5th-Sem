create or replace trigger trigger_1
before insert or update
on employee
for each row
declare 
    rec varchar(30);
begin 
    select to_char(sysdate,'Dy') into rec from dual;
    if rec = 'Tue' or rec = 'Wed'
        then dbms_output.put_line(rec);
        raise_application_error(-23043,'Cant do the same');
    end if;
end;

-- Now, when you try to insert, you can't!

insert into employee(ssn,name,salary,dept_no) values ('emp1004','Rishikesh',40000,11);
-- THe above statement will give the required error.