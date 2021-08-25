Array.prototype.bubbleSort = function () {
    var newarr = this;
    var sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < newarr.length - 1; i++) {
            if (newarr[i] > newarr[i + 1]) {
                const temp1 = newarr[i]
                const temp2 = newarr[i + 1]
                newarr[i] = temp2
                newarr[i + 1] = temp1
                // newarr[i], newarr[i + 1] = newarr[i + 1], newarr[i];
                sorted = false;
            }
        }
    }
    return newarr;
}

// arr1 = [5,3,5,67,8,5,4,3,5,65,4];
// console.log(arr1.bubbleSort());

String.prototype.substrings = function () {
    var newstr = this;
    var subs = [];
    for (let i = 0; i < this.length; i++) {
        for (let i2 = i+1; i2 < this.length; i2++) {
            subs.push(newstr.slice(i, i2));
        }
    }
    return subs;
}

// str1 = "catalksls;dft"
// console.log(str1.substrings())