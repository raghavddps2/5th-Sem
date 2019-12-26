-- Consider the relations
-- PART (PNO, PNAME, COLOUR),
-- WAREHOUSE (WNO, WNAME, CITY)
-- SHIPMENT (PNO, WNO, QUANTITY, DATE)
-- Create the above tables, insert suitable tuples and perform the following
-- operations in Oracle SQL:
-- a. Obtain the Names of warehouses which have shipped red coloured parts.
-- b. Retrieve the PNO of the parts shipped by all the warehouses.
-- c. Find the number of parts supplied by each warehouse

create table part1(

    pno Number NOT NULL,
    pname varchar(10),
    color varchar(10),
    primary key(pno)
);

create table warehouse(

    wno Number NOT NULL,
    wname varchar(10),
    city varchar(15),
    primary key(wno)
);

create table shipment(
    pno Number NOT NULL,
    wno Number NOT NULL,
    Qty Number,
    date1 varchar(15),
    foreign key(pno) references part1(pno),
    foreign key(wno) references warehouse(wno)   
);

insert into part1(pno,pname,color) values(1,'shirt','green');
insert into part1(pno,pname,color) values(2,'shirt','red');
insert into part1(pno,pname,color) values(3,'jeans','black');
insert into part1(pno,pname,color) values(4,'tie','blue');
insert into part1(pno,pname,color) values(5,'socks','green');

insert into warehouse(wno,wname,city) values(1,'champu','meerut');
insert into warehouse(wno,wname,city) values(2,'bholu','ghazibad');
insert into warehouse(wno,wname,city) values(3,'golu','muzaffarnagar');

insert into shipment(pno,wno,Qty,date1) values(1,1,2,'25/12/2019');
insert into shipment(pno,wno,Qty,date1) values(2,2,4,'26/12/2019');
insert into shipment(pno,wno,Qty,date1) values(3,1,1,'25/12/2019');
insert into shipment(pno,wno,Qty,date1) values(4,3,8,'26/12/2019');
insert into shipment(pno,wno,Qty,date1) values(5,3,1,'25/12/2019');


-- Query1 : Obtain the Names of warehouses which have shipped red coloured parts.
select wname from warehouse where wno IN (select wno from shipment where pno IN (select pno from part1 where color = 'red'))

-- Query2 : Retrieve the PNO of the parts shipped by all the warehouses.
select pno,wname from warehouse w join shipment s on w.wno = s.wno
-- other interpretation
select pno from shipment group by pno having count(wno) = (select count(wno) from warehouse);
-- Query3: Find the number of parts supplied by each warehouse
select count(pno) as count,wno from shipment group by wno;
