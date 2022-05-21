function adder(a,...b){// this is the rest operator; the b will be evalueated as an array 
    console.log(b);// so yeah b is array;
    let sum=0;//let is used so we can change
    b.forEach(e=>sum+=parseInt(e));
    console.log(sum+a);
    // console.log(parseInt(a)+parseInt(b));
    // console.log()
}

adder(1,3,3,3);

const array=[2,342,342,342234];

const copyArray=[...array];// mostly used wala method

console.log(copyArray)
array[2]=65667;
console.log(array)
console.log(copyArray)

const copiedArray2=array.slice();// another method  to copy an array;
console.log(copiedArray2);
array[2]=3244645623342;
console.log(array);
console.log(copiedArray2);
// using spread operator we can create a deep copy 
// here since we have the spread operator it also kinda works like 
// creating a deep copy

// spread operator works on both array and object


const toArray=(...args)=>{// this is rest operator
    // return {...args};
    return [...args];// this is spread operator both uding at once
}

console.log(toArray(1,2,3,4,5,5))