const Game = require("./game");

function GameView(ctx) {
    this.game = new Game();
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    let that = this;
    setInterval(() => {
        this.game.draw(this.ctx);
        this.game.moveObjects();
    }, 20);
}

module.exports = GameView;