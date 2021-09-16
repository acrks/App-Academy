import React from "react"

const allTodos = (state) => 
{
    return Object.values(state.todos)
}

export default allTodos