import React from "react";

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        console.log(this.props.receiveTodo)
        this.state = {
            id: this.uniqueId(),
            title: "",
            body: "",
            done: false,
        }
        this.updateTitle = this.updateTitle.bind(this)
        this.updateBody = this.updateBody.bind(this)
        this.updateCompleted = this.updateCompleted.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    uniqueId() {
        return new Date().getTime();
      }

    updateTitle(e) {
        this.setState({title:e.target.value})
    }

    updateBody(e) {
        this.setState({body:e.target.value})
    }

    updateCompleted(e) {
        this.setState({body:e.target.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.receiveTodo(this.state)
    }

    render() {
        return (
            <form onSubmit = {this.handleSubmit}>
                <h2>Add a Todo</h2>
                <label>Title:<br/ >
                    <input type = "text" value = {this.state.title} onChange = {this.updateTitle}/>
                </label>
                <br/>
                <br/>
                <label>Body:<br/ >
                    <input type = "text" value = {this.state.body} onChange = {this.updateBody}/>
                </label>
                <br/>
                <br/>
                <button>Submit</button>
            </form>
        )
    }
}

export default TodoForm