declare
    num1 number;
    res number;
    fac number;
    z number;

create or replace function factorial(n in number)
    return number is z number;

    begin
        for i in 1..n
            loop
                fac := fac * i;
            end loop;
        z := fac;
        return z;
    end;

begin
    num1 ;= 10
    res := factorial(num1);
    dbms_output.put_line('Factorial is ' || res);

end;

