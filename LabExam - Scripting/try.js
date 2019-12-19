// let x = function(){
    
//     p = 10
//     if (p == 10){

//         console.log(v)
//         // console.log(c)

//         var v = 10
//         let c = 20

//         console.log(v)
//         console.log(c)
//     }

//     console.log(v)
//     // console.log(c)
// }
// // x()

// // console.log(v)
// // console.log(c)

// // So, let has the block scope, whereas var has functional scope
// // Moreover, var gets hoisted(ki uoar pta chal jaega ki kuch declare hua hai), let is not hoisted.

// const c = 1
// // c = 2 //NOt allowed, re assignment is not allowed.

// //Null and undefined.
// // console.log(typeof(null)) --> Object 
// // console.log(typeof(undefined))--> undefined
// var ca
// console.log(ca)
// var pa = null
// console.log(pa)

// //function declaration and function expression

// funcD()
// // funcE()
// function funcD(){
//     console.log("This is function declaration");
// }

// var funcE = function(){
//     console.log("This is function expression")
// }

// funcD()
// funcE()

// # Explaining promises.
    // promises are nothing but when we have an async call, we wanna do something after it is done in callback, if it
    // again has some ajax call and so on.. the function kinda becomes hell, so promises simplify these problems.

    //# Explaing closures. when functions are returning functions.
    let obj = function() {
        let i = 0;
        return {
            setI(k){
                i = k;
            },
            getI(){
                return i;
            }
        }
    }

    let x = obj()
    x.setI(10)
    console.log(x.getI())
    