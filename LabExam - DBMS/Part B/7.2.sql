declare 
    -- str1 varchar(50) := '&str'; This if we are taking input.
    str1 varchar(50);
    str2 varchar(50);
    num1 number;
begin
    
    str1 := 'nitin';
    str2 := '';
    num1 := length(str1);
    for i in reverse 1..num1
        loop
            str2 := str2 || substr(str1,i,1);
        end loop;

    if str2 = str1 then
        dbms_output.put_line(str1 || ' is a pallindrome');
    else 
        dbms_output.put_line(str1 || ' is not a pallindrome');
    end if;
end;
/