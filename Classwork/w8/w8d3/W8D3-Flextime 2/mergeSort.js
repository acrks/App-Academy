Array.prototype.mergeSorte = function(callback) {
    if (this.length <= 1) {
        return this;
    };

    let mididx = Math.floor(this.length / 2);

    let left = this.slice(0, mididx);
    let right = this.slice(mididx);

    let leftSorted = left.mergeSorte(callback);
    let rightSorted = right.mergeSorte(callback);

    return merge(leftSorted, rightSorted, callback);
};

function merge(left, right, callback) { 
    let array = [];

    while (left.length !== 0 && right.length !== 0) {
        if (callback(left[0], right[0])) {
            array.push(left.shift());
        } else {
            array.push(right.shift());
        };
    };

    array = array.concat(left, right);
    return array; 

};

let myArr = [2, 3, 4, 5, 6, 10, -3, 3];

console.log(myArr.mergeSorte((num1, num2) => {

    if (num1 < num2) {
        return true;
    };

    return false;
}));

