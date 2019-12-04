declare
    num1 Number;
    flag Number;
begin

    num1 := 101;
    flag := 1;

    for i in 2..(num1/2)
        loop
            if mod(num1,i) = 0
                then 
                    flag := 0;
            else
                dbms_output.put_line('Doing...');
            end if;
        end loop;

    if num1 = 1
        then dbms_output.put_line(num1 || ' is neither prime nor composite');
    elsif flag = 0
        then dbms_output.put_line(num1 || ' is not prime');
    else
        dbms_output.put_line(num1 || ' is prime');
    end if;
end;
/