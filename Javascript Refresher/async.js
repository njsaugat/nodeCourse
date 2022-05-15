function value(){
    const truth=false;
    return new Promise((resolve,reject)=>{
        if(truth){
            resolve('hello we can do it ');
        }else{
            reject('error occured');
        }
    })
}

async function getValue(){
    try{
        const text=await value();
        console.log(text);
    }
    catch{
        // const errtext=await value();
        // console.log(errtext)
        console.log(new Error);
        console.log(new Error)
    }
}

getValue();
