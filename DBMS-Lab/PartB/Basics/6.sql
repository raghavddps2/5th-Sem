declare
    num1 number;
begin
    num1 := 0;
    if num1 > 0
        then dbms_output.put_line('Number is positive');
    elsif num1 <0
        then dbms_output.put_line('Number is negative');
    else 
        dbms_output.put_line('Number is zero');
    end if;
end;
/