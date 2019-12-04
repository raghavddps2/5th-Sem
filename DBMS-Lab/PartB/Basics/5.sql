declare
    
    num1 number;
    sum1 number;
    num2 number;
    sum2 number;
    num3 number;
    sum3 number;
    n1 number;

begin

    n1 := 10;
    sum1 := 0;
    while n1 > 0
        loop
            sum1 := sum1 + n1;
            n1 := n1-1;
        end loop;
    
    dbms_output.put_line('Avergae is ' || sum1/10);

    sum2 := 0;
    for n2 in 1..20
        loop
            sum2 := sum2 + n2;
        end loop;
    dbms_output.put_line('Average is ' || sum2/10); 

    sum3 := 0;
    num3 := 20;
    loop
        sum3 := sum3 + num3;
        num3 := num3 -1;
        exit when num3 <= 0;
    end loop;

    dbms_output.put_line('Average is '|| sum3/10);
end;
/
