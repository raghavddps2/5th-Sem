-- Write a PL/SQL program to print the first 8 fibonacci numbers
declare
    num1 Number;
    num2 Number;
    num3 Number;
    count1 Number := &num;

begin

    num1 := 0;
    num2 := 1;
    count1 := 20;
    dbms_output.put_line('The first ' || count1 || ' fibonacci numbers are: ');
    dbms_output.put_line(num1);
    dbms_output.put_line(num2);
    count1 := count1 - 2;
    while count1 != 0
        loop

            num3 := num1 + num2;
            dbms_output.put_line(num3);
            num1 := num2;
            num2 := num3;
            count1 := count1 - 1;

        end loop;

end;
/