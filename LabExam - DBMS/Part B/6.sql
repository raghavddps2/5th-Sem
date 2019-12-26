create or replace procedure factorial(num1 in number,fact out number) is
    begin

        fact := 1;
        for i in reverse 1..num1
            loop

                fact := factt * i;

            end loop;
    end;

declare

    num1 number := &num;
    fact number;


begin

    num1 := 5;
    factorial(num1,fact);
    dbms_output.put_line('The factorial of ' || num1 || ' is ' || fact);
end;