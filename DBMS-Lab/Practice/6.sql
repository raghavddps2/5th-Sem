declare
    num number;
    fact number;

-- Execute the procedure below as a separate file.
create or replace procedure factorial(n in number,fact out number) is
    
    begin
        fact := 1;
        for i in  reverse 1..n
            loop
                fact := fact * i;
            end loop;
    end;

begin

    num := 5;
    factorial(num,fact);
    dbms_output.put_line('The factorial of '|| num || ' is '|| fact);
end;