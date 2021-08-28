// Write a sum function that takes any number of arguments:

console.log(otroSum(1, 2, 3, 4));
console.log(otroSum(1, 2, 3, 4) === 10);
console.log(otroSum(1, 2, 3, 4, 5))
console.log(otroSum(1, 2, 3, 4, 5) === 15);
// Solve it first using the arguments keyword, then rewrite your solution to 
// use the ... rest operator.

// function sum() {
//     let sum = 0;
//     for(let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }
//     return sum;
// }

function otroSum(...args) {
    let sum = 0;
    args.forEach(el => {
        sum += el;
    })
    return sum;
}