-- Consider the relations
-- BOAT (BID, BNAME, COLOUR),
-- SAILOR (SID, SNAME, AGE, RATING)
-- RESERVES (BID, SID, DAY)
-- Create the above tables, insert suitable tuples and perform the following
-- operations in Oracle SQL:
-- a. Obtain the bid of the boats reserved by „Ram‟.
-- b. Retrieve the bid of the boats reserved by all the sailors.
-- c. Find the number of boats reserved by each sailor

create table boat(
    bid Number NOT NULL,
    bname varchar(10),
    color varchar(10),
    primary key(bid)
);

create table sailor(
    sid Number NOT NULL,
    sname varchar(10),
    age Number,
    rating Number,
    primary key(sid)
);

create table reserves(

    bid Number NOT NULL,
    sid Number NOT NULL,
    primary key(bid,sid),
    Day1 varchar(10),
    foreign key(bid) references boat(bid) on delete cascade,
    foreign key(sid) references sailor(sid) on delete cascade
);

insert into boat(bid,bname,color) values(1,'Cutie','pink');
insert into boat(bid,bname,color) values(2,'Doll','green');
insert into boat(bid,bname,color) values(3,'Darling','blue');
insert into boat(bid,bname,color) values(4,'Goriya','pink');
insert into boat(bid,bname,color) values(5,'botly','blue');

insert into sailor(sid,sname,age,rating) values(1,'Ram',32,4);
insert into sailor(sid,sname,age,rating) values(2,'Shyam',23,5);
insert into sailor(sid,sname,age,rating) values(3,'Mohan',21,3);

insert into reserves(bid,sid,Day1) values(1,1,'25/12/2019');
insert into reserves(bid,sid,Day1) values(2,1,'26/12/2019');
insert into reserves(bid,sid,Day1) values(3,2,'25/12/2019');
insert into reserves(bid,sid,Day1) values(4,2,'26/12/2019');
insert into reserves(bid,sid,Day1) values(5,3,'27/12/2019');

-- Query1 : Obtain the bid of the boats reserved by „Ram‟.
select bid from reserves where sid = (select sid from sailor where sname = 'Ram');

-- Query2 : Retrieve the bid of the boats reserved by all the sailors.
-- We need to join the two tables to look at the bid of boats reserved by each sailor.
select bid,name from reserves r join sailor s on (r.sid = s.sid)
-- Other interpretation
select bid from reserves group by bid having count(sid) = (select count(sid) from sailor)

-- Query3 : Find the number of boats reserved by each sailor
select count(bid) as count,sid from reserves group by sid

