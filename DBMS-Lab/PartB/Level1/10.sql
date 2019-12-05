declare
    num1 number;
    num2 number;
    temp number;
    rev number;

begin

    num1 := 1010;
    temp := num1;
    rev := 0;
    while num1 > 0
        loop
            num2 := mod(num1,10);
            rev := rev*10 + num2;
            num1 := trunc(num1/10);
        end loop; 
    dbms_output.put_line(rev);
    if temp = rev
        then dbms_output.put_line(' The number is a pallindrome');
    else
        dbms_output.put_line(' The number is not a pallindrome');
    end if;


end;
/