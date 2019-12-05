declare

    b_name branch.br_name%type;
    b_code branch.code%type;
    b_assets branch.assets%type;

    cursor c1 is
        select code,br_name,assets from branch;
    
    c_ssn customer.ssn%type;
    c_name customer.cu_name%type;
    c_place customer.place%type;

    cursor c2 is    
        select ssn,cu_name,place from customer;

    a_accno account.accno%type;
    a_ssn account.ssn%type;
    a_code account.code%type;
    a_balance account.balance%type;

    cursor c3 is    
        select accno,ssn,code,balance from account;

begin

    dbms_output.put_line('---------------BRANCH---------------------');
    open c1;
    loop
        fetch c1 into b_code,b_name,b_assets;
            dbms_output.put_line(b_code || '    ' || b_name || '    ' || b_assets);
        exit when c1%notfound;
    end loop;
    close c1;

    dbms_output.put_line('----------------------CUSTOMER----------------------');
    open c2;
    loop
        fetch c2 into c_ssn,c_name,c_place;
        exit when c2%notfound;
    dbms_output.put_line(c_ssn || '     ' || c_name || '       ' || c_place);
    end loop;
    close c2;

    dbms_output.put_line('-----------------------ACCOUNT------------------------');
    open c3;
    loop    
        fetch c3 into a_accno,a_ssn,a_code,a_balance;
            dbms_output.put_line(a_accno || '       '|| a_ssn || '      ' || a_code || '        ' || a_balance );
        exit when c3%notfound;
    

    end loop;
    close c3;


end;
/