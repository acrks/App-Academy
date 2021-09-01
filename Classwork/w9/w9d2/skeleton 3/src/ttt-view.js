class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
  }

  setupBoard() {
    const ul = document.createElement("ul");
    let that = this;
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        const li = document.createElement("li");
        li.setAttribute("value", `${i} ${j}`);
        li.addEventListener("click", function(event) {
            event.target.style.background = "#ffffff";
            that.makeMove(li)            
        });
        ul.append(li);
      }
    }
    this.el.append(ul);
  }

  makeMove(square) {
    if(square.innerHTML) {
      alert("Move was invalid")
    }
    else {
      square.innerHTML = this.game.currentPlayer.toUpperCase();
      if(this.game.currentPlayer === 'x') {
        square.style.color = "#db0902";
      }
      else {
        square.style.color = "#2802bf";
      }
      const moveToPlay = square.getAttribute("value");
      this.game.playMove(moveToPlay.split(" "));
    }
    const chickenDinner = this.game.winner();
    if(chickenDinner) {
      this.winner()
    }
  }
  
  winner() {
    this.game.swapTurn();
    const winningMessage = document.createElement("h1")
    winningMessage.innerHTML = `CONGRATULATIONS ${this.game.currentPlayer.toUpperCase()}, YOU WON!!!!`
    this.el.append(winningMessage);
    const elements = this.el.querySelector('ul')
    for(let i = 0; i < elements.children.length; i++) {
      if(elements.children[i].innerHTML === this.game.currentPlayer.toUpperCase()) {
        elements.children[i].style.color = "#ffffff"
        elements.children[i].style.background = "#099e02"
      }
    }
  }

}// end of the class

module.exports = View;
