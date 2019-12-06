create table employee(
    name char(10),
    e_id number not null primary key,
    sal number,
    dep varchar(10)
);

insert into employee values('Raghav','123',10000,'ISE');
insert into employee values('Rahul','124',10000,'CSE');
insert into employee values('Ram','125',10000,'TCE');
insert into employee values('shyam','126',10000,'ECE');
insert into employee values('nimish','127',10000,'ISE');
insert into employee values('pooja','128',10000,'CSE');

begin
    update employee
        set sal = sal + 0.1*sal
        where dep='ISE';
    dbms_output.put_line('No of rows affected ' || sql%rowcount);
end;
/

select * from employee;