// function curriedSum(numArgs) {
//     let numbers = [5];

//     function _curriedSum(num) {
//         numbers.push(num)

//         if (numbers.length === numArgs) {
//             let sum = 0

//             numbers.forEach(el => {
//                 sum += el
//             });
//             return sum;
//         } else {
//             return _curriedSum;
//         }
//     }
//     return _curriedSum;
// }

// console.log(curriedSum(4));
// console.log(sum(5)(30)(20)(1));


Function.prototype.curry