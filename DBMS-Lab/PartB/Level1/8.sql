begin

    for i in 1..3
        loop
        for j in 1..3
            loop
            dbms_output.put_line('Matrix value is ' || '(' || i || ',' || j || ' )');
            end loop;
        end loop;
end;
/
