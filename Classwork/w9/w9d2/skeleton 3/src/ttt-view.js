class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
  }

  setupBoard() {
    const ul = document.createElement("ul");
    ul.style.display = "flex";
    ul.style.width = "456px";
    ul.style.flexWrap = "wrap";

    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        const li = document.createElement("li");
        li.setAttribute("value", [i, j]);
        li.style.listStyleType = "none";
        li.style.border = "1px solid #000000";
        li.style.width = "150px";
        li.style.height = "150px";
        li.style.background = "#808080";
        li.addEventListener("mouseover", function (event) {
          event.target.style.background = "#ffff00";

          setTimeout(function() {
            event.target.style.background = "#808080";
          }, 300);
        });
        ul.append(li);
      }
    }
    this.el.append(ul);
    
  }
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
