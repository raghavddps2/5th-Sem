declare
    num1 Number;
    num2 Number;

procedure fact(n in number, fact out number) is
    i number;
    begin
        fact := 1;
        for i in 1..n 
            loop
                fact := fact * i;
            end loop;
    end;

begin
    num1 := 23;
    fact(num1,num2);
    dbms_output.put_line('The factorial is ' || num2);
end;
/