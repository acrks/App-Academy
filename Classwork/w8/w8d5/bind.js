Function.prototype.myBind = function (...args) {
    
    // let args = Array.from(arguments)
    let that = this;

    // with arguments
    // return function () {
    //     let ctx = args.shift();
    //     // args.forEach(arg => that.call(arg));
    //     that.apply(ctx, args);
    // };

    // with ...rest
    
    return function () {
        let ctx = args.shift();
        that.call(ctx, ...args);
    };
};

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");
  
  markov.says.myBind(pavlov, "meow", "Kush")();