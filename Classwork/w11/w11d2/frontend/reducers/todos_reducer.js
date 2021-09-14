import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_Actions";

const todosReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState)
    switch (action.type) {
        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo
            return newState;
        case RECEIVE_TODOS:
            for(let i = 0; i < action.todos.length; i++) {
                let indi_action = action.todos[i]
                newState[indi_action.id] = indi_action
            }
            return newState;
        default:
            return oldState

    }
}

export default todosReducer;