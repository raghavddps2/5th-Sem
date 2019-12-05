declare
    f_num number;
    s_num number;
    t_num number;
    num number;
begin
    f_num := 0;
    s_num := 1;
    num := 5;
    dbms_output.put_line(f_num);
    dbms_output.put_line(s_num);
    num := num-2;
    while num > 0:
        loop
            t_num = f_num + s_num;
            dbms_output.put_line(t_num);
            f_num = s_num;
            s_num = t_num;
            num := num-1;
        end loop;
end;