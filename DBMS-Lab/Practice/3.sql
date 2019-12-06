set serveroutput on
declare
    num number;
    flag number;

begin

    num := 1;
    flag := 1;

    for i in 2..(num/2)
        loop
            if mod(num,i) = 0
                then 
                    flag := 0;
                    exit;
            end if;
        end loop;

    if num = 1
        then dbms_output.put_line('The entered number is neither prime nor composite');
    elsif flag = 1
        then dbms_output.put_line('The entered number is prime');
    else
        dbms_output.put_line('The entered number is not a prime number');
    end if;
end;
/