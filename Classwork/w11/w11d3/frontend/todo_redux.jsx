import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_Actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';
import allTodos from './reducers/selectors';
import Root from "./components/Root"

import configureStore from './store/store';

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
    window.allTodos = allTodos
    ReactDOM.render(<Root store={store} />, root)
})