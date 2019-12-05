--Executing the follwoing command simply gives us the Day, dy and Dy three formats.
select to_char(sysdate,'DAY Dy dy') as day from dual

-- If an existing trigger occurs, it even replcaes that.
create or replace trigger employee_trigger
-- Apply trigger before inserting or updating operation is performed. 
before insert or update
-- Table on which trigger to be applied.
on employee
-- We will do the same for every row entered.
for each row

declare 
    rec varchar(10);
begin
    select to_char(sysdate,'Dy') into rec from dual;
    if rec = 'Thu' or rec = 'Wed'
        then dbms_output.put_line('rec');
        raise_application_error(-20343,"Not allowed to enter");
    end if;
    
end;