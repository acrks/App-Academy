import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos } from './actions/todo_Actions';
import configureStore from './store/store';


function Root() {
    return (
        <div>
            <h1>Todos App</h1>
        </div>
    )
}


document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById("root")
    window.receiveTodo = receiveTodo
    window.receiveTodos = receiveTodos
    const store = configureStore()
    window.store = store
    ReactDOM.render(<Root />, root)
})