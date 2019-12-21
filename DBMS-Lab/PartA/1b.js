/*
    Now, one of the most important thing as to why i am writing all the code in a js file, when i am dealting with mongoDb.
    This is because mongoDb provides a direct load() function where we can specify our js files and the commands weill 
    be executed.

    All we have to do in the mongo shell now is 
        load("1b.js") --> Ashte, do this and the output will be on ur screen.
*/

// use database1; //CReate the db in shell and then execute the load command.
 //This is simply to create the database in mongo db.

//To create a collection(SQL refrence table), all we need to do is to use the CreateCollection command.
db.createCollection('EMPLOYEE')

//To insert multiple values in the database all we have to do is to use the insertMany command and specify the array of
//objects inside the same.

db.EMPLOYEE.insertMany([
    {'ssn':1,'name':'amit','deptno':1},
    {'ssn':2,'name':'amit1','deptno':1},
    {'ssn':3,'name':'amit2','deptno':1},
    {'ssn':4,'name':'amit3','deptno':1},
    {'ssn':5,'name':'amit4','deptno':2},
    {'ssn':6,'name':'amit5','deptno':2},
    {'ssn':7,'name':'amit6','deptno':2},
    {'ssn':8,'name':'amit7','deptno':3},
    {'ssn':9,'name':'amit8','deptno':3},
    {'ssn':10,'name':'amit9','deptno':4},
    {'ssn':11,'name':'amit10','deptno':2}
])

//Again all we are doing is to entering the value in the ASSIGNED_TO collection.
db.createCollection('ASSIGNED_TO')
db.ASSIGNED_TO.insertMany([
    {'ssn':1,'project_no':3},
    {'ssn':2,'project_no':2},
    {'ssn':3,'project_no':1},
    {'ssn':4,'project_no':1},
    {'ssn':5,'project_no':1},
    {'ssn':6,'project_no':1},
    {'ssn':7,'project_no':2},
    {'ssn':8,'project_no':2},
    {'ssn':9,'project_no':2},
    {'ssn':10,'project_no':4},
    {'ssn':11,'project_no':4},
])

/*
    1. db.collection.find(query,projection)
        The above is the syntax for finding the results or querying the database.
            query --> document --> This specifies selection filter using query operators.
            projection --> document --> This specifies what all fields should be returned.

    2. db.collection.aggregate(pipeline,options)
        The above is the syntax for finding the results of an aggregation, ye 2 parameter leta hai
            pipeline --> array --> what is the sequence of data aggregation operations or stages.
            options --> document --> optional arguments that are required to be passed to the aggregate command.

*/
db.EMPLOYEE.find({deptno:1},{"ssn":1,"name":1}).pretty().forEach(printjson)

/*The array(pipeline) will basically filter the document stream according to the project number we specify.

    $match --> This just matches documents according to the specified condition.
    {
    $lookup: --> This performs a left outer join to an unsharded (This is importnat to note) collection in the same database.

    {
        from: <collection to join>, --> Which collection to join.
        localField: <field from the input documents>, --> On what basis to join from first collection
        foreignField: <field from the documents of the "from" collection>, --> above reason for second collection.
        as: <output array field>  --> What name is goven to the output basically.
    }

    // $unwind--> What we get as output above, we just unwindd it, to get a document for each one instead of an array. 
                    For more clarification, just remove the unwind one and see tthe ouput. There is no big difference.
                    It is just doing what is said above.
    $project --> Passes along the documents with the requested fields
}
*/
db.ASSIGNED_TO.aggregate([
     {"$match":{"project_no":2}},
     {"$lookup":{
         "from":"EMPLOYEE",
         "localField":"ssn",
         "foreignField":"ssn",
         "as":"name"
     }},
     {$unwind:"$name"},
     {$project:{"name":"$name.name","_id":0}}
 ]).pretty().forEach(printjson)

 //If you don't want to see those big Id's, jyada kuch nahi karna, bas set the _id field to 0. Ashte.