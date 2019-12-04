declare
    num1 Number;
    num2 Number;

begin

    num1 := 50;
    num2 := mod(num1,2);

    if num2 = 0
        then dbms_output.put_line(num1 || ' is even');
    else
        dbms_output.put_line(num1 || ' is odd');

    end if;

end;