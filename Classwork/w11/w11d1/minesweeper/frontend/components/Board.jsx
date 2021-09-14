import React from "react";
import Tile from "./Tile";

class Board extends React.Component {
    render() {
        return (
            <>
                {this.props.board.grid.map((row, i) => (
                    <div className="row" key = {i}>{row.map((tile, j) => (
                        <div key = {j}><Tile tile ={tile} updateGame = {this.props.updateGame}/></div>))}
                    </div>
                ))}
            </>
        )
    }
}

export default Board