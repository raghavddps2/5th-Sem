// Create the below tables, insert suitable tuples and perform the following 
// operations using MongoDB
// PART (PNO, PNAME, COLOUR),
//  SUPPY (SNO, SNAME, PNO, ADDRESS)
// a. Update the parts identifier
// b. Display all suppliers who supply the part with part identifier: #PNO

// use M2;
db.createCollection('PART');

db.PART.insertMany([
    {"pno":1,"pname":"bolt","color":"green","sno":1,"sname":"golu","address":"bangalore"},
    {"pno":2,"pname":"shirt","color":"blue","sno":1,"sname":"golu","address":"bangalore"},
    {"pno":3,"pname":"nuts","color":"black","sno":2,"sname":"bholu","address":"delhi"},
    {"pno":4,"pname":"wheel","color":"yellow","sno":2,"sname":"bholu","address":"delhi"},
    {"pno":5,"pname":"steering","color":"black","sno":3,"sname":"nammu","address":"chennai"},
    {"pno":6,"pname":"wheel","color":"blue","sno":3,"sname":"nammu","address":"chennai"},
    {"pno":7,"pname":"bolt","color":"yellow","sno":4,"sname":"mannu","address":"kolkata"},
    {"pno":8,"pname":"shirt","color":"white","sno":4,"sname":"mannu","address":"kolkata"},
    {"pno":9,"pname":"nuts","color":"white","sno":5,"sname":"pannu","address":"puri"},
    {"pno":10,"pname":"bolt","color":"green","sno":5,"sname":"pannu","address":"puri"},
]);

// Query 1 : Update the parts identifier
print("-----------------Query1---------------------------");
db.PART.update({"pno":1},{$set:{"pno":11}},{multi:true});
db.PART.find().pretty().forEach(printjson);

//Query 2 : Display all suppliers who supply the part with part identifier: #PNO
print("-----------------Query2---------------------------");
db.PART.find({"pno":11}).pretty().forEach(printjson);
