const name='max'

console.log(name);
const hasHobbies=true;

// function summerizeUser(userName,userAge,userHasHobby){
//     return(
//         'Name is '+userName+
//         ', age is '+userAge+
//         ', and the user has hobbies as '+ userHasHobby
//     );
// }

const summerizeUser=(userName,userAge,userHasHobby)=>{
    return(
        'Name is '+userName+
        ', age is '+userAge+
        ', and the user has hobbies as '+ userHasHobby
    );
}

// console.log()
const add=(a,b)=>(a+b)
console.log(add(2,4));
const addRandom=()=>1+2;
console.log(addRandom());
console.log(summerizeUser(name,34,'cycling'));