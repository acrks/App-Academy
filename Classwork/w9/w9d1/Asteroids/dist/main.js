/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nfunction Asteroid(pos, game) {\n    // MovingObject({pos, DEFAULTS.COLOR, DEFAULTS.RADIUS, Util.randomVec(10)});\n    let options = { pos: pos, \n        vel: Util.randomVec(DEFAULTS.VEL), \n        radius: DEFAULTS.RADIUS, \n        color: DEFAULTS.COLOR,\n        game: game\n    };\n    console.log(options);\n    MovingObject.call(this, options);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nconst DEFAULTS = {    \n    COLOR: \"#ede85f\",\n    RADIUS: 10,\n    VEL: 4\n}\n\nconst testA = new Asteroid( [30, 30] );\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack://Asteroids/./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\n\nfunction Game() {\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nconst DEFAULTS = {    \n    DIM_X: 1000,\n    DIM_Y: 600,\n    NUM_ASTEROIDS: 10\n}\n\nGame.prototype.addAsteroids = function() {\n    for(let i = 0; i < DEFAULTS.NUM_ASTEROIDS; i++) {\n        let astie = new Asteroid(this.randomPosition(), this);\n        this.asteroids.push(astie);\n    }\n}\n\nGame.prototype.randomPosition = function() {\n    return [Math.floor(Math.random() * DEFAULTS.DIM_X),\n        Math.floor(Math.random() * DEFAULTS.DIM_Y)]//an array\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0,0,DEFAULTS.DIM_X, DEFAULTS.DIM_Y);\n    for(let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx)\n    }\n}\n\nGame.prototype.moveObjects = function () {\n    // console.log(this.asteroids, \" this is the asteroids array\")\n    for(let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].move()\n    }\n}\n\n\nGame.prototype.wrap = function(pos) {\n    let x = pos[0];\n    let y = pos[1];\n\n    if (y > DEFAULTS.DIM_Y){\n         y = 0;\n     }\n     if (y < 0){\n        y = DEFAULTS.DIM_Y;\n     }\n     if (x > DEFAULTS.DIM_X) {\n        x = 0;\n     } \n     if (x < 0) {\n        x = DEFAULTS.DIM_X;\n     }\n     return [x,y];\n}\n\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack://Asteroids/./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    let that = this;\n    setInterval(() => {\n        this.game.draw(this.ctx);\n        this.game.moveObjects();\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack://Asteroids/./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\n\n\n\nconsole.log(\"Webpack is working!\");\n\n//Ready function - on load will execute\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n    const canvas = document.getElementById(\"game-canvas\");\n    canvas.width = 1000;\n    canvas.height = 600;\n\n    const ctx = canvas.getContext(\"2d\");\n    const gv = new GameView(ctx);\n    gv.start();\n    // for testing purposes\n    window.ctx = ctx;\n    window.canvas = canvas;\n});\n\n\n\n\n\n\n//# sourceURL=webpack://Asteroids/./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options){\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] ++;\n    this.pos[1] ++;\n    this.vel[0] ++;\n    this.vel[1] ++;\n    this.pos = this.game.wrap(this.pos);\n}\n\nconst mo = new MovingObject({\n    pos: [30, 30],\n    vel: [10, 10],\n    radius: 5,\n    color: \"#00FF00\"\n});\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack://Asteroids/./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }, \n\n  inherits(childClass, parentClass) {\n      function Surrogate() {};\n      Surrogate.prototype = parentClass.prototype;\n      childClass.prototype = new Surrogate();\n      childClass.prototype.constructor = childClass;\n  }\n};\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack://Asteroids/./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;