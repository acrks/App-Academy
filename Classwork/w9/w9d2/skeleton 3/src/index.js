const View = require("./ttt-view");
const Game = require("../ttt_node/game");

document.addEventListener("DOMContentLoaded", () => {
  const newGame = new Game();
  const ttt = document.querySelector('.ttt');
  const newView = new View(newGame, ttt);
});
