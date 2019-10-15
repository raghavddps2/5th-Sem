//The window.onload is executed as soon as the entire page is loaded into the browser.
window.onload = function(){

    var jsonData = [
        {
            "name":"Audi",
            "model":"Audi R8",
            "year":"2018",
            "price": 1200000
        },
        {
            "name":"Santro",
            "model":"Santro s8",
            "year":"2017",
            "price": 12000
        },
        {
            "name":"Polo",
            "model":"Polo sports",
            "year":"2019",
            "price": 120000
        }
    ];

    // This function is executed for each entry in the json array.
    jsonData.forEach(function(item){
        element = document.createElement("th")
        element.id = item.name
        element.innerHTML = item.model
        document.getElementById("menu").appendChild(element)
    })

    //The function mouseOverhandler is bounded to this.
    jsonData.forEach(mouseOverHandler)
    function mouseOverHandler(item){
        var elem = document.getElementById(item.name)
        // #The function gets executed only on mouse hover
        elem.onmouseover = function(){
            document.getElementById("table-data").removeAttribute("hidden")
            document.getElementById("price").innerHTML = item.price
            document.getElementById("model").innerHTML = item.name
            document.getElementById("year").innerHTML = item.year
        }
    }
}
console.log("hi")