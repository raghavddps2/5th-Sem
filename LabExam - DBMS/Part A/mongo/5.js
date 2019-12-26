// Create the below tables, insert suitable tuples and perform the following
// operations using MongoDB
// BOOK (ISBN, TITLE, AUTHOR, PUBLISHER)
// BORROW (ISBN, USN, DATE)
// a. Obtain the name of the student who has borrowed the book bearing ISBN "123‟.
// b. Obtain the Names of students who have borrowed database books.

// use M5;

db.createCollection('BOOK');

db.BOOK.insert({"isbn":"BOOK1","title":"database","author":"author1","publisher":"cengage","usn":"1ms17is086","date":"25/12/2019"});
db.BOOK.insert({"isbn":"BOOK2","title":"database","author":"author1","publisher":"cengage","usn":"1ms17is086","date":"26/12/2019"});
db.BOOK.insert({"isbn":"BOOK3","title":"android","author":"author2","publisher":"oxford","usn":"1ms17cs012","date":"26/12/2019"});
db.BOOK.insert({"isbn":"BOOK4","title":"android","author":"author2","publisher":"oxford","usn":"1ms17cs012","date":"27/12/2019"});
db.BOOK.insert({"isbn":"BOOK5","title":"network","author":"author3","publisher":"recentPub","usn":"1ms17cs034","date":"27/12/2019"});
db.BOOK.insert({"isbn":"BOOK6","title":"network","author":"author3","publisher":"recentPub","usn":"1ms17cs034","date":"27/12/2019"});
db.BOOK.insert({"isbn":"BOOK7","title":"crypto","author":"author4","publisher":"vms pub","usn":"1ms17ec045","date":"26/12/2019"});
db.BOOK.insert({"isbn":"BOOK8","title":"crypto","author":"author4","publisher":"vms pub","usn":"1ms17ec054","date":"26/12/2019"});
db.BOOK.insert({"isbn":"BOOK9","title":"distributed","author":"author4","publisher":"harvard","usn":"1ms17ec045","date":"27/12/2019"});
db.BOOK.insert({"isbn":"BOOK10","title":"distributed","author":"author5","publisher":"harvard","usn":"1ms17ml012","date":"26/12/2019"});
db.BOOK.insert({"isbn":"BOOK11","title":"android","author":"author6","publisher":"stanford","usn":"1ms17ml012","date":"26/12/2019"});

// Query 1 : Obtain the name of the student who has borrowed the book bearing ISBN "123"
print("--------------------Query 1 ---------------------------");
db.BOOK.find({"isbn":"BOOK3"},{"title":1,_id:0,"author":1}).pretty().forEach(printjson);

// Query 2 : Obtain the Names of students who have borrowed database books.
print("--------------------Query 2 ---------------------------");
db.BOOK.find({"title":"database"},{"title":1,_id:0,"author":1}).pretty().forEach(printjson);