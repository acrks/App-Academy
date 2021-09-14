import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from "../actions/todo_Actions";

const todosReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState)
    switch (action.type) {
        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo
            return newState;
        case RECEIVE_TODOS:
            for(let i = 0; i < action.todos.length; i++) {
                let todo = action.todos[i]
                newState[todo.id] = todo
            }
            return newState;
        case REMOVE_TODO: 
            delete newState[action.todo.id];
            return newState;
        default:
            return oldState

    }
}

export default todosReducer;