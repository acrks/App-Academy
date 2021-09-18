import React from 'react';
import ReactDOM from 'react-dom';

function Root() {
    return (
        <div>
            <h1>React 1-Up</h1>
        </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    ReactDOM.render(<Root />, root);
});