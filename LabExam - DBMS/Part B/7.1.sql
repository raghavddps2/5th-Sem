--  Write a PL/SQL program to check whether a given number is palindrome or not. 

declare 
    -- num1 number := &num;
    rev number;
    num1 number;
    temp number;
    num2 number;
begin
    num1 := 101011;
    num2 := num1;
    rev := 0;
    while num2 != 0
        loop
            temp := mod(num2,10);
            rev  := rev*10 + temp;
            num2 := trunc(num2/10);
        end loop;

    if rev = num1 then
        dbms_output.put_line('The number ' || num1 || ' is a pallindrome');
    else 
        dbms_output.put_line('The number ' || num1 || ' is not a pallindrome');
    end if;
end;
/