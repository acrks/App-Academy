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
  
  const clock = new Clock();