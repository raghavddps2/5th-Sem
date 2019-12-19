/*


JavaScript (JSON): Create two JSON objects. One contains the details of a ‘Patient’ as “name”, “AadharNumber” 
and a JSON array which has the “lab-tests” the patient has taken. The other contains the ‘Hospital’ 
details as “hospital-name” and “location”. Create a web page that displays the Hospital 
details when the page loads along with the text “Patient Details:” On mouse-hover the text “Patient Details:” 
changes colour and displays the details of the patient stored in the JSON object.

*/
console.log("hi")
window.onload = () => {

    patient = [
        {
            "name":"Raghav",
            "aadhar" : 1234567890,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":true
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "apollo" 
        },
        {
            "name":"Raghav",
            "aadhar" : 1234567890,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":true
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "apollo" 
        },
        {
            "name":"Raghav",
            "aadhar" : 1234567890,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":true
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "apollo" 
        },
        {
            "name":"Raghav",
            "aadhar" : 1234567890,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":true
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "apollo" 
        },
        {
            "name":"Shyam",
            "aadhar" : 1234567676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Shivam",
            "aadhar" : 1235677676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":false
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "max" 
        },
        {
            "name":"Shivam",
            "aadhar" : 1235677676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":false
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "max" 
        },
        {
            "name":"Shivam",
            "aadhar" : 1235677676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":false
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "max" 
        },
        {
            "name":"Shivam",
            "aadhar" : 1235677676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":false
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "max" 
        },
        {
            "name":"Shivam",
            "aadhar" : 1235677676,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":false
                },
                {
                    "name":"Chest test",
                    "result":false
                }
            ],
            "hospital": "max" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
        {
            "name":"Neha",
            "aadhar" : 123456767346,
            "tests" : [
                {
                    "name":"Depression test",
                    "result":false
                },
                {
                    "name":"Heart test",
                    "result":true
                },
                {
                    "name":"Chest test",
                    "result":true
                }
            ],
            "hospital": "fortis" 
        },
    ];

    // The josn array below is the array that contains the details of the hospitals.
    hospital = [
        {
            "name": "fortis",
            "loc" : "Bangalore",
            "number": 9457132980,
            "doctors": 50
        },
        {
            "name": "apollo",
            "loc": 'Delhi',
            "number": 9457134580,
            "doctors": 20
        },
        {
            "name":"max",
            "location":"Gurgaon",
            "number": 945234980,
            "doctors": 100
        }
    ];

    //For each hospital, we do the same to display the data. The for each loop does the required task.
    hospital.forEach(function(item,index){

        //Creating the table row
        var ele1 = document.createElement("tr");

        //Adding the table data
        var d1 = document.createElement("td");
        d1.innerHTML = item.name;
        var d2 = document.createElement("td");
        d2.innerHTML = item.location;
        var d3 = document.createElement("td");
        d3.innerHTML = item.number;
        var d4 = document.createElement("td");
        d4.innerHTML = item.doctors;

        // To refernce the hospital's patients, we can define the id of the text as the hospital name.
        var d5  = document.createElement("td")
        d5.id = item.name;
        d5.innerHTML = "Patient Details"
        
        //Adding data to the row.
        ele1.appendChild(d1);
        ele1.appendChild(d2);
        ele1.appendChild(d3);
        ele1.appendChild(d4);
        ele1.appendChild(d5);

        //Adding the made row to the table.
        document.getElementById("hospitals").appendChild(ele1);
    });

    hospital.forEach(mouseEventHandler);


    function mouseEventHandler(item,index){
        elem=document.getElementById(item.name);
        
        elem.onmouseover= function ()
			{   
                document.getElementById("patient").removeAttribute("hidden");
                document.getElementById(item.name).style.color = 'Red'
                patient.forEach(function(item1,index){

                    if(item.name==item1.hospital){
                                
                        var ele3  =document.createElement("tr");
                        
                        var d6 = document.createElement("td");
                        d6.innerHTML = item1.name;
                        
                        var d7 = document.createElement("td");
                        d7.innerHTML = item1.aadhar;

                        var d8 = document.createElement("td");
                        d8.innerHTML = item1.hospital;

                        ele3.appendChild(d6);
                        ele3.appendChild(d7);
                        ele3.appendChild(d8);

                        item1.tests.forEach(function(item2,index){
                            
                            var ele4 = document.createElement("tr");
    
                            var d9 = document.createElement("td");
                            d9.innerHTML = item2.name;
                            
                            var d10 = document.createElement("td");
                            d10.innerHTML = item2.result
                            ele4.appendChild(d9);
                            ele4.appendChild(d10);

                            ele3.appendChild(ele4);
    
                        });
                        
                        document.getElementById("patient-data").appendChild(ele3);
                    }
                });
            }
            
            elem.onmouseout = function(){
                document.getElementById("patient-data").innerHTML = "";
                document.getElementById(item.name).style.color = 'black'
                document.getElementById("patient").setAttribute("hidden",true);
            }
                
                
    }
    }

