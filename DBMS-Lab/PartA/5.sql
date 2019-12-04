-- BOOK (ISBN, TITLE, AUTHOR, PUBLISHER)STUDENT (USN, NAME, SEM, DEPTNO), BORROW (ISBN, USN, DATE)
-- create table book(isbn varchar(10), title varchar(10), author varchar(10),publisher varchar(10), primary key(isbn));
-- create table student(usn varchar(10), name varchar(10),sem int, deptno varchar(10),primary key(usn));
-- create table borrow(isbn varchar(10), usn varchar(10), date1 varchar(10), foreign key(isbn) references book(isbn) on delete cascade,
--     foreign key(usn) references student(usn) on delete cascade);
    
 
--  insert into book values('001','T1','A1','P1');
--  insert into book values('002','T2','A2','P2');
--  insert into book values('003','T3','A3','P3');
--  insert into book values('004','T4','A4','P4');
--  insert into book values('005','T5','A5','P5');
 
 
--  insert into student values('101','Ram',3,'ise');
--  insert into student values('102','Shyam',5,'cse');
--  insert into student values('103','mohan',1,'cse');
--  insert into student values('104','rohan',5,'ise');
--  insert into student values('105','sohan',5,'ece');

-- insert into borrow values('001','101','1/2/13');
-- insert into borrow values('002','102','1/3/13');
-- insert into borrow values('003','103','1/4/13');
-- insert into borrow values('004','104','1/5/13');
-- insert into borrow values('005','105','1/6/13');

select * from student;
select * from book;
select * from borrow;

select name from student where usn = (select usn from borrow where isbn = '001');
select name from student where usn in (select usn from borrow);
-- number of books borrwed by each student
select count(isbn) as qty from borrow group by usn;