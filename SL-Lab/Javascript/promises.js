let p = new Promise((resolve,reject)=>{

    let a = 1+2;
    if (a == 2){
        resolve('Successful');
    }
    else{
        reject('Failed to do so');
    }
});

p.then((message) =>{
    console.log('This is in the then '+message);
}).catch((message) => {
    console.log('This is in the catch '+message);
});