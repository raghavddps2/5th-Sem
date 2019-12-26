create or replace trigger trigger_emp
before insert or update
on employee
for each row
declare
    rec varchar(3);
begin
    select to_char(sysdate,'Dy') into rec from dual;
    dbms_output.put_line(rec);
    if rec = 'Thu' or rec = 'Wed' then
        dbms_output.put_line('Inside if block');
        raise_application_error(-23043,'Not allowed to enter');
    end if;
end;

set serveroutput on;

