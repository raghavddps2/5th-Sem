-- Consider the relations
-- PART (PNO, PNAME, COLOUR),
-- SUPPLIER ( SNO, SNAME, ADDRESS)
-- SUPPLY (PNO, SNO, QUANTITY)
-- Create the above tables, insert suitable tuples and perform the following operations in
-- Oracle SQL:
-- a. Obtain the PNO of parts supplied by supplier „Ram‟.
-- b. Obtain the Names of suppliers who supply bolts
-- c. Delete the parts which are green in colour

create table PART(
    Pno Number NOT NULL,
    Pname varchar(10),
    color varchar(10),
    primary key(pno)
);

create table SUPPLIER(
    sno Number NOT NULL,
    sname varchar(10),
    address varchar(20),
    primary key(sno)
);

create table SUPPLY(
    pno Number NOT NULL,
    sno Number NOT NULL,
    quantity Number,
    primary key(pno,sno),
    foreign key(pno) references part(pno) on delete cascade,
    foreign key(sno) references supplier(sno) on delete cascade
);

insert into PART(Pno,Pname,color) values(1,'bolt','green');
insert into PART(Pno,Pname,color) values(2,'wheel','black');
insert into PART(Pno,Pname,color) values(3,'steering','blue');
insert into PART(Pno,Pname,color) values(4,'wheel','green');
insert into PART(Pno,Pname,color) values(5,'bolt','black');

insert into SUPPLIER(sno,sname,address) values(1,'rupesh','bangalore');
insert into SUPPLIER(sno,sname,address) values(2,'mahesh','chennai');
insert into SUPPLIER(sno,sname,address) values(3,'ramesh','kolkata');

insert into SUPPLY(pno,sno,quantity) values(1,1,5);
insert into SUPPLY(pno,sno,quantity) values(2,2,7);
insert into SUPPLY(pno,sno,quantity) values(3,2,12);
insert into SUPPLY(pno,sno,quantity) values(4,3,2);
insert into SUPPLY(pno,sno,quantity) values(5,1,9);

-- Query1 : Obtain the PNO of parts supplied by supplier "Ram"
select pno from supply where sno IN (select sno from SUPPLIER where sname = 'mahesh');

-- Query2 : Obtain the Names of suppliers who supply bolts
select sname from SUPPLIER where sno IN (select sno from SUPPLY where Pno IN (select Pno from PART where Pname like 'bolt'));

-- Query3 : Delete the parts which are green in colour
delete from PART where color like 'green'; 