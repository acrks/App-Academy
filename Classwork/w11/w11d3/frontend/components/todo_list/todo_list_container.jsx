import {connect} from "react-redux"
import { removeTodo } from "../../actions/todo_Actions";
import TodoList from "./todo_list"
const mapStateToProps = state => ({
    todos: allTodos(state)
  });
  
const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: todo => dispatch(removeTodo(todo))
});
  
export default connect(mapStateToProps,mapDispatchToProps)(TodoList);