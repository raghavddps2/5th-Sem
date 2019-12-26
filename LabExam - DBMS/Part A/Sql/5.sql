-- Consider the relations 
-- 25
-- BOOK (ISBN, TITLE, AUTHOR, PUBLISHER)
-- STUDENT (USN, NAME, SEM, DEPTNO),
-- BORROW (ISBN, USN, DATE)
-- Create the above tables, insert suitable tuples and perform the following operations in
-- Oracle SQL:
-- a. Obtain the name of the student who has borrowed the book bearing ISBN
-- „123‟
-- b. Obtain the Names of students who have borrowed database books.
-- c. Find the number of books borrowed by each student.

create table book(
    isbn varchar(10),
    title varchar(10),
    author varchar(10),
    publisher varchar(10),
    primary key(isbn)
);

create table student(
    usn varchar(10),
    name varchar(10),
    sem Number,
    deptno Number,
    primary key(usn)
);

create table borrow(
    isbn varchar(10),
    usn varchar(10),
    date1 varchar(10),
    foreign key(isbn) references book(isbn) on delete cascade,
    foreign key(usn) references student(usn) on delete cascade
);

insert into book(isbn,title,author,publisher) values('BOOK1','Title1','gulzar','cengage');
insert into book(isbn,title,author,publisher) values('BOOK2','Title2','sonia','bjp');
insert into book(isbn,title,author,publisher) values('BOOK3','Title3','gandhi','world');
insert into book(isbn,title,author,publisher) values('BOOK4','Title4','modi','congress');
insert into book(isbn,title,author,publisher) values('BOOK5','Title5','nehru','bjp');
insert into book(isbn,title,author,publisher) values('BOOK6','Title6','kamla','bjp');
insert into book(isbn,title,author,publisher) values('BOOK7','Title7','sultan','cengage');
insert into book(isbn,title,author,publisher) values('BOOK8','Title8','yogi','congress');
insert into book(isbn,title,author,publisher) values('BOOK9','Title9','shashi','oxford');
insert into book(isbn,title,author,publisher) values('BOOK10','Title10','tanmay','comedy');
insert into book(isbn,title,author,publisher) values('BOOK11','Title10','tanmay','jhola');

insert into student(usn,name,sem,deptno) values('1MS17IS086','raghav',5,1);
insert into student(usn,name,sem,deptno) values('1MS17CS012','rahul',3,2);
insert into student(usn,name,sem,deptno) values('1MS17EC023','mohan',1,3);
insert into student(usn,name,sem,deptno) values('1MS17IS043','shakti',5,1);
insert into student(usn,name,sem,deptno) values('1MS17CS045','neeti',3,2);

insert into borrow(isbn,usn,date1) values('BOOK1','1MS17IS086','25/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK2','1MS17CS012','26/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK3','1MS17EC023','27/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK4','1MS17IS043','24/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK5','1MS17CS045','25/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK6','1MS17CS045','26/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK7','1MS17IS086','27/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK10','1MS17IS086','27/12/2019');
insert into borrow(isbn,usn,date1) values('BOOK11','1MS17CS012','27/12/2019');


-- Query1: Obtain the name of the student who has borrowed the book bearing ISBN 123
select name from student where usn IN (select usn from borrow where isbn = 'BOOK4');

-- Query2 : Obtain the Names of students who have borrowed database books.
select name from student where usn IN (select usn from borrow where isbn IN (select isbn from book where title like 'Title10'));

-- Query3 : Find the number of books borrowed by each student.
select count(isbn) as quantity,usn from borrow group by usn;