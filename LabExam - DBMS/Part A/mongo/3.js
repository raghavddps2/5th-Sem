// Create the below tables, insert suitable tuples and perform the following
// operations using MongoDB
// BOAT (BID, BNAME, COLOUR)
// RESERVES (BID, SNAME, SID, DAY)
// a. Obtain the number of boats obtained by sailor :#sname
// b. Retrieve boats of color :”White”

// use M3;
db.createCollection('PART');

db.BOAT.insert({"bid":1,"bname":"golu","color":"yellow","sname":"ramesh","sid":1,"day":"25/12/2019"});
db.BOAT.insert({"bid":2,"bname":"bholu","color":"green","sname":"ramesh","sid":1,"day":"26/12/2019"});
db.BOAT.insert({"bid":3,"bname":"dholu","color":"blue","sname":"rupesh","sid":2,"day":"25/12/2019"});
db.BOAT.insert({"bid":4,"bname":"golu","color":"black","sname":"rupesh","sid":2,"day":"26/12/2019"});
db.BOAT.insert({"bid":5,"bname":"bholu","color":"yellow","sname":"ashesh","sid":3,"day":"25/12/2019"});
db.BOAT.insert({"bid":6,"bname":"dholu","color":"green","sname":"ashesh","sid":3,"day":"26/12/2019"});
db.BOAT.insert({"bid":7,"bname":"golua","color":"blue","sname":"kohila","sid":4,"day":"25/12/2019"});
db.BOAT.insert({"bid":8,"bname":"polua","color":"green","sname":"kohila","sid":4,"day":"26/12/2019"});
db.BOAT.insert({"bid":9,"bname":"dholua","color":"green","sname":"tohila","sid":5,"day":"25/12/2019"});
db.BOAT.insert({"bid":10,"bname":"golua","color":"yelllow","sname":"tohila","sid":5,"day":"26/12/2019"});
db.BOAT.insert({"bid":11,"bname":"golu","color":"blue","sname":"tohila","sid":5,"day":"27/12/2019"});

// Query 1 : Obtain the number of boats obtained by sailor :#sname
print("-----------------------Query 1--------------------------");
result = db.BOAT.find({"sname":"ramesh"}).pretty().count()
print(result);
// Query 2 : Retrieve boats of color :”White”
print("-----------------------Query 1--------------------------");
db.BOAT.find({"color":"green"}).pretty().forEach(printjson);