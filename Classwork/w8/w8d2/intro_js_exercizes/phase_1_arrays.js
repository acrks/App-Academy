// console.log([1,12,3,4,2,3,4,3,3,3,4,5,5].uniq())

// function uniq(arr) {
//     let result = [];
//     for (let i = 0;i < arr.length; i++) { // might need 'let' in front of i = 0
//         if (!result.includes(arr[i])) {
//             result.push(arr[i])
//         }
//     }

//     return result;
// }

// let arr1 = [1,12,3,4,2,3,4,3,3,3,4,5,5]

// console.log(uniq(arr1))

// function Array() {

// }

Array.prototype.uniq = function () {
    var newarr = [];
    for (let i = 0;i < this.length; i++) { // might need 'let' in front of i = 0
        if (!newarr.includes(this[i])) {
            newarr.push(this[i]);
        }
    }
    return newarr;
    // return "hello";
    // return this;
}

// let arr1 = [1,12,3,4,2,3,4,3,3,3,4,5,5];
// console.log(arr1.uniq());


Array.prototype.twoSum = function () {
    var pairs = [];
    for (let i1 = 0; i1 < this.length; i1++) {
        for (let i2 = i1 + 1; i2 < this.length; i2++) {
            if (this[i1] + this[i2] === 0) {pairs.push([i1, i2])}
        }
    }
    return pairs;
}

// let arr2 = [-5,-1,1,17,-16,5]
// console.log(arr2.twoSum());

Array.prototype.transpose = function ()  {
    var result = [];
    for (let i1 = 0; i1 < this[0].length; i1++) {
        var row = [];
        for (let i2 = 0; i2 < this.length; i2++) {
            row.push(this[i2][i1]);
        }
        result.push(row);
    }
    return result;
}

// let arr3 = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]
// console.log(arr3.transpose())