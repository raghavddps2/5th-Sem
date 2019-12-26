-- Consider the following database for a BANK system
-- BRANCH (Code, Name, Assets)
-- CUSTOMER (SSN, Name, Place)
-- ACCOUNT (AccNo, SSN, Code, Balance)
-- i) Create the above tables by stating the primary and foreign keys
-- ii) Insert the following tuples to the tables 

create table BRANCH(
    code varchar(3),
    name varchar(5),
    assets Number,
    primary key(code)
);

create table CUSTOMER(
    ssn Number,
    name varchar(10),
    place varchar(10),
    primary key(ssn)  
);

create table ACCOUNT(
    AccNo varchar(10),
    ssn Number,
    code varchar(3),
    Balance Number,
    foreign key(ssn) references CUSTOMER(ssn),
    foreign key(code) references BRANCH(code)
);

insert into BRANCH(code,name,assets) values('B1','MSR',10000);
insert into BRANCH(code,name,assets) values('B2','RNR',20000);
insert into BRANCH(code,name,assets) values('B3','SMR',15000);
insert into BRANCH(code,name,assets) values('B4','SKR',25000);


insert into CUSTOMER(ssn,name,place) values(1,'RAM','BNG');
insert into CUSTOMER(ssn,name,place) values(2,'Asha','MNG');
insert into CUSTOMER(ssn,name,place) values(3,'Usha','MYS');
insert into CUSTOMER(ssn,name,place) values(4,'Sri','DEL');


insert into ACCOUNT(AccNo,ssn,code,balance) values('A1',1,'B1',100000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A2',1,'B1',200000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A3',2,'B2',100000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A4',3,'B2',100000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A5',3,'B2',100000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A6',3,'B2',100000);
insert into ACCOUNT(AccNo,ssn,code,balance) values('A7',4,'B2',200000);
