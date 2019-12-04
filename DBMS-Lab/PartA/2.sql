-- create table part(pno number,pname varchar(10),colour varchar(10), primary key(pno));
-- create table supplier(sno number,sname varchar(10),address varchar(10),primary key(sno));
-- create table supply(pno number,sno number,quantity number,primary key(pno,sno),foreign key(pno) references part(pno) on delete cascade,foreign key(sno) 
-- references supplier(sno) on delete cascade);

-- insert into part(pno,pname,colour) values (101,'BOLTS','RED');
-- insert into part(pno,pname,colour) values (102,'NUTS','RED');
-- insert into part(pno,pname,colour) values (103,'PLUGS','RED');
-- insert into part(pno,pname,colour) values (104,'BOLTS','BLUE');
-- insert into part(pno,pname,colour) values (105,'NUTS','BLUE');
-- insert into part(pno,pname,colour) values (106,'PLUGS','BLUE');
-- insert into part(pno,pname,colour) values (107,'BOLTS','GREEN');
-- insert into part(pno,pname,colour) values (108,'NUTS','GREEN');
-- insert into part(pno,pname,colour) values (109,'PLUGS','GREEN');

-- select * from part;

-- insert into supplier(sno,sname,address) values(1,'Ram','BLR');
-- insert into supplier(sno,sname,address) values(2,'Shyam','DEL');
-- insert into supplier(sno,sname,address) values(3,'Paul','BOM');
-- insert into supplier(sno,sname,address) values(4,'Jacob','CAL');

-- select * from supplier;

-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (107, 4, 10);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (109, 4, 15);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (102, 1, 3);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (109, 3, 6);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (104, 3, 3);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (103, 2, 5);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (109, 1, 10);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (106, 2, 10);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (107, 2, 5);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (108, 3, 10);  
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (106, 3, 5);
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (109, 2, 3); 
-- INSERT INTO SUPPLY (pno, sno, quantity) VALUES (105, 1, 5);

select * from supply;
select * from supplier;
select * from part;
    
select pno from supply where sno = (select sno from supplier where sname like 'Ram');
select sname from (select * from part,supply,supplier where part.pno = supply.pno and supplier.sno = supply.sno) where pname like 'BOLTS';
delete from part where colour like 'GREEN';
select * from part;

select sname from (select * from part,supply,supplier where part.pno = supply.pno and supplier.sno = supply.sno and address like 'DEL');
select sname from supply where sno in (select sno from supply where pno in (select pno from part where colur= 'RED'));