class Clock {
    constructor() {
      // 1. Create a Date object.
      const date1 = new Date('August 26, 2021 03:24:00');
        // 2. Store the hours, minutes, and seconds
        this.hours = date1.getHours();
        this.minutes = date1.getMinutes();
        this.seconds = date1.getSeconds();
      // 3. Call printTime.
      this.printTime();
      // 4. Schedule the tick at 1 second intervals.
      setInterval(this._tick.bind(this), 1000);
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
        this.seconds++;
        if(this.seconds === 60) {
            this.seconds = 0;
            this.minutes++;
        }
        else if(this.minutes === 60) {
            this.minutes = 0;
            this.hours++;
        }
        else if(this.hours === 13) {
            this.hours = 1;
        }
        this.printTime();
    }
  }
  
  // const clock = new Clock();

  const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if(numsLeft > 0){
    reader.question('Enter a number', (usernum) => {
      const numToAdd = parseInt(usernum);
      sum += numToAdd;
      console.log(`partialSum: ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    })
  } else {
    completionCallback(sum);
    reader.close()
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.
    reader.question(`Is ${el1} greater than ${el2}? Type yes or no: `, (userResponse) => {
        if(userResponse === "yes") {
            callback(true);
        }
        else {
            callback(false);
        }
        reader.close();
    });
  }
  
  // Once you're done testing askIfGreaterThan with dummy arguments, write this.
  function innerBubbleSortLoop(arr, i, madeAnySwaps = false, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    if(i == (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    }
    else{
        // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
        //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
        //    continue the inner loop. You'll want to increment i for the
        //    next call, and possibly switch madeAnySwaps if you did swap.
        askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
            if(isGreaterThan) {
                const temp = arr[i];
                arr[i] = arr[i+1];
                arr[i + 1] = temp;
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
        });
    }
}

innerBubbleSortLoop([12,5,4,44], 0);
  
  // Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
  // Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.
  
  function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
      // Begin an inner loop if you made any swaps. Otherwise, call
      // `sortCompletionCallback`.
    }
  
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
  }
  
  absurdBubbleSort([3, 2, 1], function(arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
  });
