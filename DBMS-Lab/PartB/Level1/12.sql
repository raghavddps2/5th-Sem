declare
    str1 varchar(50);
    str2 varchar(50);
    len1 number;
begin

    str1 := 'nitin';
    len1 := length(str1);

    for k1 in reverse 1..len1
        -- here, k1 will start from 5.
        loop
         -- Here, it implies get the substring and the concatenate with str2.
         str2 := str2 || substr(str1,k1,1);
        end loop;
    if str1 = str2
        then dbms_output.put_line(str1 || ' is a pallindrome');
    else
        dbms_output.put_line(str1 || ' is not a pallindrome');
    end if;

end;