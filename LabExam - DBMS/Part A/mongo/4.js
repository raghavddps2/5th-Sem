// Create the below tables, insert suitable tuples and perform the following
// operations using MongoDB
// PART (PNO, PNAME, COLOUR)
// SHIPMENT (PNO, WNO, WNAME, QUANTITY, DATE)
// a. Find the parts shipped from warehouse :Wname”
// b. List the total quantity supplied from each warehouse 

// use M4;

db.createCollection('PART');

db.PART.insert({"pno":1,"pname":"doll","color":"green","wno":1,"wname":"manju","quantity":5,"date":"25/12/2019"});
db.PART.insert({"pno":2,"pname":"doll","color":"blue","wno":1,"wname":"manju","quantity":2,"date":"26/12/2019"});
db.PART.insert({"pno":3,"pname":"beblade","color":"yellow","wno":2,"wname":"sanju","quantity":3,"date":"26/12/2019"});
db.PART.insert({"pno":4,"pname":"beblade","color":"blue","wno":2,"wname":"sanju","quantity":2,"date":"26/12/2019"});
db.PART.insert({"pno":5,"pname":"helicopter","color":"yellow","wno":3,"wname":"banju","quantity":1,"date":"23/12/2019"});
db.PART.insert({"pno":6,"pname":"helicopter","color":"green","wno":3,"wname":"banju","quantity":5,"date":"23/12/2019"});
db.PART.insert({"pno":7,"pname":"toy1","color":"blue","wno":4,"wname":"tanju","quantity":4,"date":"24/12/2019"});
db.PART.insert({"pno":8,"pname":"toy2","color":"yellow","wno":4,"wname":"tanju","quantity":4,"date":"24/12/2019"});
db.PART.insert({"pno":9,"pname":"toy3","color":"green","wno":5,"wname":"qanju","quantity":4,"date":"25/12/2019"});
db.PART.insert({"pno":10,"pname":"toy4","color":"blue","wno":5,"wname":"qanju","quantity":1,"date":"25/12/2019"});


// Query 1 : Find the parts shipped from warehouse :Wname”
print("---------------------Query 1-------------------------------");
db.PART.find({"wname":"manju"}).pretty().forEach(printjson);

// Query 2 : List the total quantity supplied from each warehouse 
print("---------------------Query 2-------------------------------");
db.PART.aggregate([{"$group":{_id:"$wname",total:{"$sum":"$quantity"}}}]).forEach(printjson);
