const object={
    name:'sam',
    age:32,
    hasHobbies:true
}

// const name ={name};
function destructurung({name}){
    console.log(name);
}

destructurung(object);

// I could have simply used other way to destructure the stuff like this:
const {name,age,hasHobbies}=object;
console.log(name);
console.log(age);
console.log(hasHobbies);

