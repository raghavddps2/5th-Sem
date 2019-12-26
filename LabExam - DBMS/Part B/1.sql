declare

    cursor c1 is select * from BRANCH;
    cursor c2 is select * from CUSTOMER;
    cursor c3 is select * from ACCOUNT;

    br_row c1%rowtype;
    cu_row c2%rowtype;
    ac_row c3%rowtype;

    val varchar(10);

begin

    dbms_output.put_line(chr(10));
    dbms_output.put_line('CODE' || '        ' || 'NAME' || '        ' || 'ASSETS');
    for br_row in c1
        loop    
            dbms_output.put_line(br_row.code || '       ' || br_row.name || '      ' || br_row.assets);
        end loop;

    dbms_output.put_line(chr(10));
    dbms_output.put_line('SSN' || '        ' || 'NAME' || '        ' || 'PLACE');
    for cu_row in c2
        loop
            dbms_output.put_line(cu_row.ssn || '        ' || cu_row.name || '       ' || cu_row.place);
        end loop;

    dbms_output.put_line(chr(10));
    dbms_output.put_line('ACCNO' || '        ' || 'SSN' || '        ' || 'CODE' || '      ' || 'BALANCE');
    for ac_row in c3
        loop
            dbms_output.put_line(ac_row.accno || '      ' || ac_row.ssn || '        ' || ac_row.code || '       ' || ac_row.balance);
        end loop;

    dbms_output.put_line(chr(10));
    dbms_output.put_line('ACCNO' || '        ' || 'SSN' || '        ' || 'CODE' || '      ' || 'BALANCE');
    for ac_row in c3
        loop
            if ac_row.accno = 'A5' or ac_row.accno = 'A6' then
                val := ac_row.accno;
                update account set balance = balance + 1000 where accno=val;
            end if;
            dbms_output.put_line(ac_row.accno || '      ' || ac_row.ssn || '        ' || ac_row.code || '       ' || ac_row.balance);
        end loop;
end;
/