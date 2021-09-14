import React from 'react';
import * as Minesweeper from './minesweeper'
import Board from './board'

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = { board: new Minesweeper.Board(5, 2) };
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile, flagged) {
        if(flagged) {
            tile.toggleFlag()
        }
        else {
            tile.explore()
        }
        this.setState({ board: this.state.board })
    }

    restartGame() {
        this.setState({ board: new Minesweeper.Board(5, 2) });
    }

    render() {
        const button = <button onClick={this.restartGame}>Restart Game</button>
        if (this.state.board.won() || this.state.board.lost()) {
            let message = "";
            if(this.state.board.won()) {
                message = "Congratulations, You Won!"
            }
            else {
                message = "Sorry, you swept a mine :("
            }
            return (
                <div className = "message">
                    {message}<br /><br />
                    {button}
                </div>
                )
        } 
        else {
            return(
                <div className = "game">
                    <h2>Minesweeper</h2>
                    <p/>Click to explore a tile.<br/>Alt + click to flag a tile.<p/>
                    <Board board={this.state.board} updateGame={this.updateGame} />
                </div>
            );
        }
    }
}

export default Game;