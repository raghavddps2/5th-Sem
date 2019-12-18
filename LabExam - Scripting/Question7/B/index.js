window.onload = function(){

    Models = [
        {
            "model":"A2",
            "name":"Audi P class",
            "year": 2017,
            "price":1000000

        },
        {
            "model":"A3",
            "name":"Audi I class",
            "year": 2018,
            "price":2000000
        },
        {
            "model":"A4",
            "name":"Audi Z class",
            "year": 2019,
            "price":3000000
        },
        {
            "model":"A5",
            "name":"Audi C class",
            "year": 2020,
            "price":4000000
        }
    ];

    Models.forEach(function(item,index){

        var ele = document.createElement("td")
        ele.id = item.model;
        ele.innerHTML = item.model
        document.getElementById("menu").appendChild(ele)
    })

    Models.forEach(mouseEventHandler)

    function mouseEventHandler(item,index){

        ele = document.getElementById(item.model);
        ele.onmouseover = function(){
            document.getElementById("data").removeAttribute("hidden");
            document.getElementById("name").innerHTML = item.name;
            document.getElementById("model").innerHTML = item.model;
            document.getElementById("price").innerHTML = item.price;
            document.getElementById("year").innerHTML = item.year;
        }

    }
};