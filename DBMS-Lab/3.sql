-- BOAT (BID, BNAME, COLOUR)
-- SAILOR (SID, SNAME, AGE, RATING)
-- RESERVES (BID, SID, DAY)

-- create table boat(bid number, bname varchar(10), colour varchar(10), primary key(bid));
-- create table sailor(sid number, sname varchar(10), age number, rating number,primary key(sid));
-- create table reserves(bid number,sid number,day varchar(10),primary key(bid,sid),foreign key(bid) references boat(bid) on delete cascade, foreign key(sid) references sailor(sid) on delete cascade);


-- INSERT INTO BOAT VALUES(01, 'ABC', 'RED');
-- INSERT INTO BOAT VALUES(02, 'XYZ', 'YELLOW');
-- INSERT INTO BOAT VALUES(03, 'PQR', 'GREEN');
-- INSERT INTO BOAT VALUES(04, 'LMN', 'BLACK');
-- INSERT INTO BOAT VALUES(05, 'DEF', 'BLUE');


-- INSERT INTO SAILOR VALUES(10, 'RAM', 30, 5);
-- INSERT INTO SAILOR VALUES(20, 'RAVI', 25, 4);
-- INSERT INTO SAILOR VALUES(30, 'MISHRA', 22, 3);
-- INSERT INTO SAILOR VALUES(40, 'CHANDRA', 24, 2);
-- INSERT INTO SAILOR VALUES(50, 'SHIVA', 36, 1);
-- INSERT INTO SAILOR VALUES(60, 'KRISHNA', 40, 6);


-- INSERT INTO RESERVES VALUES(01, 20, 'MONDAY');
-- INSERT INTO RESERVES VALUES(02, 30, 'TUESDAY');
-- INSERT INTO RESERVES VALUES(03, 50, 'WEDNESDAY');
-- INSERT INTO RESERVES VALUES(04, 10, 'THURSDAY');
-- INSERT INTO RESERVES VALUES(05, 20, 'FRIDAY');

select * from boat;
select * from sailor;
select * from reserves;

-- reserves r(short form) join(keyword) sailor s(short form) on (condition: r.sid = s.sid)
select bid from reserves where sid in (select sid from sailor where sname like 'RAM');
select bid,sname from reserves r join sailor s on (r.sid = s.sid);
select count(bid) as qty,sid from reserves group by sid;