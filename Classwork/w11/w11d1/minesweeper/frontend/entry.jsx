import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/Game'

function Root() {
    return (
        <div className="master">
            <Game />
        </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    ReactDOM.render(<Root />, root);
});