// We create this function to set the inner html to some value.
function set(a,b){
    document.getElementById(a).innerHTML = b
}

//We create this one to get the corresponding innerHTML value
function get(a){
    return parseInt(document.getElementById(a).value)
}

//We create this one to get the concatentaion of a,b
function cat(a,b){
    return (a+b).toString()
}

// This is just to validate the usn.
function check(){
    usn = document.getElementById('usn').value
    if(usn.length != 10){
        return false
    }
    else{
        return true
    }
}

// #This is just to display the displayGrade.
function displayGrade(i){
    val = get(cat("sub",i))
    if(val >=100){
        set(cat("res",i),"Invalid Marks")
    }
    else if(val >=90){
        set(cat("res",i),"Grade: S+")
    }
    else if(val >=80){
        set(cat("res",i),"Grade: S")
    }
    else if(val >=70){
        set(cat("res",i),"Grade: A")
    }
    else if(val >=60){
        set(cat("res",i),"Grade: B")
    }
    else if(val >=50){
        set(cat("res",i),"Grade: C")
    }
    else if(val >=40){
        set(cat("res",i),"Grade: D")
    }
    else{
        set(cat("res",i),"Grade: F")
    }
}

// #This is the main display function used.
function display(){
    if(check()){    
        for(var i=0;i<3;i++){
            displayGrade(i+1)
        }
    }
    else{
        set("res1","Invalid USN")
    }
}