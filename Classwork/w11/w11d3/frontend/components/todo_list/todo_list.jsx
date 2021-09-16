import React from 'react'
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'

const TodoIndex = (props) => {
    // const {todos} = props.todos
    return (
        <div>
            <h1>Here are your to dos</h1>
            <ul>
                {props.todos.map((todo) => 
                <TodoListItem key = {todo.id} todo = {todo}/>
                )}
            </ul>
            <TodoForm receiveTodo = {props.todos.receiveTodo}/>
        </div>
    )
}

export default TodoIndex