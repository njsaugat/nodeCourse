const person={
    name:'max',
    age:23,
    greet:function(){// here we have to kinda use the greet function with the keyword function because function expression wont bind the this method
        console.log(`hi I am ${this.name} `)
    }
}


// person.greet();
const hobbies=['Sports','Cooking'];
// for(let hobby of hobbies){
//     console.log(hobby);
// }

hobbies.map(hobby=>console.log('Hobby is '+ hobby))

hobbies.push('Programming');
console.log(hobbies);

// the reason we can change or modify the content type of the array even by declaring the array as const is because that
// the array is a reference type ie like tyo array ma vanera point garyo tara tesko content paxi chai change garna milyo tara 
// array bata object ma chai convert hudaina tara like value chai extra rakhna chai milxa
// this is because pointing is chai to array;
// ani tyo array ko value ma chai changes garna milyo


