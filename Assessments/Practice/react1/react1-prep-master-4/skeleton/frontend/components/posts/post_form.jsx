import React from 'react';

/*
Export a `PostForm` presentational component that creates a form to either
create or edit a post (it will be used by two separate containers). The form
should indicate whether it is a create or edit form based on the `formType`
prop. The form should initialize state to the `post` passed in from props. Use
controlled inputs and trigger the `action` passed in from the container upon
submission. Use a text input for the title and a textarea for the body.
*/

class PostForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = this.props.post
        this.handleChange = this.handleChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleChange(field) {
        return e=> {
            this.setState({[field]: e.currentTarget.value})
        }
    }

    handleSubmit() {
        this.props.action(this.state)
    }
    
    render() {
        return (
        <form onSubmit= {this.handleSubmit}>
            <h1>{this.props.formType}</h1>
            <label>Title
                <input type = "text" value = {this.state.title} onChange = {this.handleChange('title')}/>
            </label>
            <label>Body
                <textarea value = {this.state.body} onChange = {this.handleChange('body')}/>
            </label>
            <input type = "submit" value = {this.props.formType} />
        </form>)
    }
}

export default PostForm
