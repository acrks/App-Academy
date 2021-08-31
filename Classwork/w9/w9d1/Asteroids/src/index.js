const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const GameView = require("./game_view.js")
const Game = require("./game.js")

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;



console.log("Webpack is working!");

//Ready function - on load will execute
document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("game-canvas");
    canvas.width = 1000;
    canvas.height = 600;

    const ctx = canvas.getContext("2d");
    const gv = new GameView(ctx);
    gv.start();
    // for testing purposes
    window.ctx = ctx;
    window.canvas = canvas;
});




