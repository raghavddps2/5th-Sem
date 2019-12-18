console.log("hi")

function calculate(){

    var price = document.getElementById("sel1").value;
    var qty = document.getElementById("qty").value;

    var ans = price*qty;
    alert("Payable amount: " + ans)
    console.log(ans)
    document.getElementById("ans").removeAttribute("hidden")
    document.getElementById("res").innerHTML = ans;
}