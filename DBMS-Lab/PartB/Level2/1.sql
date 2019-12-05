create table branch(
    code varchar(5) primary key,
    br_name varchar(5),
    assets int 
);

create table customer(
    ssn int primary key,
    cu_name varchar(20),
    place varchar(20)
);


create table account(
    accno varchar(10) primary key,
    ssn int,
    code varchar(10),
    balance int,
    foreign key(ssn) references customer(ssn) on delete cascade,
    foreign key(code) references branch(code) on delete cascade
);

insert into branch(code,br_name,assets) values('&code','&br_name',&assets);
insert into customer(ssn,cu_name,place) values(&ssn,'&cu_name','&place');
insert into account(accno,ssn,code,balance) values('&accno',&ssn,'&code',&balance);


-- Queries to insert data!! 

-- insert into branch(code,br_name,assets) values('B1','MSR',10000);
-- insert into branch(code,br_name,assets) values('B2','RNR',20000);
-- insert into branch(code,br_name,assets) values('B3','SMR',15000);
-- insert into branch(code,br_name,assets) values('B4','SKR',25000);


-- insert into customer(ssn,cu_name,place) values(1,'Ram','BNG');
-- insert into customer(ssn,cu_name,place) values(2,'Asha','MNG');
-- insert into customer(ssn,cu_name,place) values(3,'Usha','MYS');
-- insert into customer(ssn,cu_name,place) values(4,'Shri','DEL');


-- insert into account(accno,ssn,code,balance) values('A1',1,'B1',100000);
-- insert into account(accno,ssn,code,balance) values('A2',1,'B1',200000);
-- insert into account(accno,ssn,code,balance) values('A3',2,'B2',100000);
-- insert into account(accno,ssn,code,balance) values('A4',3,'B2',100000);
-- insert into account(accno,ssn,code,balance) values('A5',3,'B2',100000);
-- insert into account(accno,ssn,code,balance) values('A6',3,'B2',100000);
-- insert into account(accno,ssn,code,balance) values('A7',4,'B2',200000);
