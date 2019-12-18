window.onload = () =>{

    var jsonArr = [
        {
            "name" : "Raghav M.",
            "Country" : "India",
            "title" : "Depressed life",
            "Year" : "2000"
        },
        {   
            "name" : "Ujwal KC",
            "Country" : "Africa",
            "title" : "Very Depressed life",
            "Year" : "1999"
        },
        {
            "name" : "Srividhya",
            "Country" : "US",
            "title" : "Best life",
            "Year" : "1998"
        },
        {
            "name" : "Nidhi C.",
            "Country" : "India",
            "title" : "Always happy!!",
            "Year" : "1999"
        },
        {
            "name" : "Raghav M.",
            "Country" : "India",
            "title" : "Depressed life",
            "Year" : "2000"
        },
        {   
            "name" : "Ujwal KC",
            "Country" : "Africa",
            "title" : "Very Depressed life",
            "Year" : "1999"
        },
        {
            "name" : "Srividhya",
            "Country" : "US",
            "title" : "Best life",
            "Year" : "1998"
        },
        {
            "name" : "Nidhi C.",
            "Country" : "India",
            "title" : "Always happy!!",
            "Year" : "1999"
        },
        
    ];

    jsonArr.forEach(function showup(item,index){

        if(index <= 3){

            var tr1 = document.createElement("tr");

            var td1 = document.createElement("td");
            td1.innerHTML = item.name;
            
            var td2 = document.createElement("td");
            td2.innerHTML = item.Country;
            
            var td3 = document.createElement("td");
            td3.innerHTML = item.title;
            
            var td4 = document.createElement("td");
            td4.innerHTML = item.Year;

            tr1.appendChild(td1);
            tr1.appendChild(td2);
            tr1.appendChild(td3);
            tr1.appendChild(td4);
            
            document.getElementById("auth1").appendChild(tr1);
        }
        else{

            var div1 = document.createElement("div");

            var d1 = document.createElement("h6");
            d1.innerHTML = 'Name: ' + item.name + ' Country: ' + item.Country +' title: ' + item.title +' year: ' + item.Year;
            

            div1.appendChild(d1);
            document.getElementById("auth2").appendChild(div1);
            document.createElement("hr");
        }
    });


};