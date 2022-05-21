// const confirm=true;
const confirm=false;
const value=new Promise((resolve,reject)=>{
    if(confirm){
        resolve('hello! are you fine')
    }else{
        reject('Maile bharne haina ni ta');
    }
})

value
.then((text)=>(console.log(text)))
.catch((error)=>(console.log(error)))