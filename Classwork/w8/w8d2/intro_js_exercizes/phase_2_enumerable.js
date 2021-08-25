
// Array#myEach(callback) - receives a callback function and 
// executes the callback for each element in the array

Array.prototype.myEach = function (callback) {
    var newarr = [];
    for (let i = 0;i < this.length; i++) { // might need 'let' in front of i = 0
            newarr.push(callback(this[i]));
    }
    return newarr;
}

const myHash = function(el) {
    return (el *= 2) + 1
}

// let arr = [4,5,6,12,34,90]
// console.log(arr.myEach(myHash));

    // const double = function(el) {
    //     return el * 2;
    // }
    // const decade = function (el) {
    //     return el * 10;
    // }
    // const century = function (el) {
    //     return el * 100;
    // }
    // function doMathWithNumber(num, method) {
    //     return method(num)
    // }

Array.prototype.myMap = function (callback) {
    var newarr = [];
    for (let i = 0;i < this.length; i++) { // might need 'let' in front of i = 0
            newarr.push(callback(this[i]));
    }
    return newarr;
}

let arr = [4,5,6,12,34,90]
// console.log(arr.myMap(myHash));

Array.prototype.myReduce = function (callback, initialValue = this[0]) {
    for(let i = 0; i < this.length; i++) {
        initialValue = callback(initialValue, this[i]);
    }
    return initialValue;
}

// without initialValue
let new_num = [1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  });
   // => 6

console.log(new_num)
   
  // with initialValue
let new_num2 = [1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }, 25); // => 31

console.log(new_num2)


