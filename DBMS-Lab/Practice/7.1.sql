declare
    num number;
    rev number; 
    num1 number;
    temp number;

begin

    num := 101;
    num1 := num;
    rev := 0;
    while num != 0
        loop
            temp := mod(num,10);
            rev := rev*10 + temp;
            num := trunc(num/10);
        end loop;
    
    if num1 = rev
        then dbms_output.put_line('The entered number is a pallindrome');
    else
        dbms_output.put_line('The entered number is not a pllaindrome');
    end if;
end;
/