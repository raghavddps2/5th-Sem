-- PART (PNO, PNAME, COLOUR), WAREHOUSE (WNO, WNAME, CITY)SHIPMENT (PNO, WNO, QUANTITY, DATE)

-- create table part1(pno number,pname varchar(10), colour varchar(10),primary key(pno));
-- create table warehouse(wno number,wname varchar(10), city varchar(10), primary key(wno));
-- create table shipment(pno number,wno number,quantity number,datee varchar(10),primary key(pno,wno),foreign key(pno) references part1(pno) on delete cascade,
--     foreign key(wno) references warehouse(wno) on delete cascade);


--  INSERT INTO PART1 VALUES(01,'ABC','RED');
--  INSERT INTO PART1 VALUES(02,'DEF','BLUE');
--  INSERT INTO PART1 VALUES(03,'LMN','GREEN');
--  INSERT INTO PART1 VALUES(04,'PQR','YELLOW');
--  INSERT INTO PART1 VALUES(05,'XYZ','PINK');

--  INSERT INTO WAREHOUSE VALUES(10,'AAA','KUMTA');
--  INSERT INTO WAREHOUSE VALUES(20,'BBB','MUMBAI');
--  INSERT INTO WAREHOUSE VALUES(30,'CCC','BANGALORE');
--  INSERT INTO WAREHOUSE VALUES(40,'DDD','UDUPI');
--  INSERT INTO WAREHOUSE VALUES(50,'EEE','KARWAR');


 
--  INSERT INTO SHIPMENT VALUES(01,20,300,'28FEB13');
--  INSERT INTO SHIPMENT VALUES(02,30,400,'30JAN13');
--  INSERT INTO SHIPMENT VALUES(03,10,100,'31JAN13');
--  INSERT INTO SHIPMENT VALUES(04,40,600,'31MARCH13');
--  INSERT INTO SHIPMENT VALUES(05,50,100,'31DEC13');
-- INSERT INTO SHIPMENT VALUES(01,50,100,'21DEC13');

select * from part1;
select* from warehouse;
select * from shipment;

select wname from warehouse where wno in (select wno from shipment where pno in (select pno from part1 where colour like 'RED'));
select pno,wname from warehouse w join shipment s on w.wno = s.wno;
select wno,count(pno) as qty from shipment group by wno;