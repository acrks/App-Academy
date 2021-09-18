Function.prototype.myBind = function(ctx) {
    // using fat arrow
    return () => this.apply(ctx)
};


Function.prototype.myOtherBind = function(ctx) {
    // not using fat arrow
    // let that = this;

    // return function() {
    //     // that is now accessable in here where this is not
    //     // but it's ok because that is now equal to this
    //     return that.apply(ctx);
    // };

    let that = this;

    return function () {
       return that.apply(ctx)
    };
};

function Cat(name) {
    this.name = name;
};

function meow() {
    return this.name + ' is meowing...';
}

let nemo = new Cat('Captain Nemo');

const mewoFuncBoundWithNemo = meow.myOtherBind(nemo)

console.log(mewoFuncBoundWithNemo());
