declare
    val1 string(10);
    val2 string(10);
    len1 number;
    len2 number;

begin

    val1 := 'nitin';

    len1 := length(val1);

    for i in reverse 1..len1
        loop
            val2 := val2 || substr(val1,i,1);
        end loop;

    if val1 = val2  
        then dbms_output.put_line('The enetered string is a pallindrome');
    else
        dbms_output.put_line('The entered string is not a pallindrome');
    end if;

end;
/