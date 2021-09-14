import React from "react";

class Tile extends React.Component {
    constructor(props) {
        super(props);
        const { bombed, explored, flagged } = this.props.tile;
        this.bombed = bombed;
        this.explored = explored;
        this.flagged = flagged;
        this.handleClick = this.handleClick.bind(this)
    }

    handleClick(e) {
        const flagged = e.altKey ? true : false
        // console.log(this.props)
        this.props.updateGame(this.props.tile, flagged)
    }

    render() {
        let label = '';
        let result = 'tile';

        const tile = this.props.tile
        // User clicks on tile
        if(tile.explored) 
        {
            // If tile is a bomb
            if(tile.bombed) 
            {
                label = '💣';
                result = 'tile bombed'
            }
            else 
            {
                result = 'tile explored'
                let bombCount = tile.adjacentBombCount();
                if (bombCount > 0) 
                {
                    label = bombCount;
                }
            }
        }    
        else if(tile.flagged) 
        {
            label = '⚑';
            result = 'tile flagged';
        }
        
        return (
            <div className={result} onClick={this.handleClick}>
                {label}
            </div>
        );
    }
}

export default Tile;