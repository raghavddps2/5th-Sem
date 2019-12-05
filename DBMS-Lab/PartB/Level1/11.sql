declare 
    num1 number;
    num2 number;

procedure fact(num3 in number, fact out number) is
    begin
    fact := 1;
    for i in 1..num3
        loop
            fact := fact * i;
        end loop;

    end;

begin
    num1 := 4;
    fact(num1,num2);
    dbms_output.put_line(num2 || ' is the factorial');

end;

