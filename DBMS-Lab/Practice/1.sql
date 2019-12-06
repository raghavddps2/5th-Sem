create table branch(
    code varchar(10) primary key,
    name varchar(10),
    assets number;
);

create table customer(
    ssn number primary key,
    name varchar(10),
    place varchar(10)
);

create table account(
    accno varchar(10),
    ssn number,
    code varchar(10),
    balance number,
    foreign key(ssn) references customer(ssn)  on delete cascade,
    foreign key(code) references branch(code) on delete cascade
);

insert into branch values('B1','MSR',10000);
insert into branch values('B2','RSR',12000);
insert into branch values('B3','TSR',14000);
insert into branch values('B4','PSR',16000);

insert into customer values(1,'RAM','BNG');
insert into customer values(2,'ASHA','MNG');
insert into customer values(3,'USHA','MYS');
insert into customer values(4,'SRI','DEL');

insert into account values('A1',1,'B1',10000);
insert into account values('A2',1,'B1',20000);
insert into account values('A3',2,'B2',30000);
insert into account values('A4',3,'B2',40000);
insert into account values('A5',3,'B2',50000);
insert into account values('A6',3,'B2',60000);
insert into account values('A7',4,'B2',70000);



declare

    br_name branch.code%type;
    br_code branch.name%type;
    br_assets branch.assets%type;

    cu_ssn customer.ssn%type;
    cu_name customer.name%type;
    cu_place customer.place%type;

    acc_no account.accno%type;
    acc_ssn account.ssn%type;
    acc_code account.code%type;
    acc_bal account.balance%type;

    cursor c1 is 
        select code,name,assets from branch;
    cursor c2 is 
        select ssn,name,place from customer;
    cursor c3 is 
        select accno,ssn,code,balance from account;

begin

    open c3 ;
        loop
            fetch c3 into acc_no,acc_ssn,acc_code,acc_bal;
            exit when c3%notfound;
            dbms_output.put_line(acc_no || '        ' || acc_ssn || '       ' || acc_code || '      ' || acc_bal );
            dbms_output.put_line('');
        end loop;

    close c3;

    open c1;
        loop
            fetch c1 into br_code,br_name,br_assets;
            exit when c1%notfound;
            dbms_output.put_line(br_code || '       ' || br_name || '      ' || br_assets);
        end loop;
        dbms_output.put_line('');
    close c1;

    open c2;
        loop
            fetch c2 into cu_ssn,cu_name,cu_place;
            exit when c2%notfound;
            dbms_output.put_line(cu_ssn || '       ' || cu_name || '       ' || cu_place);
        end loop;
        dbms_output.put_line('');
    close c2;

    update account
       set balance = balance + 0.28balance
        where accno='A1';
    dbms_output.put_line(sql%rowcount || ' rows are affected');
end;
/