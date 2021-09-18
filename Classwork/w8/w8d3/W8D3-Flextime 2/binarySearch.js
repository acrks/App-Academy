function binarySearch(arr, target) {

    if (arr.length === 0) return -1;

    let mid = Math.floor(arr.length / 2);

    if (arr[mid] === target) {
        // Checking our middle
        return mid;
    } else if (arr[mid] > target) {
        // Checking left side
        let left = arr.slice(0, mid)
        return binarySearch(left, target);
    } else if (arr[mid] < target) {
        // Checking right side
        let right = arr.slice(mid+1)
        let searchResult = binarySearch(right, target)

        if (searchResult === -1) {
            return -1;
        } else {
            return searchResult + mid + 1;
        };

        // return (searchResult === -1) ? -1 : searchResult + mid + 1
    }

};

let myArr = [1, 2, 3, 4, 5, 6, 7, 8];

console.log(binarySearch(myArr, -4)) // => -1