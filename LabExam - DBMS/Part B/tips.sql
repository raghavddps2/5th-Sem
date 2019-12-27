-- How to create a new user.
create user user1 identified by password;
grant create session to user1;
grant create table to user1;
grant unlimited tablespace to user1;


grant alter user to user1;
connect user1/password@xe;

alter user user1 default tablespace users temporary tablespace temp quota unlimited on users;