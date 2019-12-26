-- Write a PL/SQL program to check whether a given number is prime or not

declare
    num Number;
    flag Number;

begin

    num := 10;
    flag := 0;

    for i in 2..(num/2)
        loop
            if(mod(num,i) = 0) then
                flag := 1;
                exit;
            end if;
        end loop;
    
    if(num = 1) then 
        dbms_output.put_line('The number is neither prime nor composite');
    elsif (flag = 1) then 
        dbms_output.put_line('The number ' || num || ' is composite');
    
    else 
        dbms_output.put_line('The number ' || num || ' is prime');

    end if;
end;
/
