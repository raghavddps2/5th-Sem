// Create the below tables, insert suitable tuples and perform the following
// operations using MongoDB
// EMPLOYEE (SSN, Name, DeptNo)
// ASSIGNED_TO (USN , ProjectNo)
// a. List all the employees of department “XYZ”.
// b. Name the employees working on Project Number :#PNo


// use M1;

db.createCollection('EMPLOYEE');

db.EMPLOYEE.insert({'ssn':'EMP101','name':'rahul','deptno':5,'projectNo':2});
db.EMPLOYEE.insert({'ssn':'EMP102','name':'mohan','deptno':5,'projectNo':1});
db.EMPLOYEE.insert({'ssn':'EMP103','name':'shakti','deptno':3,'projectNo':2});
db.EMPLOYEE.insert({'ssn':'EMP104','name':'neeti','deptno':3,'projectNo':1});
db.EMPLOYEE.insert({'ssn':'EMP105','name':'parul','deptno':2,'projectNo':3});
db.EMPLOYEE.insert({'ssn':'EMP106','name':'kajol','deptno':2,'projectNo':3});
db.EMPLOYEE.insert({'ssn':'EMP107','name':'saif','deptno':1,'projectNo':3});
db.EMPLOYEE.insert({'ssn':'EMP108','name':'taimur','deptno':1,'projectNo':1});
db.EMPLOYEE.insert({'ssn':'EMP109','name':'swalpa','deptno':1,'projectNo':1});
db.EMPLOYEE.insert({'ssn':'EMP110','name':'love','deptno':4,'projectNo':2});

// Query1 : List all the employees of department 3
print("-----------------------Query1-----------------------------");
db.EMPLOYEE.find({"deptno":3}).pretty().forEach(printjson);

// Query2 : Name the employees working on project no pno.
print("-----------------------Query2-----------------------------");
db.EMPLOYEE.find({"projectNo":1}).pretty().forEach(printjson);