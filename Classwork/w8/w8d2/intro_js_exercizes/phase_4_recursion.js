function range(start, end) {
    if (start > end) {
        return [];
    }
    return [start].concat(range(start +1, end))
}

// console.log(range(5, 10))

function sumRec(arr) {
    if (arr.length <= 0) {return 0;}
    return arr[0] + sumRec(arr.slice(1, arr.length))
}

// arr1 = [5,2,3,4,5]
// console.log(sumRec(arr1))

function exponent(base, exp) {
    if(exp === 0) {
        return 1;
    }
    else if(exp % 2 === 0) {
        return exponent(base, exp / 2) ** 2;
    }
    else {
        return base * (exponent(base, (exp - 1) / 2) ** 2);
    }
}

// console.log(exponent(2,5));
// console.log(exponent(3,4));

function fibonacci(n) {
    if(n===1) {
        return [0];
    } 
    if(n===2) {
        return [0,1];
    }
    const myVar = fibonacci(n-1);
    return myVar.concat(myVar[myVar.length-1] + myVar[myVar.length-2]);
}

// console.log(fibonacci(6));

function deepDup(arr) {
    let myarr = [];
    for (let i=0; i < arr.length; i++) {
        if (Array.isArray(arr[i])) {
            // console.log("is an array!");
            myarr = myarr.concat(deepDup(arr[i]));
        } else {
            myarr.push(arr[i]);
            // console.log(myarr);
        }
    }
    return myarr;
}

// let arr1 = [1,[2,3,6],4,5];
// let arr2 = deepDup(arr1);
// console.log("--result--");
// console.log(arr2);
// arr1.push(6);
// console.log(arr1);
// console.log(arr2);


function bsearch(arr, target) {
    if (!arr.length) {return -1}

    let mid = Math.floor(arr.length / 2)
    let left = arr.slice(0, mid)
    let right = arr.slice(mid + 1)
    
    if (arr[mid] === target) {
        return mid;
    } else if (target < arr[mid]) {
        let leftVal = bsearch(left, target);
        return leftVal;
    } else {
        let rightVal = bsearch(right, target);
        if (rightVal === -1) {return -1}
        else {return rightVal + mid + 1};
    }
}

arr1 = [1,2,3,4,5,6]
console.log(bsearch(arr1, 5))


function mergesort(arr) {
    if (arr.length <= 1) 
    {
        return arr
    }

    let mid = Math.floor(arr.length / 2);
    let left = arr.slice(0, mid);
    let right = arr.slice(mid);

    let leftSorted = mergesort(left);
    let rightSorted = mergesort(right);
    return joinArrays(leftSorted, rightSorted);
}

function joinArrays(arr1, arr2) {
    let result = [];
    while (arr1.length && arr2.length) {
        if (arr1[0] < arr2[0]) {
            result.push(arr1.shift());
        } else {
            result.push(arr2.shift());
        };
    };
    return result.concat(arr1, arr2)
}

// let arr = [453,23,6755,75,3,4,6,0,7];
// console.log(mergesort(arr))