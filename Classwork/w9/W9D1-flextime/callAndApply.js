// myApply with args passed in at call time
Function.prototype.myApply = function (ctx, args = []) {
    return this.bind(ctx)(...args);
};

// myApply with args passed in at bind time
Function.prototype.myApply = function (ctx, args = []) {
    return this.bind(ctx, ...args)();
};

// myCall with args passed in at call time
Function.prototype.myCall = function (ctx, ...args) {
    return this.bind(ctx)(...args);
};

// myCall with args passed in at bind time
Function.prototype.myCall = function (ctx, ...args) {
    return this.bind(ctx, ...args)();
};

let arr = [1, 2, 3]

arr.
