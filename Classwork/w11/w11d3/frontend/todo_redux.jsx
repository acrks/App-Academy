import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_Actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';

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
    window.removeTodo = removeTodo
    window.receiveStep = receiveStep
    window.receiveSteps = receiveSteps
    window.removeStep = removeStep

    const store = configureStore()
    window.store = store
    ReactDOM.render(<Root />, root)
})