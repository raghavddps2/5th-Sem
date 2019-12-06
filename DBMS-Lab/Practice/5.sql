declare
    num1 number;
    num2 number;
    count1 number;
    num3 number;
begin

    num1 := 0;
    num2 := 1;

    count1 := 10;
    count1 := count1 - 2;
    dbms_output.put_line('The fibonacci series is as follows...');
    dbms_output.put_line(num1);
    dbms_output.put_line(num2);
    while count1 != 0
        loop

            num3 := num1 + num2;
            num1 := num2;
            num2 := num3;
            dbms_output.put_line(num3);
            count1 := count1 -1;
        end loop;
end;
/